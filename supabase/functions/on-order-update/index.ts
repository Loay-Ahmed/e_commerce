// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

// Setup type definitions for built-in Supabase Runtime APIs
import { createClient } from 'npm:@supabase/supabase-js@2'
import { JWT } from 'npm:google-auth-library@9'
import serviceAccount from '../service-account.json' with { type: 'json' }

// Define your table structure based on your actual database schema
interface OrdersTable {
  id: string
  created_at: string
  order_number: string
  order_date: string
  order_price: string
  order_tracking: boolean
  order_tracking_date: string
  order_accepted: boolean
  order_accepted_date: string
  order_shipped: boolean
  order_shipped_date: string
  order_out_for_delivery: boolean
  order_out_for_delivery_date: string
  order_delivered: boolean
  order_delivered_date: string
  for_user: string
}

interface WebhookPayload {
  type: 'UPDATE'
  table: string
  record: OrdersTable
  schema: 'public'
  old_record: OrdersTable // This contains the old values before update
}

const supabase = createClient(
  Deno.env.get('SUPABASE_URL')!,
  Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')! // add security to this env
)

Deno.serve(async (req) => {
  try {
    console.log('SUPABASE_URL:', Deno.env.get('SUPABASE_URL'))
    console.log('SUPABASE_SERVICE_ROLE_KEY exists:', !!Deno.env.get('SUPABASE_SERVICE_ROLE_KEY'))
    console.log('SUPABASE_ANON_KEY exists:', !!Deno.env.get('SUPABASE_ANON_KEY'))

    const payload: WebhookPayload = await req.json()
    
    console.log('Payload received:', JSON.stringify(payload, null, 2))
    
    // Check which order status changed and only send notification if status changed to true
    let statusChanged = false
    let currentStatus = ''
    let title = ''
    let body = ''
    
    // Check if order_accepted status changed from false to true
    if (payload.record.order_accepted !== payload.old_record.order_accepted && 
        payload.record.order_accepted === true) {
      statusChanged = true
      currentStatus = 'accepted'
      title = '✅ Order Accepted'
      body = `Great news! Your order #${payload.record.order_number} has been accepted and confirmed.`
    }
    // Check if order_shipped status changed from false to true
    else if (payload.record.order_shipped !== payload.old_record.order_shipped && 
             payload.record.order_shipped === true) {
      statusChanged = true
      currentStatus = 'shipped'
      title = '🚚 Order Shipped'
      body = `Your order #${payload.record.order_number} has been shipped and is on its way!`
    }
    // Check if order_out_for_delivery status changed from false to true
    else if (payload.record.order_out_for_delivery !== payload.old_record.order_out_for_delivery && 
             payload.record.order_out_for_delivery === true) {
      statusChanged = true
      currentStatus = 'out_for_delivery'
      title = '🚗 Out for Delivery'
      body = `Your order #${payload.record.order_number} is out for delivery! Please be available to receive it.`
    }
    // Check if order_delivered status changed from false to true
    else if (payload.record.order_delivered !== payload.old_record.order_delivered && 
             payload.record.order_delivered === true) {
      statusChanged = true
      currentStatus = 'delivered'
      title = '🎉 Order Delivered'
      body = `Your order #${payload.record.order_number} has been delivered successfully! Hope you love your purchase.`
    }
    
    // If no status changed to true, return early
    if (!statusChanged) {
      return new Response(JSON.stringify({ 
        message: 'No order status changed to true, no notification sent',
        current_record: payload.record,
        old_record: payload.old_record
      }), {
        headers: { 'Content-Type': 'application/json' },
      })
    }
    
    // Get user's FCM token - Fixed table name from 'users' to match your schema
    const { data, error } = await supabase
      .from('users') // This matches your table name
      .select('fcm_token')
      .eq('user_id', payload.record.for_user) // This matches your column name
      .single()
    
    if (error) {
      console.error('Error fetching user:', error)
      return new Response(JSON.stringify({ 
        message: 'Error fetching user data',
        error: error.message
      }), {
        headers: { 'Content-Type': 'application/json' },
        status: 400,
      })
    }
    
    if (!data || !data.fcm_token) {
      return new Response(JSON.stringify({ 
        message: 'FCM token not found for user',
        user_id: payload.record.for_user
      }), {
        headers: { 'Content-Type': 'application/json' },
        status: 400,
      })
    }
    
    const fcmToken = data.fcm_token as string
    
    // Get Firebase access token
    const accessToken = await getAccessToken({
      clientEmail: serviceAccount.client_email,
      privateKey: serviceAccount.private_key,
    })
    
    // Send FCM notification
    const res = await fetch(
      `https://fcm.googleapis.com/v1/projects/${serviceAccount.project_id}/messages:send`,
      {
        method: 'POST',
        headers: {
          'Content-Type': 'application/json',
          Authorization: `Bearer ${accessToken}`,
        },
        body: JSON.stringify({
          message: {
            token: fcmToken,
            notification: {
              title: title,
              body: body,
            },
            data: {
              orderId: payload.record.id,
              orderNumber: payload.record.order_number,
              orderStatus: currentStatus,
              userId: payload.record.for_user,
              clickAction: 'order_details',
            },
            android: {
              notification: {
                icon: 'ic_notification',
                sound: 'default',
                channelId: 'order_updates',
              },
              priority: 'high',
            },
            apns: {
              payload: {
                aps: {
                  alert: {
                    title: title,
                    body: body,
                  },
                  sound: 'default',
                  badge: 1,
                },
              },
            },
          },
        }),
      }
    )
    
    const resData = await res.json()
    
    if (res.status < 200 || res.status > 299) {
      console.error('FCM Error:', resData)
      throw resData
    }
    
    return new Response(JSON.stringify({
      success: true,
      message: 'Notification sent successfully',
      status_changed: currentStatus,
      notification_title: title,
      notification_body: body,
      fcm_response: resData
    }), {
      headers: { 'Content-Type': 'application/json' },
    })
    
  } catch (error) {
    console.error('Error in order status notification:', error)
    
    return new Response(JSON.stringify({
      success: false,
      error: error.message || 'Unknown error occurred',
    }), {
      headers: { 'Content-Type': 'application/json' },
      status: 500,
    })
  }
})

const getAccessToken = ({
  clientEmail,
  privateKey,
}: {
  clientEmail: string
  privateKey: string
}): Promise<string> => {
  return new Promise((resolve, reject) => {
    const jwtClient = new JWT({
      email: clientEmail,
      key: privateKey,
      scopes: ['https://www.googleapis.com/auth/firebase.messaging'],
    })
    jwtClient.authorize((err, tokens) => {
      if (err) {
        reject(err)
        return
      }
      resolve(tokens!.access_token!)
    })
  })
}

/* Database Webhook Setup for Supabase:

CREATE OR REPLACE FUNCTION notify_order_status_change()
RETURNS TRIGGER AS $$
BEGIN
  -- Only trigger if any order status field changed
  IF (NEW.order_accepted != OLD.order_accepted OR 
      NEW.order_shipped != OLD.order_shipped OR 
      NEW.order_out_for_delivery != OLD.order_out_for_delivery OR 
      NEW.order_delivered != OLD.order_delivered OR 
      NEW.order_tracking != OLD.order_tracking) THEN
    
    PERFORM net.http_post(
      url := 'https://your-project-ref.supabase.co/functions/v1/on-order-update',
      headers := '{"Content-Type": "application/json", "Authorization": "Bearer YOUR_ANON_KEY"}'::jsonb,
      body := json_build_object(
        'type', 'UPDATE',
        'table', 'orders_table',
        'schema', 'public',
        'record', row_to_json(NEW),
        'old_record', row_to_json(OLD)
      )::jsonb
    );
  END IF;
  
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- Create trigger on orders_table
CREATE TRIGGER order_status_notification_trigger
  AFTER UPDATE ON public.orders_table
  FOR EACH ROW
  EXECUTE FUNCTION notify_order_status_change();

*/

/* To invoke locally:

  1. Run `supabase start` (see: https://supabase.com/docs/reference/cli/supabase-start)
  2. Make an HTTP request:

  curl -i --location --request POST 'http://127.0.0.1:54321/functions/v1/on-order-update' \
    --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0' \
    --header 'Content-Type: application/json' \
    --data '{"name":"Functions"}'

*/
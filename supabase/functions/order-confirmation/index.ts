// Follow this setup guide to integrate the Deno language server with your editor:
// https://deno.land/manual/getting_started/setup_your_environment
// This enables autocomplete, go to definition, etc.

// Setup type definitions for built-in Supabase Runtime APIs
import { createClient } from 'npm:@supabase/supabase-js@2'
import { JWT } from 'npm:google-auth-library@9'
import serviceAccount from '../service-account.json' with { type: 'json' }
// define your table
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
  type: 'INSERT'
  table: string
  record: OrdersTable
  schema: 'public'
  old_record: null | OrdersTable
}
const supabase = createClient(
  Deno.env.get('SUPABASE_URL')!,
  Deno.env.get('SUPABASE_SERVICE_ROLE_KEY')! // add security to this env
)
Deno.serve(async (req) => {
  const payload: WebhookPayload = await req.json()
  const { data } = await supabase
    .from('users')
    .select('fcm_token')
    .eq('user_id', payload.record.for_user)
    .single()
  const fcmToken = data!.fcm_token as string
  const accessToken = await getAccessToken({
    clientEmail: serviceAccount.client_email,
    privateKey: serviceAccount.private_key,
  })
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
            title: `Your order has been confirmed`,
            body:`Order #${payload.record.order_number}`,
          },
        },
      }),
    }
  )
  const resData = await res.json()
  if (res.status < 200 || 299 < res.status) {
    throw resData
  }
  return new Response(JSON.stringify(resData), {
    headers: { 'Content-Type': 'application/json' },
  })
  console.log('SUPABASE_URL:', Deno.env.get('SUPABASE_URL'))
  console.log('SUPABASE_SERVICE_ROLE_KEY exists:', !!Deno.env.get('SUPABASE_SERVICE_ROLE_KEY'))
  console.log('SUPABASE_ANON_KEY exists:', !!Deno.env.get('SUPABASE_ANON_KEY'))
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


/* To invoke locally:

  1. Run `supabase start` (see: https://supabase.com/docs/reference/cli/supabase-start)
  2. Make an HTTP request:

  curl -i --location --request POST 'http://127.0.0.1:54321/functions/v1/order-confirmation' \
    --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZS1kZW1vIiwicm9sZSI6ImFub24iLCJleHAiOjE5ODM4MTI5OTZ9.CRXP1A7WOeoJeXxjNni43kdQwgnWNReilDMblYTn_I0' \
    --header 'Content-Type: application/json' \
    --data '{"name":"Functions"}'

*/

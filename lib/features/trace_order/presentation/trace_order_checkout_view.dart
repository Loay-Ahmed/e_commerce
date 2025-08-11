import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/utils/assets_data.dart';
import 'package:e_commerce/core/widgets/custom_header.dart';
import 'package:e_commerce/core/widgets/cutom_circle_prog_indicator_for_social_button.dart';
import 'package:e_commerce/features/trace_order/data/models/order_model.dart';
import 'package:e_commerce/features/trace_order/presentation/widgets/track_order_card.dart';
import 'package:e_commerce/features/trace_order/presentation/widgets/track_order_step.dart';
import 'package:e_commerce/features/trace_order/view_model/cubit/order_card_cubit/order_card_cubit.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TraceOrderCheckoutView extends StatelessWidget {
  const TraceOrderCheckoutView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(title: S.of(context).track_order, hasBell: false),
      body: BlocProvider(
        create: (context) => OrderCardCubit(),
        child: BlocConsumer<OrderCardCubit, OrderCardState>(
          listener: (context, state) {
            // TODO: implement listener
          },
          builder: (context, state) {
            final OrderModel orderModel =
                context.read<OrderCardCubit>().currentOrder;
            return state is GetOrdersLoading
                ? CustomCircleProgIndicatorForSocialButton()
                : Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      TrackOrderCard(orderModel: orderModel),

                      SizedBox(height: 19),
                      Container(
                        padding: EdgeInsets.symmetric(
                          horizontal: 30,
                          vertical: 20,
                        ),
                        color: CustomColors.grey,
                        child: Column(
                          children: [
                            TrackOrderStep(
                              image: AssetsData.openBox,
                              isDone: true,
                              text: S.of(context).track_order,
                              date: '22 مارس , 2024',
                              index: 1,
                            ),
                            TrackOrderStep(
                              image: AssetsData.acceptOrder,
                              isDone: true,
                              text: S.of(context).order_accepted,
                              date: '22 مارس , 2024',
                              index: 2,
                            ),
                            TrackOrderStep(
                              image: AssetsData.orderShipped,
                              isDone: true,
                              text: S.of(context).order_shipped,
                              date: '22 مارس , 2024',
                              index: 3,
                            ),
                            TrackOrderStep(
                              image: AssetsData.orderOutOfDelivery,
                              isDone: false,
                              text: S.of(context).out_for_delivery_text,
                              date: 'قيد الانتظار',
                              index: 4,
                            ),
                            TrackOrderStep(
                              image: AssetsData.orderDelivered,
                              isDone: false,
                              text: S.of(context).order_delivered,
                              date: 'wait',
                              index: 5,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
          },
        ),
      ),
    );
  }
}

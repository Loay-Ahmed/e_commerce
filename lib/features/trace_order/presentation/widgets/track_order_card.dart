import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/utils/assets_data.dart';
import 'package:e_commerce/core/widgets/cutom_circle_prog_indicator_for_social_button.dart';
import 'package:e_commerce/features/trace_order/data/models/order_model.dart';

import 'package:e_commerce/features/trace_order/presentation/widgets/custom_circle_avatar.dart';
import 'package:e_commerce/features/trace_order/presentation/widgets/order_track_main_info.dart';
import 'package:e_commerce/features/trace_order/presentation/widgets/order_track_steps_details.dart';
import 'package:e_commerce/features/trace_order/view_model/cubit/order_card_cubit/order_card_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackOrderCard extends StatefulWidget {
  const TrackOrderCard({
    super.key,
    this.isMyOrderProfile = false,
    required this.orderModel,
  });
  final bool isMyOrderProfile;

  final OrderModel orderModel;

  @override
  State<TrackOrderCard> createState() => _TrackOrderCardState();
}

class _TrackOrderCardState extends State<TrackOrderCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _rotationAnimation;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      duration: Duration(milliseconds: 300),
      vsync: this,
    );
    _rotationAnimation = Tween<double>(begin: 0.0, end: 0.5).animate(
      CurvedAnimation(parent: _animationController, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<OrderCardCubit>();
    return BlocListener<OrderCardCubit, OrderCardState>(
      listener: (context, state) {
        if (widget.isMyOrderProfile &&
            cubit.isOrderExpanded(orderId: widget.orderModel.id!) &&
            state is OrderCardExpanded) {
          _animationController.forward();
        } else if (widget.isMyOrderProfile &&
            !cubit.isOrderExpanded(orderId: widget.orderModel.id!) &&
            state is OrderCardCollapsed) {
          _animationController.reverse();
        }
      },

      child: Column(
        children: [
          Container(
            padding: EdgeInsets.only(top: 19, bottom: 19),
            color: CustomColors.grey,
            alignment: Alignment.center,

            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomCircleAvatar(
                      image: AssetsData.closedBox,
                      isDone: true,
                    ),
                    SizedBox(width: 16),
                    OrderTrackMainInfo(orderModel: widget.orderModel),
                    if (widget.isMyOrderProfile) Spacer(),
                    if (widget.isMyOrderProfile)
                      Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: GestureDetector(
                          onTap: () {
                            context.read<OrderCardCubit>().toggleExpansion(
                              orderId: widget.orderModel.id!,
                            );
                          },
                          child: AnimatedBuilder(
                            animation: _rotationAnimation,
                            builder: (context, child) {
                              return RotationTransition(
                                turns: _rotationAnimation,
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: CustomColors.grey600,
                                  size: 24,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                  ],
                ),
                if (widget.isMyOrderProfile &&
                    cubit.isOrderExpanded(orderId: widget.orderModel.id!))
                  OrderTrackStepsDetails(orderModel: widget.orderModel),
              ],
            ),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}

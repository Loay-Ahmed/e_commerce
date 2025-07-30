import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/fonts.dart';
import 'package:e_commerce/core/utils/assets_data.dart';

import 'package:e_commerce/features/trace_order/presentation/widgets/custom_circle_avatar.dart';
import 'package:e_commerce/features/trace_order/presentation/widgets/order_track_steps_details.dart';
import 'package:e_commerce/features/trace_order/view_model/cubit/order_card_cubit/order_card_cubit.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TrackOrderCard extends StatefulWidget {
  const TrackOrderCard({super.key, this.isMyOrderProfile = false});
  final bool isMyOrderProfile;

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
    return BlocProvider(
      create: (context) => OrderCardCubit(),
      child: BlocConsumer<OrderCardCubit, OrderCardState>(
        listener: (context, state) {
          if (state is OrderCardExpanded) {
            _animationController.forward();
          } else if (state is OrderCardCollapsed) {
            _animationController.reverse();
          }
        },
        builder: (context, state) {
          final cubit = context.read<OrderCardCubit>();
          return Container(
            padding: EdgeInsets.only(top: 19),
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
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'طلب رقم #1222358',
                          style: CustomFonts.cairoTextStyleBold_13grey950w700,
                        ),
                        Text(
                          'تم الطلب :22مارس, 2024',
                          style: CustomFonts.cairoTextStyleBold_11grey400w400,
                        ),
                        Row(
                          children: [
                            Text(
                              'عدد الطلبات: ',
                              style:
                                  CustomFonts.cairoTextStyleBold_13grey400w400,
                            ),
                            Text(
                              '10      250 جنيه',
                              style:
                                  CustomFonts.cairoTextStyleBold_13grey950w700,
                            ),
                          ],
                        ),
                      ],
                    ),
                    if (widget.isMyOrderProfile) Spacer(),
                    if (widget.isMyOrderProfile)
                      Padding(
                        padding: EdgeInsets.only(left: 30),
                        child: GestureDetector(
                          onTap: () {
                            cubit.toggleExpansion();
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
                if (cubit.isExpanded) OrderTrackStepsDetails(),
              ],
            ),
          );
        },
      ),
    );
  }
}

import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/fonts.dart';
import 'package:e_commerce/core/utils/payment_method_items.dart';
import 'package:e_commerce/features/checkout/view_model/Cubits/payment_cubit/payment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

class PaymentWay extends StatelessWidget {
  const PaymentWay({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'اختر طريقة الدفع المناسبه: ',
          style: CustomFonts.cairoTextStyleBold_16grey950w700,
        ),
        SizedBox(height: 8),
        Text(
          'من فضلك اختر طريقة الدفع المناسبة لك',
          style: CustomFonts.cairoTextStyleBold_13grey950w600,
        ),
        SizedBox(height: 16),
        SizedBox(
          height: 43,
          child: BlocBuilder<PaymentCubit, PaymentState>(
            builder: (context, state) {
              return ListView.builder(
                itemCount: paymentMethodsItems.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: GestureDetector(
                      onTap: () {
                        BlocProvider.of<PaymentCubit>(
                          context,
                        ).updateCardIndex(index);
                      },
                      child: PaymentMethodItem(
                        isActive:
                            context.read<PaymentCubit>().cardIndex == index,
                        image: paymentMethodsItems[index],
                      ),
                    ),
                  );
                },
              );
            },
          ),
        ),
        // Add your payment options here
        // For example, you can use radio buttons or a dropdown menu
      ],
    );
  }
}

class PaymentMethodItem extends StatelessWidget {
  const PaymentMethodItem({
    super.key,
    required this.isActive,
    required this.image,
    svg,
  });

  final bool isActive;
  final String image;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      width: 67,
      height: 43,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          side: BorderSide(
            width: 1.50,
            color: isActive ? CustomColors.green1_500 : CustomColors.grey,
          ),
          borderRadius: BorderRadius.circular(4),
        ),
        shadows: [
          BoxShadow(
            color: isActive ? CustomColors.green1_500 : CustomColors.light,
            blurRadius: 4,
            offset: const Offset(0, 0),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Container(
        width: 67,
        height: 43,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          color: Colors.white,
        ),
        child: Image.asset(
          image,

          // scaleDown is used to ensure that the image couldn't be larger than it's normal size
          // and it could be scaled down to fit the container if i set the width and height of SvgPicture to be smaller than the normal size of the image
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}

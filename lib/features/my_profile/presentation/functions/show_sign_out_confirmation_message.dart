import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/fonts.dart';
import 'package:e_commerce/core/utils/assets_data.dart';
import 'package:e_commerce/core/widgets/custom_button.dart';
import 'package:e_commerce/features/notifications/view_model/view_model/cubit/notification_cubit.dart';
import 'package:e_commerce/features/notifications/view_model/view_model/cubit/notification_state.dart';
import 'package:e_commerce/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

Future<bool?> showSignOutConfirmationMessage(BuildContext context) async {
  return await showDialog<bool>(
    context: context,
    barrierDismissible: true,
    builder:
        (context) => BlocBuilder<NotificationCubit, NotificationState>(
          builder: (context, state) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              backgroundColor: CustomColors.light,
              contentPadding: const EdgeInsets.fromLTRB(20, 20, 20, 10),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: GestureDetector(
                      onTap: () => Navigator.of(context).pop(false),
                      child: SvgPicture.asset(
                        AssetsData.delete,
                        height: 24,
                        width: 24,
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),

                  Text(
                    S.of(context).logout_confirmation,
                    style: CustomFonts.cairoTextStyleBold_16grey950w700,
                    textAlign: TextAlign.center,
                  ),

                  const SizedBox(height: 24),
                ],
              ),
              actionsAlignment: MainAxisAlignment.center,
              actions: [
                SizedBox(
                  width: 100,
                  height: 60,
                  child: CustomButton(
                    onPress: () => Navigator.of(context).pop(true),
                    text: S.of(context).confirm,
                  ),
                ),
                const SizedBox(width: 12),

                // Cancel button
                SizedBox(
                  width: 100,
                  height: 60,
                  child: TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    style: TextButton.styleFrom(
                      side: BorderSide(
                        color: CustomColors.green1_500,
                        width: 1.5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      S.of(context).no_thanks,
                      style: CustomFonts.cairoTextStyleBold_16green1_500w700,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
  );
}

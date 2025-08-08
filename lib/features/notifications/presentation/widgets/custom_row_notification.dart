import 'package:e_commerce/core/colors.dart';
import 'package:flutter/material.dart';

class CustomRowNotification extends StatelessWidget {
  const CustomRowNotification({
    super.key,
    this.icon,
    this.iconColor,
    required this.title,
    required this.body,
    required this.onDismiss,
  });

  final IconData? icon;
  final Color? iconColor;
  final String title;
  final String body;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        // Icon container with gradient background
        Container(
          width: 48,
          height: 48,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [CustomColors.green1_600, CustomColors.lightGreen],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(
                color: CustomColors.green1_500.withOpacity(0.3),
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Icon(
            icon ?? Icons.shopping_basket_rounded,
            color: iconColor ?? CustomColors.black,
            size: 24,
          ),
        ),
        const SizedBox(width: 16),
        // Notification content
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 16,
                  color: CustomColors.grey950,
                  height: 1.2,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 6),
              Text(
                body,
                style: TextStyle(
                  color: CustomColors.grey600,
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  height: 1.3,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
        // Dismiss button
        GestureDetector(
          onTap: onDismiss,
          child: Container(
            padding: const EdgeInsets.all(6),
            decoration: BoxDecoration(
              color: CustomColors.grey50,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Icon(
              Icons.close_rounded,
              size: 20,
              color: CustomColors.grey600,
            ),
          ),
        ),
      ],
    );
  }
}

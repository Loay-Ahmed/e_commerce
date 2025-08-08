import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/features/notifications/presentation/widgets/custom_row_notification.dart';
import 'package:flutter/material.dart';

class SimpleNotificationOverlay {
  static OverlayEntry? _currentOverlay;

  /// Show a simple rectangle notification styled with custom colors
  static void show(
    BuildContext context, {
    required String title,
    required String body,
    Duration duration = const Duration(seconds: 4),
    VoidCallback? onTap,
    IconData? icon,
    Color? iconColor,
  }) {
    hide();

    _currentOverlay = OverlayEntry(
      builder:
          (context) => _SimpleNotificationWidget(
            title: title,
            body: body,
            onTap: onTap ?? () => hide(),
            onDismiss: hide,
            icon: icon,
            iconColor: iconColor,
          ),
    );

    Overlay.of(context).insert(_currentOverlay!);

    // Auto dismiss after duration
    Future.delayed(duration, () {
      hide();
    });
  }

  /// Hide the current notification
  static void hide() {
    _currentOverlay?.remove();
    _currentOverlay = null;
  }
}

class _SimpleNotificationWidget extends StatefulWidget {
  final String title;
  final String body;
  final VoidCallback onTap;
  final VoidCallback onDismiss;
  final IconData? icon;
  final Color? iconColor;

  const _SimpleNotificationWidget({
    required this.title,
    required this.body,
    required this.onTap,
    required this.onDismiss,
    this.icon,
    this.iconColor,
  });

  @override
  State<_SimpleNotificationWidget> createState() =>
      _SimpleNotificationWidgetState();
}

class _SimpleNotificationWidgetState extends State<_SimpleNotificationWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    _slideAnimation = Tween<Offset>(
      begin: const Offset(0, -1.2),
      end: Offset.zero,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.elasticOut));

    _fadeAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _dismiss() async {
    await _controller.reverse();
    widget.onDismiss();
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: MediaQuery.of(context).padding.top + 8,
      left: 12,
      right: 12,
      child: FadeTransition(
        opacity: _fadeAnimation,
        child: SlideTransition(
          position: _slideAnimation,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: CustomColors.green1_500.withOpacity(0.12),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
                BoxShadow(
                  color: CustomColors.grey300.withOpacity(0.08),
                  blurRadius: 12,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: Material(
              color: Colors.transparent,
              borderRadius: BorderRadius.circular(16),
              child: InkWell(
                onTap: widget.onTap,
                borderRadius: BorderRadius.circular(16),
                splashColor: CustomColors.green1_50,
                highlightColor: CustomColors.green10,
                child: Container(
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: CustomColors.black,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: CustomColors.green1_50,
                      width: 1.5,
                    ),
                  ),
                  child: CustomRowNotification(
                    title: widget.title,
                    body: widget.body,
                    onDismiss: () {
                      _dismiss();
                    },
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

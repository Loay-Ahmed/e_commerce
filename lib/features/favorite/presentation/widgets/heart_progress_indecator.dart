import 'dart:ui';

import 'package:flutter/material.dart';

class HeartProgressIndicator extends StatefulWidget {
  final double progress;
  final Color color;
  final double size;

  const HeartProgressIndicator({
    super.key,
    required this.progress,
    this.color = Colors.red,
    this.size = 100.0,
  });

  @override
  State<HeartProgressIndicator> createState() => _HeartProgressIndicatorState();
}

class _HeartProgressIndicatorState extends State<HeartProgressIndicator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(
      begin: 0,
      end: widget.progress,
    ).animate(_controller);
    _controller.forward();
    super.initState();
  }

  @override
  void didUpdateWidget(covariant HeartProgressIndicator oldWidget) {
    super.didUpdateWidget(oldWidget);
    _animation = Tween<double>(
      begin: 0,
      end: widget.progress,
    ).animate(_controller);
    _controller.forward(from: 0);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: widget.size,
      width: widget.size,
      child: AnimatedBuilder(
        animation: _animation,
        builder: (context, _) {
          return CustomPaint(
            painter: _HeartPainter(
              progress: _animation.value,
              color: widget.color,
            ),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

class _HeartPainter extends CustomPainter {
  final double progress;
  final Color color;

  _HeartPainter({required this.progress, required this.color});

  @override
  void paint(Canvas canvas, Size size) {
    final paint =
        Paint()
          ..color = color.withOpacity(0.2)
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5; // Thinner stroke for smaller size

    final double width = size.width;
    final double height = size.height;

    final path = Path();

    // Adjusted heart shape to better match typical SVG heart icons
    // Start from the top center dip
    path.moveTo(width * 0.5, height * 0.3);

    // Left side of heart
    path.cubicTo(
      width * 0.2,
      height * 0.05,
      width * 0.001,
      height * 0.4,
      width * 0.5,
      height * 0.8,
    );

    // Right side of heart — no moveTo here!
    path.cubicTo(
      width * 0.999,
      height * 0.4,
      width * 0.8,
      height * 0.05,
      width * 0.5,
      height * 0.3,
    );

    final PathMetric pathMetric = path.computeMetrics().first;
    final Path extractPath = pathMetric.extractPath(
      0,
      pathMetric.length * progress,
    );

    final drawPaint =
        Paint()
          ..color = color
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.5; // Match background stroke

    canvas.drawPath(path, paint); // background path
    canvas.drawPath(extractPath, drawPaint); // animated progress path
  }

  @override
  bool shouldRepaint(_HeartPainter oldDelegate) =>
      oldDelegate.progress != progress;
}

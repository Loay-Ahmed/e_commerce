import 'dart:async';
import 'package:flutter/material.dart';
import 'page_view_1.dart';
import 'page_view_2.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final PageController _pageController = PageController(initialPage: 1);
  Timer? _timer;
  bool _hasAnimated = false; // Track if we've animated already

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    // Start the animation after a brief delay
    _timer = Timer(const Duration(milliseconds: 2500), _animateToFirstPage);
  }

  void _animateToFirstPage() {
    if (!_hasAnimated) {
      _pageController.animateToPage(
        0,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      ).then((_) {
        setState(() {
          _hasAnimated = true;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        children: const [
          PageView2(),
          PageView1(), // Starts on this page (index 1)
        ],
      ),
    );
  }
}
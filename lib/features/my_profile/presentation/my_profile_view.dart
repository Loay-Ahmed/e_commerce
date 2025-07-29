import 'package:e_commerce/core/widgets/custom_header.dart';
import 'package:flutter/material.dart';

class MyProfileView extends StatelessWidget {
  const MyProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(title: 'حسابى', hasBackArrow: false, hasBell: false),
    );
  }
}

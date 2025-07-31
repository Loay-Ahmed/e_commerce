import 'package:e_commerce/core/widgets/custom_header.dart';
import 'package:flutter/material.dart';

class PersonalInfoView extends StatelessWidget {
  const PersonalInfoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomHeader(title: 'الملف الشخصى', hasBell: false),
    );
  }
}

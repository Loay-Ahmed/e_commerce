import 'package:flutter/material.dart';

class UserInfoFormController {
  UserInfoFormController({
    required this.formKey,
    required this.fullNameController,
    required this.emailController,
    required this.addressController,
    required this.cityController,
    required this.apartmentInfoController,
  });

  final TextEditingController fullNameController;
  final TextEditingController emailController;
  final TextEditingController addressController;
  final TextEditingController cityController;
  final TextEditingController apartmentInfoController;
  final GlobalKey<FormState> formKey;

  void dispose() {
    fullNameController.dispose();
    emailController.dispose();
    addressController.dispose();
    cityController.dispose();
    apartmentInfoController.dispose();
  }
}

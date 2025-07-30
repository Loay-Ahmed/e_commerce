import 'dart:io';

import 'package:e_commerce/core/colors.dart';
import 'package:e_commerce/core/fonts.dart';
import 'package:e_commerce/core/utils/assets_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';

class MyProfileMainInfoWidget extends StatefulWidget {
  const MyProfileMainInfoWidget({super.key});

  @override
  State<MyProfileMainInfoWidget> createState() => _MyProfileMainInfoState();
}

class _MyProfileMainInfoState extends State<MyProfileMainInfoWidget> {
  final ImagePicker imagePicker = ImagePicker();
  File? _selectedImage;

  void _takePicture() async {
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      _selectedImage = File(pickedImage.path);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Stack(
          clipBehavior: Clip.none,
          children: [
            CircleAvatar(
              radius: 40,

              backgroundImage:
                  _selectedImage != null
                      ? FileImage(_selectedImage!)
                      : const AssetImage(AssetsData.profileImage),
            ),
            Positioned(
              bottom: -20,
              left: 0,
              right: 0,
              child: GestureDetector(
                onTap: () {
                  _takePicture();
                },
                child: Container(
                  width: 40,
                  height: 40,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),

                  child: Container(
                    width: 32,
                    height: 32,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: CustomColors.light,
                    ),
                    child: SvgPicture.asset(
                      height: 22,
                      width: 22,
                      AssetsData.camera,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),

        SizedBox(width: 24),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'احمد ياسر',
              style: CustomFonts.cairoTextStyleBold_13grey950w700,
            ),
            Text(
              'mail@gmail.com',
              style: CustomFonts.cairoTextStyleBold_13grey400w400,
            ),
          ],
        ),
      ],
    );
  }
}

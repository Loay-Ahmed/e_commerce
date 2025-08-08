import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:e_commerce/features/my_profile/data/model/user_model.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  SupabaseClient client = Supabase.instance.client;

  final ImagePicker imagePicker = ImagePicker();
  File? selectedImage;

  Future<void> takePicture() async {
    emit(UpdateUserPictureLoading());
    final pickedImage = await imagePicker.pickImage(
      source: ImageSource.gallery,
    );
    if (pickedImage != null) {
      selectedImage = File(pickedImage.path);
      await uploadImage();
      emit(UpdateUserPictureSuccess());
    } else {
      emit(UpdateUserPictureFailure());
    }
  }

  Future<void> uploadImage() async {
    try {
      final userId = client.auth.currentUser!.id;
      final String filePath = 'avatars/$userId.jpg';

      // Upload image
      await client.storage
          .from('avatars')
          .upload(
            filePath,
            selectedImage!,
            fileOptions: const FileOptions(
              upsert: true,
              contentType: 'image/jpeg',
            ),
          );

      // Get public URL
      final String publicUrl = client.storage
          .from('avatars')
          .getPublicUrl(filePath);

      // Update user record in 'users' table

      // Update local model

      final updatedUrl =
          "$publicUrl?t=${DateTime.now().millisecondsSinceEpoch}";

      await client
          .from('users')
          .update({'image': updatedUrl})
          .eq('user_id', userId);

      userDataModel?.image = updatedUrl;
      userDataModel!.image = updatedUrl;
    } catch (e) {
      log('Upload error: $e');
      emit(UpdateUserPictureFailure());
    }
  }

  UserModel? userDataModel;
  Future<void> getUserData() async {
    emit(GetUserDataLoading());
    try {
      final List<Map<String, dynamic>> data = await client
          .from('users')
          .select()
          .eq("user_id", client.auth.currentUser!.id);
      userDataModel = UserModel(
        email: data[0]["email"],
        name: data[0]["name"],
        userId: data[0]["user_id"],
        image: data[0]["image"],
      );
      emit(GetUserDataSuccess());
    } catch (e) {
      log(e.toString());
      emit(GetUserDataFailure());
    }
  }
}

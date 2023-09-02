// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:ui';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intime_news/Login.dart';
import 'package:intime_news/settings_screen.dart';
import 'package:intime_news/states.dart';

import 'home_layout.dart';
import 'local.dart';

class HomeLayoutCubit extends Cubit<HomeLayoutStates> {
  HomeLayoutCubit() : super(initialHomeLayoutState());

  static HomeLayoutCubit get(context) => BlocProvider.of(context);

  List<Widget> Screens = [
    LogIn(),
  ];

  int currentIndex = 0;

  void changeIndex(index) {
    currentIndex = index;
    emit(changeIndexSuccessfully());
  }


  List<int> numper = [];
  int? sum;


  void increaseUi(index) {
    numper[index]++;
    emit(increaseUiState());
  }

  void decreaseUi(index) {
    if (numper[index] != 1) numper[index]--;
    emit(decreaseUiState());
  }

  void increaseInFire(id, index) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('cart')
        .doc(id)
        .update({
      'howMany': numper[index],
    }).then((value) {
      emit(increaseUiState());
    }).catchError((e) {
      print(e.toString());
    });
  }

  void decreaseInFire(id, index) {
    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .collection('cart')
        .doc(id)
        .update({
      'howMany': numper[index],
    }).then((value) {
      emit(increaseUiState());
    }).catchError((e) {
      print(e.toString());
    });
  }



  getUserdata() {
    emit(saveUserDataLoadingState());

    FirebaseFirestore.instance
        .collection('users')
        .doc(FirebaseAuth.instance.currentUser!.uid)
        .get()
        .then((value) {
      CacheHelper.saveData(key: "Name", value: value.data()!['name']);

      CacheHelper.saveData(key: "Picture", value: value.data()!['pic']);
      CacheHelper.saveData(key: "Email", value: value.data()!['email'] ?? "");
      CacheHelper.saveData(key: "Uid", value: value.data()!['uid']);
      emit(saveUserDataSuccessState());
    }).catchError((e) {
      print(e.toString());
      emit(saveUserDataErrorState());
    });
  }

  String? value;

  changeradio(val) {
    value = val;
    print(value);
    emit(changedState());
  }

  File? profileImage;
  final picker = ImagePicker();

  Future getProfileImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      profileImage = File(pickedFile.path);
      emit(getProfileImagePickerSuccessState());
    } else {
      print('No image selected.');
      emit(getProfileImagePickerErrorState());
    }
  }
  File? image;

  Future getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      image = File(pickedFile.path);
      emit(getProfileImagePickerSuccessState());
    } else {
      print('No image selected.');
      emit(getProfileImagePickerErrorState());
    }
  }

  updateData(
      {required TextEditingController emailController,
        required TextEditingController nameController}) {
    emit(LoadingUpdateState());
    if(profileImage == null) {
      emit(LoadingUpdateState());
      return FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .update({
        'email': emailController.text,
        'name': nameController.text,
      }).then((value) {
        FirebaseAuth.instance.currentUser!
            .updateEmail(emailController.text);
        FirebaseAuth.instance.currentUser!
            .updateDisplayName(nameController.text);
        emit(SuccessUpdateState());
        CacheHelper.saveData(key: "Name", value: nameController.text);
        CacheHelper.saveData(key: "Email", value: emailController.text);
        Get.offAll(SettingsScreen());
        profileImage = null;
      }).catchError((e) {
        print(e.toString());
        emit(ErrorUpdateState());
      });
    }
    else {
      emit(LoadingUpdateState());
      return firebase_storage.FirebaseStorage.instance
          .ref()
          .child(
          'usersImages/${Uri
              .file(profileImage!.path)
              .pathSegments
              .last}')
          .putFile((profileImage as File))
          .then((val) {
        emit(LoadingUpdateState());
        val.ref.getDownloadURL().then((valuee) {
          emit(LoadingUpdateState());
          FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .update({
            'email': emailController.text,
            'name': nameController.text,
            'pic': valuee,
          }).then((value) {
            FirebaseAuth.instance.currentUser!
                .updateEmail(emailController.text);
            FirebaseAuth.instance.currentUser!
                .updateDisplayName(nameController.text);
            emit(SuccessUpdateState());
            CacheHelper.saveData(key: "Name", value: nameController.text);
            CacheHelper.saveData(key: "Email", value: emailController.text);
            CacheHelper.saveData(key: "Picture", value: valuee);
            Get.offAll(SettingsScreen());
            profileImage = null;
          }).catchError((e) {
            print(e.toString());
            emit(ErrorUpdateState());
          });
        });
      });
    }
  }

}
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:play_turf/constants.dart';
import 'package:play_turf/view/sign_in/signin.dart';

class RegisterController extends GetxController {
  late TextEditingController nameController,
      usernameController,
      emailController,
      phoneController,
      passwordController;

  @override
  void onInit() {
    super.onInit();
    nameController = TextEditingController();
    usernameController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    passwordController = TextEditingController();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  //   nameController.dispose();
  //   usernameController.dispose();
  //   emailController.dispose();
  //   phoneController.dispose();
  //   passwordController.dispose();
  // }

  signupUser() async {
    Dio dio = Dio();
    try {
      final response = await dio.post(
        'https://sudheeshm.herokuapp.com/user_registration',
        data: {
          "name": nameController.text,
          "phone": phoneController.text,
          "email": emailController.text,
          "password": passwordController.text
        },
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        log(response.data.toString());
        log('success');
        Get.snackbar('Success', 'Register Successful', backgroundColor: kGreenColor);
        Get.offAll(() => SignInPage(), transition: Transition.fade);
      } else {
        throw DioError;
      }
    } catch (e) {
      if (e is DioError) {
        log(e.response!.data["message"].toString());
      }
    }
    log('RESPONSEEEEEEEEEEEEEEEEEEEE');
  }
}

import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:play_turf/api/api_constant.dart';
import 'package:play_turf/constants.dart';
import 'package:play_turf/main.dart';
import 'package:play_turf/view/home_screen/home.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController {
  dynamic isloading = false;
  late TextEditingController usernamecontroller, passwordcontroller;

  @override
  void onInit() {
    super.onInit();
    usernamecontroller = TextEditingController();
    passwordcontroller = TextEditingController();
  }

  loginUserData() async {
    isloading = true;
    update();

    Dio dio = Dio();
    try {
      final response = await dio.post(ApiUrl.baseUrl + ApiUrl.loginPath,
          data: {"email": usernamecontroller.text, "password": passwordcontroller.text});
      if (response.statusCode == 200) {
        log(response.toString());
        final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
        sharedPreferences.setBool(savedKey, true);
        sharedPreferences.setString('userDetails', jsonEncode(response.data));

        log('status code set aayi');

        if (response.data["message"] == "Invalid login details" ||
            response.data["message"] == "Invalid Credentials") {
          Get.rawSnackbar(
            message: response.data["message"] ?? response.data["message"].toString(),
            backgroundColor: kRedColour,
          );
        } else {
          log('doneee');
          Get.snackbar('Success', 'Login Successful', backgroundColor: kGreenColor);
          Get.offAll(() => const HomePage(), transition: Transition.fadeIn);
        }
      } else {
        throw DioError;
      }
    } catch (e) {
      if (e is DioError) {
        log('error adich');
        log(e.response!.data["message"].toString());
      }
    }
    usernamecontroller.clear();
    passwordcontroller.clear();

    log('RESPONSEEEEEEEEEEEEEEEEEEEE');
  }
}

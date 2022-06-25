// ignore_for_file: must_be_immutable

import 'dart:developer';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart' as getx;
import 'package:get/get.dart';
import 'package:play_turf/constants.dart';
import 'package:play_turf/controllers/register_controller.dart';
import 'package:sizer/sizer.dart';
import '../sign_in/signin.dart';

class SignUpPage extends StatelessWidget with InputValidatorMixin {
  SignUpPage({Key? key}) : super(key: key);
  final RegisterController c = Get.put(RegisterController());
  // String pass = '';
  String cpass = '';
  final _globalKey = GlobalKey<FormState>();

  // TextEditingController namecontroller = TextEditingController();
  // TextEditingController emailController = TextEditingController();
  // TextEditingController phoneController = TextEditingController();
  // TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: FadeInUp(
            child: Padding(
              padding: EdgeInsets.only(top: 10.w, left: 7.w, right: 7.w),
              child: getx.GetBuilder<RegisterController>(builder: (controller) {
                return Form(
                  key: _globalKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Sign Up Here!',
                        style: kBigHeading,
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      TextFormField(
                        controller: controller.nameController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          return isNameValid(value);
                        },
                        decoration: InputDecoration(
                          hintText: 'Name',
                          filled: true,
                          fillColor: kFillColour,
                          prefixIcon: const Icon(
                            Icons.person_outline,
                            color: kBlackColor,
                          ),
                          enabledBorder: kenabledBorder,
                          focusedBorder: kFocusedBorder,
                          focusedErrorBorder: kfocusedErrorBorder,
                          errorBorder: kerrorBorder,
                        ),
                      ),
                      kHeight2,
                      TextFormField(
                        controller: controller.phoneController,
                        keyboardType: TextInputType.number,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          return isPhoneValid(value);
                        },
                        decoration: InputDecoration(
                          hintText: 'Phone Number',
                          filled: true,
                          fillColor: kFillColour,
                          prefixIcon: const Icon(
                            Icons.phone_android_outlined,
                            color: kBlackColor,
                          ),
                          enabledBorder: kenabledBorder,
                          focusedBorder: kFocusedBorder,
                          focusedErrorBorder: kfocusedErrorBorder,
                          errorBorder: kerrorBorder,
                        ),
                      ),
                      kHeight2,
                      TextFormField(
                        controller: controller.emailController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        validator: (value) {
                          return isEmailValid(value);
                        },
                        decoration: InputDecoration(
                          hintText: 'Email',
                          filled: true,
                          fillColor: kFillColour,
                          prefixIcon: const Icon(
                            Icons.email_outlined,
                            color: kBlackColor,
                          ),
                          enabledBorder: kenabledBorder,
                          focusedBorder: kFocusedBorder,
                          focusedErrorBorder: kfocusedErrorBorder,
                          errorBorder: kerrorBorder,
                        ),
                      ),
                      kHeight2,
                      TextFormField(
                        obscureText: true,
                        controller: controller.passwordController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (value) => value,
                        validator: (value) {
                          return isPasswordValid(value);
                        },
                        decoration: InputDecoration(
                          hintText: 'Password',
                          filled: true,
                          fillColor: kFillColour,
                          prefixIcon: const Icon(
                            Icons.lock_open_outlined,
                            color: kBlackColor,
                          ),
                          enabledBorder: kenabledBorder,
                          focusedBorder: kFocusedBorder,
                          focusedErrorBorder: kfocusedErrorBorder,
                          errorBorder: kerrorBorder,
                        ),
                      ),
                      kHeight2,
                      TextFormField(
                        obscureText: true,
                        controller: confirmPasswordController,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        onChanged: (value) => value,
                        validator: (value) {
                          return isPasswordValid(value);
                        },
                        decoration: InputDecoration(
                          hintText: 'Confirm Password',
                          filled: true,
                          fillColor: kFillColour,
                          prefixIcon: const Icon(
                            Icons.lock_outline,
                            color: kBlackColor,
                          ),
                          enabledBorder: kenabledBorder,
                          focusedBorder: kFocusedBorder,
                          focusedErrorBorder: kfocusedErrorBorder,
                          errorBorder: kerrorBorder,
                        ),
                      ),
                      SizedBox(
                        height: 4.h,
                      ),
                      Column(
                        children: [
                          GestureDetector(
                            child: Container(
                              height: 7.h,
                              width: 85.w,
                              decoration: BoxDecoration(
                                color: kGreenColor,
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Center(
                                child: Text(
                                  'Sign Up!',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 20.sp,
                                    fontWeight: FontWeight.w700,
                                    color: kWhiteColor,
                                  ),
                                ),
                              ),
                            ),
                            onTap: () {
                              if (_globalKey.currentState!.validate()) {
                                log('validation success, not password');

                                if (controller.passwordController.text ==
                                        confirmPasswordController.text &&
                                    controller.passwordController.text != '' &&
                                    confirmPasswordController.text != '') {
                                  log('password set double success');
                                  controller.signupUser();
                                }
                              }
                            },
                          ),
                          kHeight,
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account? ",
                                style: TextStyle(fontSize: 12.sp),
                              ),
                              GestureDetector(
                                onTap: () {
                                  getx.Get.to(SignInPage(),
                                      transition: getx.Transition.rightToLeft);
                                },
                                child: Text(
                                  'Sign In!',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: kGreenColor[500],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      kHeight2,
                      const Center(
                          child: Text(
                        'OR',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      )),
                      kHeight2,
                      GestureDetector(
                        child: Container(
                          height: 7.5.h,
                          width: 85.w,
                          decoration: BoxDecoration(
                            color: kGreyColour[300],
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(
                                    left: 5.w,
                                    top: 1.5.h,
                                    bottom: 1.5.h,
                                  ),
                                  child: Image.asset('assets/images/google.png'),
                                ),
                                SizedBox(
                                  width: 10.w,
                                ),
                                Text(
                                  'Sign up with Google',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 15.sp,
                                    color: kBlackColor,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () {},
                      ),
                    ],
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }

  // signupUser(BuildContext context) async {
  //   Dio dio = Dio();
  //   try {
  //     final Response response = await dio.post(
  //       'https://sudheeshm.herokuapp.com/user_registration',
  //       data: {
  //         "name": namecontroller.text,
  //         "phone": phoneController.text,
  //         "email": emailController.text,
  //         "password": passwordController.text
  //       },
  //     );
  //     if (response.statusCode == 200 || response.statusCode == 201) {
  //       log(response.data.toString());
  //       log('success');
  //       Navigator.push(
  //         context,
  //         PageTransition(
  //           child: SignInPage(),
  //           type: PageTransitionType.fade,
  //         ),
  //       );
  //     } else {
  //       throw DioError;
  //     }
  //   } catch (e) {
  //     if (e is DioError) {
  //       log(e.response!.data["message"].toString());
  //     }
  //   }
  //   log('RESPONSEEEEEEEEEEEEEEEEEEEE');
  // }
}

// ignore_for_file: must_be_immutable

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';
import 'package:play_turf/Controller/login_controller.dart';
import 'package:play_turf/View/constants.dart';
import 'package:sizer/sizer.dart';
import '../sign_up/signup.dart';
import 'package:google_sign_in/google_sign_in.dart';

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: <String>[
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class SignInPage extends StatelessWidget with InputValidatorMixin {
  SignInPage({Key? key}) : super(key: key);

  final formKey = GlobalKey<FormState>();

  final LoginController c = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: FadeInDown(
            child: Padding(
              padding: EdgeInsets.only(top: 10.w, left: 7.w, right: 7.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Sign In Here!',
                    style: kBigHeading,
                  ),
                  Center(
                    child: Lottie.asset(
                      'assets/animation/login.json',
                      width: 60.w,
                    ),
                  ),
                  GetBuilder<LoginController>(builder: (controller) {
                    return Form(
                      key: formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            controller: controller.usernamecontroller,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              return isUserNameValid(value);
                            },
                            decoration: InputDecoration(
                              hintText: 'Username',
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
                            obscureText: true,
                            controller: controller.passwordcontroller,
                            autovalidateMode: AutovalidateMode.onUserInteraction,
                            // validator: (value) {
                            //   return isPasswordValid(value);
                            // },
                            decoration: InputDecoration(
                              hintText: 'Password',
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
                        ],
                      ),
                    );
                  }),
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
                              'Sign In',
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
                          if (formKey.currentState!.validate()) {
                            c.loginUserData().then((value) => print(value));
                          }
                        },
                      ),
                      kHeight,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't you have an account? ",
                            style: TextStyle(fontSize: 12.sp),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                PageTransition(
                                  child: SignUpPage(),
                                  type: PageTransitionType.fade,
                                ),
                              );
                            },
                            child: Text(
                              'Sign Up!',
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
                    ),
                  ),
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
                    onTap: () {
                      handleSignIn();
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }

  // loginUser() async {
  //   Dio dio = Dio();
  //   try {
  //     final Response response = await dio.post("https://sudheeshm.herokuapp.com/user_signin",
  //         data: {"email": usernamecontroller.text, "password": passwordcontroller.text});
  //     if (response.statusCode == 200) {
  //       // print(user.email);
  //       // print(response.toString());
  //       // print('gfhfg');
  //       // print('hoi');
  //       // log('status code set aayi');
  //       // log("name is............${response.data["user"]["name"].toString()}");
  //       // log("email is............${response.data["user"]["email"].toString()}");

  //       // log("data is............$user");

  //       log('message');
  //       log('jghhhhhhhhhhhh');
  //       log(response.toString());
  //       if (response.data["message"] == "Invalid login details" ||
  //           response.data["message"] == "Invalid Credentials") {
  //         log('kkkkkkkkkkk');
  //         getx.Get.rawSnackbar(
  //           message: response.data["message"] ?? response.data["message"].toString(),
  //         );
  //       } else {
  //         log('doneee');
  //         getx.Get.to(
  //           const HomePage(
  //               // dtata: datata,
  //               ),
  //           transition: Transition.fadeIn,
  //         );
  //       }
  //     } else {
  //       throw DioError;
  //     }
  //   } catch (e) {
  //     if (e is DioError) {
  //       log('error adich');
  //       log(e.response!.data["message"].toString());
  //     }
  //   }

  //   log('RESPONSEEEEEEEEEEEEEEEEEEEE');
  // }
}


 // ScaffoldMessenger.of(context).showSnackBar(
          //   SnackBar(
          //     duration: const Duration(seconds: 2),
          //     behavior: SnackBarBehavior.floating,
          //     shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          //     content: Text(
          //       response.data["message"] ?? response.data["message"].toString(),
          //       style: kDetailText,
          //     ),
          //     backgroundColor: const Color.fromARGB(255, 141, 8, 8),
          //   ),
          // );
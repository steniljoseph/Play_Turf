import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:play_turf/Views/Pages/sign_in/signin.dart';
import 'package:play_turf/Views/Pages/sign_up/signup.dart';
import 'package:play_turf/Views/constants.dart';
import 'package:sizer/sizer.dart';

class KickStartingPage extends StatelessWidget {
  const KickStartingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: FadeInDown(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 10.w, left: 7.w),
                  child: Text(
                    'Kick Started\nWith Us.',
                    style: kBigHeading,
                  ),
                ),
                Center(
                  child: Lottie.asset(
                    'assets/animation/kickstart.json',
                    height: 45.h,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.h, left: 5.h, right: 5.h),
                  child: Column(
                    children: [
                      GestureDetector(
                        child: Container(
                          height: 7.h,
                          width: 85.w,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Text(
                              'Sign Up Here!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 22.sp,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          Get.to(SignUpPage(), transition: Transition.rightToLeftWithFade);
                        },
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Already have an account? ',
                            style: TextStyle(fontSize: 12.sp),
                          ),
                          GestureDetector(
                            onTap: () {
                              Get.to(
                                SignInPage(),
                                transition: Transition.rightToLeftWithFade,
                              );
                            },
                            child: Text(
                              'Sign in!',
                              style: TextStyle(
                                fontSize: 12.sp,
                                color: Colors.green[500],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

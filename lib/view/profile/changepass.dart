import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:play_turf/constants.dart';
import 'package:sizer/sizer.dart';

class ChangePass extends StatelessWidget {
  const ChangePass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: kBlackColor,
          title: Text(
            'Change Password',
            style: kAppBarTitleStyle,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 5.w, right: 5.w),
          child: Column(
            children: [
              kHeight2,
              Column(
                children: [
                  Lottie.asset(
                    'assets/animation/password.json',
                    height: 30.h,
                  )
                ],
              ),
              kHeight2,
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  hintText: 'Password',
                  filled: true,
                  fillColor: kFillColour,
                  prefixIcon: const Icon(
                    Icons.lock,
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  hintText: 'Confirm Password',
                  filled: true,
                  fillColor: kFillColour,
                  prefixIcon: const Icon(
                    Icons.lock,
                    color: kBlackColor,
                  ),
                  enabledBorder: kenabledBorder,
                  focusedBorder: kFocusedBorder,
                  focusedErrorBorder: kfocusedErrorBorder,
                  errorBorder: kerrorBorder,
                ),
              ),
              kHeight2,
              kHeight2,
              GestureDetector(
                child: Container(
                  height: 6.h,
                  width: 85.w,
                  decoration: BoxDecoration(
                    color: kGreenColor,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Text(
                      'Update',
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
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

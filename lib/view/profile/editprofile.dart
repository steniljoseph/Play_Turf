import 'package:flutter/material.dart';
import 'package:play_turf/constants.dart';
import 'package:play_turf/view/profile/widget/editicon.dart';
import 'package:sizer/sizer.dart';

class EditProfile extends StatelessWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: kBlackColor,
          title: Text(
            'Edit Profile',
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
                  kHeight2,
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      CircleAvatar(
                        backgroundImage: const AssetImage('assets/images/second.jpg'),
                        backgroundColor: kBlackColor,
                        radius: 20.w,
                      ),
                      Positioned(
                        top: 13.h,
                        left: 31.w,
                        child: const EditIconStack(),
                      )
                    ],
                  ),
                  kHeight2,
                ],
              ),
              kHeight2,
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  hintText: 'Stenil',
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
                autovalidateMode: AutovalidateMode.onUserInteraction,
                decoration: InputDecoration(
                  hintText: 'stenil@gmail.com',
                  filled: true,
                  fillColor: kFillColour,
                  prefixIcon: const Icon(
                    Icons.email,
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
                  hintText: '9020047493',
                  filled: true,
                  fillColor: kFillColour,
                  prefixIcon: const Icon(
                    Icons.phone_android,
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
                  hintText: 'Kannur',
                  filled: true,
                  fillColor: kFillColour,
                  prefixIcon: const Icon(
                    Icons.location_on_outlined,
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

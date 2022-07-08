import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:play_turf/View/Pages/starting_page/startingpage.dart';
import 'package:play_turf/view/constants.dart';
import 'package:sizer/sizer.dart';

class PageViewScreen extends StatelessWidget {
  const PageViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OnBoardingSlider(
      totalPage: 3,
      headerBackgroundColor: kWhiteColor,
      finishButtonText: "Let's Play",
      finishButtonColor: kGreenColor,
      finishButtonTextStyle: TextStyle(
        color: kWhiteColor,
        fontSize: 16.sp,
        fontWeight: FontWeight.bold,
      ),
      pageBackgroundColor: kWhiteColor,
      controllerColor: kGreenColor,
      addController: true,
      addButton: true,
      imageVerticalOffset: 8.h,
      skipTextButton: const Text(
        "Skip",
        style: TextStyle(
          color: kBlackColor,
          fontWeight: FontWeight.w800,
        ),
      ),
      background: [
        Center(
          child: Lottie.asset(
            "assets/animation/positionfootball.json",
            height: 45.h,
          ),
        ),
        Center(
          child: Lottie.asset(
            "assets/animation/cricket.json",
            height: 45.h,
            width: 95.w,
          ),
        ),
        Center(
          child: Lottie.asset(
            "assets/animation/stadium.json",
            height: 45.h,
            width: 100.w,
          ),
        ),
      ],
      speed: 1.8,
      pageBodies: [
        CustomText(
          descriptionText: "One man practicing sportsmanship is far better than 50 preaching it.",
        ),
        CustomText(
          descriptionText: "The only way to prove that you’re a good sport is to lose.",
        ),
        CustomText(
          descriptionText: "Be Active With\n Play Turf.\n Get Connected\n with Us.",
        )
      ],
      onFinish: () => Get.off(const KickStartingPage()),
    );
  }
}

// ignore: must_be_immutable
class CustomText extends StatelessWidget {
  String descriptionText;
  CustomText({
    required this.descriptionText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 4.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          SizedBox(
            height: 57.h,
          ),
          Padding(
            padding: EdgeInsets.all(5.h),
            child: Text(
              descriptionText,
              style: TextStyle(
                color: const Color.fromARGB(255, 44, 210, 70),
                fontSize: 20.0.sp,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}

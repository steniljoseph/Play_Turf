import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

mixin InputValidatorMixin {
  String? isNameValid(String? value) {
    if (value!.isEmpty) {
      return "Name can't be empty";
    }
    if (value.isNotEmpty && value.length < 4) {
      return "Please enter a valid name";
    } else {
      return null;
    }
  }

  String? isEmailValid(String? value) {
    String pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return "Email can't be empty";
    }
    if (!regExp.hasMatch(value)) {
      return "Please enter a valid email";
    } else {
      return null;
    }
  }

  String? isUserNameValid(String? value) {
    String pattern = r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExp = RegExp(pattern);
    if (value!.isEmpty) {
      return "Username can't be empty";
    }
    if (!regExp.hasMatch(value)) {
      return "Please enter a valid username";
    } else {
      return null;
    }
  }

  String? isPasswordValid(String? value) {
    if (value!.length < 4) {
      return "Password must contain 4 characters";
    } else {
      return null;
    }
  }

  String? isPhoneValid(String? value) {
    if (value!.length <= 9 || value.length >= 11 || value == '') {
      return 'Enter Valid Mobile Number';
    } else if (value.length == 10) {
      return null;
    } else {
      return null;
    }
  }
}

const kWhiteColor = Colors.white;
const  kBlackColor = Colors.black;
const kGreenColor = Colors.green;
const kGreyColour = Colors.grey;
const kFillColour = Color.fromARGB(255, 181, 217, 184);
const kRedColour = Colors.red;
final kWidth = SizedBox(
  width: 1.w,
);

final kWidth2 = SizedBox(
  width: 2.w,
);

final kHeight = SizedBox(
  height: 1.h,
);

final kHeight2 = SizedBox(
  height: 2.h,
);

final kAppBarTitleStyle = TextStyle(
  color: kGreenColor,
  fontSize: 20.sp,
  fontWeight: FontWeight.bold,
);

final kBigHeading = TextStyle(
  color: kGreenColor,
  fontSize: 25.0.sp,
  fontWeight: FontWeight.bold,
);

final kDetailText = TextStyle(
  fontSize: 13.sp,
);

final kBigText = TextStyle(
  color: kBlackColor,
  fontSize: 15.0.sp,
  fontWeight: FontWeight.bold,
);

final kenabledBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(30),
  borderSide: const BorderSide(
    color: kGreenColor,
    width: 1.0,
  ),
);

final kFocusedBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(30),
  borderSide: const BorderSide(
    color: kGreenColor,
    width: 2.0,
  ),
);

final kfocusedErrorBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(30),
  borderSide: const BorderSide(
    color: kRedColour,
    width: 2.0,
  ),
);

final kerrorBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(30),
  borderSide: const BorderSide(
    color: kRedColour,
    width: 2.0,
  ),
);

final kBookNowButton = Container(
  height: 5.h,
  width: 23.w,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.orange,
  ),
  child: const Center(
    child: Text(
      'Book Now',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    ),
  ),
);

final kbookNowTurfButton = Container(
  height: 3.5.h,
  width: 20.w,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: Colors.orange,
  ),
  child: const Center(
    child: Text(
      'Book Now',
      style: TextStyle(
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    ),
  ),
);

// final kFivePercentage = Container(
//   height: 7.h,
//   width: 15.w,
//   decoration: const BoxDecoration(
//     borderRadius: BorderRadius.only(
//       topLeft: Radius.circular(20),
//       bottomRight: Radius.circular(20),
//     ),
//     color: Color.fromARGB(255, 25, 191, 83),
//   ),
//   child: Center(
//     child: Text(
//       '5 %\nOff',
//       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
//       textAlign: TextAlign.center,
//     ),
//   ),
// );

// final kTenPercentage = Container(
//   height: 7.h,
//   width: 15.w,
//   decoration: const BoxDecoration(
//     borderRadius: BorderRadius.only(
//       topLeft: Radius.circular(20),
//       bottomRight: Radius.circular(20),
//     ),
//     color: Color.fromARGB(255, 25, 191, 83),
//   ),
//   child: Center(
//     child: Text(
//       '10 %\nOff',
//       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
//       textAlign: TextAlign.center,
//     ),
//   ),
// );

// final kTwentyPercentage = Container(
//   height: 7.h,
//   width: 15.w,
//   decoration: const BoxDecoration(
//     borderRadius: BorderRadius.only(
//       topLeft: Radius.circular(20),
//       bottomRight: Radius.circular(20),
//     ),
//     color: Color.fromARGB(255, 25, 191, 83),
//   ),
//   child: Center(
//     child: Text(
//       '20 %\nOff',
//       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
//       textAlign: TextAlign.center,
//     ),
//   ),
// );

final kRemoveButton = Container(
  height: 5.h,
  width: 23.w,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: kBlackColor,
  ),
  child: const Center(
    child: Text(
      'Remove',
      style: TextStyle(fontWeight: FontWeight.bold, color: kWhiteColor),
      textAlign: TextAlign.center,
    ),
  ),
);

final kBackButton = Container(
  height: 5.h,
  width: 23.w,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(10),
    color: kBlackColor,
  ),
  child: const Center(
    child: Text(
      'Back',
      style: TextStyle(fontWeight: FontWeight.bold, color: kWhiteColor),
      textAlign: TextAlign.center,
    ),
  ),
);

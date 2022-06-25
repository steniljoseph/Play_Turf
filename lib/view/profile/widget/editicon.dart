import 'package:flutter/material.dart';
import 'package:play_turf/constants.dart';
import 'package:sizer/sizer.dart';

class EditIconStack extends StatelessWidget {
  const EditIconStack({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: 4.h,
          width: 4.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: kGreyColour[300],
          ),
        ),
        Icon(
          Icons.add_a_photo,
          color: kBlackColor,
          size: 17.sp,
        ),
      ],
    );
  }
}

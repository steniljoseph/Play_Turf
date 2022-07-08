import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CustomBanner extends StatelessWidget {
  final String image;
  final String description;
  const CustomBanner({Key? key, required this.image, required this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          width: double.maxFinite,
          height: 25.h,
          child: Image.network(
            image,
            fit: BoxFit.cover,
            // width: 90.w,
          ),
        ),
        Center(
          child: Text(
            description,
            style: TextStyle(
              fontSize: 15.sp,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}

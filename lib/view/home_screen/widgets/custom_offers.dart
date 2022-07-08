import 'package:flutter/material.dart';
import 'package:play_turf/view/constants.dart';
import 'package:sizer/sizer.dart';

class CustomOffer extends StatelessWidget {
  final String image;
  final String centername;
  final String price;
  final String offerPrice;
  final String offerPercentage;
  final Function() bookNowbutton;
  const CustomOffer({
    Key? key,
    required this.image,
    required this.centername,
    required this.price,
    required this.offerPercentage,
    required this.bookNowbutton,
    required this.offerPrice,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: DecorationImage(
          image: NetworkImage(
            image,
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(.8),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              height: 11.h,
              width: 80.w,
            ),
          ),
          Positioned(
            top: 16.h,
            left: 5.w,
            child: Text(
              centername,
              style: kBigText,
            ),
          ),
          Positioned(
            top: 19.h,
            left: 5.w,
            child: Text(
              "₹$offerPrice",
              style: TextStyle(
                color: const Color.fromARGB(255, 20, 113, 22),
                fontSize: 17.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 19.5.h,
            left: 25.w,
            child: Text(
              "₹$price",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12.sp,
                decoration: TextDecoration.lineThrough,
              ),
            ),
          ),
          Positioned(
            child: GestureDetector(
              child: kBookNowButton,
              onTap: bookNowbutton,
            ),
            top: 17.h,
            left: 52.w,
          ),
          Container(
            height: 7.h,
            width: 15.w,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: Color.fromARGB(255, 25, 191, 83),
            ),
            child: Center(
              child: Text(
                offerPercentage,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

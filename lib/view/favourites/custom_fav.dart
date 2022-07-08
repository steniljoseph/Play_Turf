import 'package:flutter/material.dart';
import 'package:play_turf/view/constants.dart';
import 'package:sizer/sizer.dart';

class CustomFavourite extends StatelessWidget {
  final String image;
  final String turfName;
  final String location;
  final String category;
  final String price;
  final VoidCallback remove;
  final Function() bookNow;

  const CustomFavourite(
      {Key? key,
      required this.image,
      required this.turfName,
      required this.location,
      required this.category,
      required this.price,
      required this.remove,
      required this.bookNow})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        kHeight,
        Container(
          width: double.maxFinite,
          height: 20.h,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
            image: DecorationImage(
              image: NetworkImage(
                image,
              ),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Container(
          width: double.maxFinite,
          height: 15.h,
          decoration: BoxDecoration(
            color: kGreyColour[300],
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kHeight,
                Text(
                  turfName,
                  style: kBigText,
                ),
                kHeight,
                Row(
                  children: [
                    Text(
                      location,
                      style: kBigText,
                    ),
                    Text(
                      ' | ',
                      style: kBigText,
                    ),
                    Text(
                      category,
                      style: kBigText,
                    ),
                    Text(
                      ' | ',
                      style: kBigText,
                    ),
                    Text(
                      ' ₹$price',
                      style: kBigText,
                    ),
                  ],
                ),
                kHeight,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: kRemoveButton,
                      onTap: remove,
                    ),
                    GestureDetector(
                      child: kBookNowButton,
                      onTap: bookNow,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}

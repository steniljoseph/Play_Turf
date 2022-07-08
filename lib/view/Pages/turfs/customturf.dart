import 'package:flutter/material.dart';
import 'package:play_turf/view/constants.dart';
import 'package:sizer/sizer.dart';

class CustomTurf extends StatelessWidget {
  final String image;
  final String turfName;
  final String categoryName;
  final String location;
  final String price;

  final Function()? booknow;
  final Function() favbutton;

  const CustomTurf({
    Key? key,
    required this.image,
    required this.turfName,
    required this.categoryName,
    required this.location,
    required this.price,
    required this.booknow,
    required this.favbutton,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 20.w,
          height: 12.h,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
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
          width: 32.h,
          height: 12.h,
          decoration: BoxDecoration(
            color: kGreyColour[300],
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                kHeight,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      turfName,
                      style: kDetailText,
                    ),
                    Text(
                      '  |  ',
                      style: kDetailText,
                    ),
                    Text(
                      categoryName,
                      style: kDetailText,
                    ),
                  ],
                ),
                Text(
                  location,
                  style: kDetailText,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "₹$price",
                      style: kDetailText,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          child: const Icon(
                            Icons.favorite_border,
                            color: kBlackColor,
                          ),
                          onTap: favbutton,
                        ),
                        kWidth2,
                        GestureDetector(
                          child: kbookNowTurfButton,
                          onTap: booknow,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

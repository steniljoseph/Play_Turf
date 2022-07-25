import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:play_turf/Models/turf_model.dart';
import 'package:play_turf/Views/Pages/bookingpages/booknow.dart';
import 'package:play_turf/Views/constants.dart';
import 'package:sizer/sizer.dart';

class CustomTurf extends StatelessWidget {
  final TurfList? turfList;
  // final String image;
  // final String turfName;
  // final String categoryName;
  // final String location;
  // final String price;
  // final Function()? booknow;
  // final Function() favbutton;

  const CustomTurf({
    Key? key,
    // required this.image,
    // required this.turfName,
    // required this.categoryName,
    // required this.location,
    // required this.price,
    // required this.booknow,
    // required this.favbutton,
    this.turfList,
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
                turfList!.turfPictures[0],
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
                      turfList!.centername,
                      style: kDetailText,
                    ),
                    Text(
                      '  |  ',
                      style: kDetailText,
                    ),
                    Text(
                      turfList!.category,
                      style: kDetailText,
                    ),
                  ],
                ),
                Text(
                  turfList!.location,
                  style: kDetailText,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "₹${turfList!.price}",
                      style: kDetailText,
                    ),
                    Row(
                      children: [
                        GestureDetector(
                          child: const Icon(
                            Icons.favorite_border,
                            color: kBlackColor,
                          ),
                          onTap: () {},
                        ),
                        kWidth2,
                        GestureDetector(
                          child: kbookNowTurfButton,
                          onTap: () {
                            var a = turfList!;
                            Get.to(() => BookNowPage(
                                  turfDetail: a,
                                ));
                            log("+++++++++++++++++++++");
                            log(turfList!.centername.toString());
                          },
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

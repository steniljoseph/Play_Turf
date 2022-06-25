import 'package:flutter/material.dart';
import 'package:play_turf/constants.dart';
import 'package:sizer/sizer.dart';

class FavouritePAge extends StatefulWidget {
  const FavouritePAge({Key? key}) : super(key: key);

  @override
  State<FavouritePAge> createState() => _FavouritePAgeState();
}

class _FavouritePAgeState extends State<FavouritePAge> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: kBlackColor,
          title: Text(
            'Favourites',
            style: kAppBarTitleStyle,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: Column(
              children: [
                kHeight,
                Container(
                  width: double.maxFinite,
                  height: 20.h,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                    image: DecorationImage(
                      image: AssetImage(
                        'assets/images/mts.jpg',
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
                          'MTS Turf',
                          style: kBigText,
                        ),
                        kHeight,
                        Row(
                          children: [
                            Text(
                              'Kakkanad',
                              style: kBigText,
                            ),
                            Text(
                              ' | ',
                              style: kBigText,
                            ),
                            Text(
                              'Football',
                              style: kBigText,
                            ),
                            Text(
                              ' | ',
                              style: kBigText,
                            ),
                            Text(
                              ' ₹ 1500',
                              style: kBigText,
                            ),
                          ],
                        ),
                        kHeight,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [kRemoveButton, kBookNowButton],
                        )
                      ],
                    ),
                  ),
                ),
                kHeight2,
              ],
            ),
          ),
        ),
      ),
    );
  }
}

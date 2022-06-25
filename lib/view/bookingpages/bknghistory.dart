import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:play_turf/constants.dart';
import 'package:play_turf/view/bookingpages/bookingdetails.dart';
import 'package:sizer/sizer.dart';

class BookingHistory extends StatelessWidget {
  const BookingHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: kBlackColor,
          title: Text(
            'Booking History',
            style: kAppBarTitleStyle,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 5.w, right: 5.w),
          child: Column(
            children: [
              kHeight,
              Container(
                width: double.maxFinite,
                height: 35.h,
                decoration: BoxDecoration(
                  color: kGreyColour[300],
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: 5.w, right: 5.w),
                  child: Column(
                    children: [
                      kHeight2,
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Center Name',
                                  style: kDetailText,
                                ),
                                const Text(
                                  ': ',
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'MTS Turf',
                              style: kDetailText,
                            ),
                            flex: 1,
                          ),
                        ],
                      ),
                      kHeight,
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Date',
                                  style: kDetailText,
                                ),
                                const Text(
                                  ' : ',
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '20/12/2022',
                              style: kDetailText,
                            ),
                            flex: 1,
                          ),
                        ],
                      ),
                      kHeight,
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Time',
                                  style: kDetailText,
                                ),
                                const Text(
                                  ' : ',
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '7:00 Am to 8:00 Am',
                              style: kDetailText,
                            ),
                            flex: 1,
                          ),
                        ],
                      ),
                      kHeight,
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Amount',
                                  style: kDetailText,
                                ),
                                const Text(
                                  ' : ',
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '1500',
                              style: kDetailText,
                            ),
                            flex: 1,
                          ),
                        ],
                      ),
                      kHeight,
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Offers',
                                  style: kDetailText,
                                ),
                                const Text(
                                  ' : ',
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Text(
                              '6%',
                              style: kDetailText,
                            ),
                            flex: 1,
                          ),
                        ],
                      ),
                      kHeight,
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Category',
                                  style: kDetailText,
                                ),
                                const Text(
                                  ' : ',
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Football',
                              style: kDetailText,
                            ),
                            flex: 1,
                          ),
                        ],
                      ),
                      kHeight,
                      Row(
                        children: [
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Status',
                                  style: kDetailText,
                                ),
                                const Text(
                                  ' : ',
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Text(
                              'Booked',
                              style: kDetailText,
                            ),
                            flex: 1,
                          ),
                        ],
                      ),
                      kHeight2,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: (() {
                              Navigator.push(
                                context,
                                PageTransition(
                                  child: const BookingDetails(),
                                  type: PageTransitionType.bottomToTop,
                                ),
                              );
                            }),
                            child: Container(
                              height: 5.h,
                              width: 23.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.orange,
                              ),
                              child: const Center(
                                child: Text(
                                  'View',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 5.h,
                            width: 23.w,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: const Color.fromARGB(255, 255, 17, 0),
                            ),
                            child: const Center(
                              child: Text(
                                'Cancel',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

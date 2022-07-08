import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:play_turf/view/bookingpages/bookingdetails.dart';
import 'package:play_turf/view/constants.dart';
import 'package:sizer/sizer.dart';

class CustommBookingHistory extends StatelessWidget {
  final String centername;
  final String date;
  final String startTime;
  final String endTime;
  final String totalPrice;
  final String? offerPercentage;
  final String category;
  final String status;
  final VoidCallback? cancel;
  final VoidCallback view;

  const CustommBookingHistory(
      {Key? key,
      required this.centername,
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.totalPrice,
      this.offerPercentage,
      required this.category,
      required this.status,
      this.cancel,
      required this.view})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
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
                    centername,
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
                    date,
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
                    '$startTime to $endTime',
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
                    '₹$totalPrice',
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
                    '${offerPercentage!} %',
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
                    category,
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
                    status,
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
                GestureDetector(
                  onTap: () {},
                  child: Container(
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
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

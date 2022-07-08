import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:play_turf/view/constants.dart';
import 'package:play_turf/view/bookingpages/bknghistory.dart';
import 'package:sizer/sizer.dart';

class BookingDetails extends StatelessWidget {
  const BookingDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: kBlackColor,
          title: Text(
            'Booking Details',
            style: kAppBarTitleStyle,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 5.w, right: 5.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.maxFinite,
                height: 25.h,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  image: const DecorationImage(
                    image: AssetImage(
                      'assets/images/mts.jpg',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              kHeight2,
              Text(
                'Booking Details',
                style: kBigText,
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
                    flex: 2,
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
                    flex: 2,
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
                          'Total Amount',
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
                    flex: 2,
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
                    flex: 2,
                  ),
                ],
              ),
              kHeight2,
              Row(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total Amount',
                          style: kBigText,
                        ),
                        Text(
                          ' : ',
                          style: kBigText,
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Text(
                      '    ₹ 1500',
                      style: kBigText,
                    ),
                    flex: 1,
                  ),
                ],
              ),
              kHeight2,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () => Navigator.push(
                      context,
                      PageTransition(
                        child: BookingHistory(),
                        type: PageTransitionType.bottomToTop,
                      ),
                    ),
                    child: Container(
                      height: 5.h,
                      width: 18.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.orange,
                      ),
                      child: const Center(
                        child: Text(
                          'Ok',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

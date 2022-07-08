import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:play_turf/view/constants.dart';
import 'package:play_turf/view/bookingpages/bookingdetails.dart';
import 'package:sizer/sizer.dart';

class BookingConfirmPage extends StatefulWidget {
  const BookingConfirmPage({Key? key}) : super(key: key);

  @override
  State<BookingConfirmPage> createState() => _BookNowPageState();
}

class _BookNowPageState extends State<BookingConfirmPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: kBlackColor,
          title: Text(
            'Booking Confirmation',
            style: kAppBarTitleStyle,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Center Details',
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
                            'Center Name',
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
                        'MTS Turf',
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
                            'Phone',
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
                        '9020047493',
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
                            'Location',
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
                        'Kakkanad',
                        style: kDetailText,
                      ),
                      flex: 2,
                    ),
                  ],
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
                Text(
                  'User Details',
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
                            'Name',
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
                        'Stenil',
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
                            'Phone',
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
                        '9030020202',
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
                            'Email',
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
                        'stenil@gmail.com',
                        style: kDetailText,
                      ),
                      flex: 2,
                    ),
                  ],
                ),
                kHeight2,
                kHeight,
                Row(
                  children: [
                    Container(
                      child: Center(
                          child: Text(
                        'Enter Coupon Details',
                        style: kDetailText,
                      )),
                      height: 6.h,
                      width: 55.w,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(5), bottomRight: Radius.circular(5)),
                        color: kGreyColour[300],
                      ),
                    ),
                    Container(
                      child: Center(
                        child: Text(
                          'Apply',
                          style: TextStyle(
                            color: kWhiteColor,
                            fontSize: 13.sp,
                          ),
                        ),
                      ),
                      height: 6.h,
                      width: 33.w,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(5), bottomLeft: Radius.circular(5)),
                        color: kGreenColor[500],
                      ),
                    )
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
                        '₹ 1500',
                        style: kDetailText,
                      ),
                      flex: 2,
                    ),
                  ],
                ),
                kHeight2,
                Text(
                  'Select Payement Method',
                  style: kDetailText,
                ),
                kHeight,
                Row(
                  children: [
                    Radio(
                        value: 1,
                        groupValue: 'null',
                        onChanged: (index) {
                          setState(() {});
                        }),
                    const Text(
                      'Pay at Venue',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Radio(value: 1, groupValue: 'null', onChanged: (index) {}),
                    const Text(
                      'Pay Online',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                kHeight2,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      child: kBackButton,
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                    GestureDetector(
                      child: kBookNowButton,
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: const BookingDetails(),
                            type: PageTransitionType.bottomToTop,
                          ),
                        );
                      },
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:play_turf/constants.dart';
import 'package:play_turf/view/bookingpages/bkngconfirmtn.dart';
import 'package:sizer/sizer.dart';

class BookNowPage extends StatefulWidget {
  const BookNowPage({Key? key}) : super(key: key);

  @override
  State<BookNowPage> createState() => _BookNowPageState();
}

class _BookNowPageState extends State<BookNowPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: kBlackColor,
          title: Text(
            'Book Now',
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
                  height: 16.h,
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
                  child: Column(
                    children: [
                      kHeight,
                      Text(
                        'MTS Turf',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.location_on,
                          color: kBlackColor,
                        ),
                        title: Text(
                          'Kakkanad',
                          style: kBigText,
                        ),
                        trailing: Text(
                          '₹ 1300',
                          style: kBigText,
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 4.w),
                        child: Row(
                          children: [
                            const Icon(Icons.phone),
                            SizedBox(
                              width: 7.w,
                            ),
                            Text(
                              '9020047493',
                              style: kBigText,
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                kHeight2,
                Container(
                  decoration: BoxDecoration(
                    color: kGreyColour[300],
                    borderRadius: BorderRadius.circular(30),
                  ),
                  height: 54.h,
                  width: double.maxFinite,
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.w, right: 5.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        kHeight,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Book Here!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Date',
                          style: kBigText,
                        ),
                        kHeight,
                        Container(
                          height: 5.h,
                          width: 37.h,
                          decoration: const BoxDecoration(
                            color: kWhiteColor,
                          ),
                          child: TextFormField(
                            readOnly: true,
                            decoration: const InputDecoration(
                              hintText: 'Choose Date',
                              prefixIcon: Icon(
                                Icons.date_range,
                                color: kBlackColor,
                              ),
                            ),
                          ),
                        ),
                        kHeight,
                        Text(
                          'Sections',
                          style: kBigText,
                        ),
                        Row(
                          children: [
                            Radio(
                                value: 1,
                                groupValue: 'null',
                                onChanged: (index) {
                                  setState(() {});
                                }),
                            const Text(
                              'Morning',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Row(
                              children: [
                                Radio(value: 1, groupValue: 'null', onChanged: (index) {}),
                                const Text(
                                  'Evening',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ],
                        ),
                        kHeight,
                        Text(
                          'Available Times',
                          style: kBigText,
                        ),
                        kHeight,
                        Container(
                          width: double.maxFinite,
                          height: 6.h,
                          decoration: const BoxDecoration(
                            color: kWhiteColor,
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(left: 2.w, right: 2.w),
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        '6:00',
                                        style: TextStyle(fontSize: 14.sp, color: kGreenColor),
                                      ),
                                      Text(
                                        'Am',
                                        style: TextStyle(fontSize: 14.sp, color: kGreenColor),
                                      )
                                    ],
                                  ),
                                  kWidth,
                                  kWidth,
                                  Column(
                                    children: [
                                      Text(
                                        '7:00',
                                        style: TextStyle(fontSize: 14.sp, color: kGreenColor),
                                      ),
                                      Text(
                                        'Am',
                                        style: TextStyle(fontSize: 14.sp, color: kGreenColor),
                                      )
                                    ],
                                  ),
                                  kWidth,
                                  kWidth,
                                  Column(
                                    children: [
                                      Text(
                                        '8:00',
                                        style: TextStyle(fontSize: 14.sp, color: kGreenColor),
                                      ),
                                      Text(
                                        'Am',
                                        style: TextStyle(fontSize: 14.sp, color: kGreenColor),
                                      )
                                    ],
                                  ),
                                  kWidth,
                                  kWidth,
                                  Column(
                                    children: [
                                      Text(
                                        '9:00',
                                        style: TextStyle(fontSize: 14.sp, color: kGreenColor),
                                      ),
                                      Text(
                                        'Am',
                                        style: TextStyle(fontSize: 14.sp, color: kGreenColor),
                                      )
                                    ],
                                  ),
                                  kWidth,
                                  kWidth,
                                  Column(
                                    children: [
                                      Text(
                                        '10:00',
                                        style: TextStyle(fontSize: 14.sp, color: kGreenColor),
                                      ),
                                      Text(
                                        'Am',
                                        style: TextStyle(fontSize: 14.sp, color: kGreenColor),
                                      )
                                    ],
                                  ),
                                  kWidth,
                                  kWidth,
                                  Column(
                                    children: [
                                      Text(
                                        '1:00',
                                        style: TextStyle(fontSize: 14.sp, color: kGreenColor),
                                      ),
                                      Text(
                                        'Am',
                                        style: TextStyle(fontSize: 14.sp, color: kGreenColor),
                                      )
                                    ],
                                  ),
                                  kWidth,
                                  kWidth,
                                  Column(
                                    children: [
                                      Text(
                                        '12:00',
                                        style: TextStyle(fontSize: 14.sp, color: kGreenColor),
                                      ),
                                      Text(
                                        'Am',
                                        style: TextStyle(fontSize: 14.sp, color: kGreenColor),
                                      )
                                    ],
                                  ),
                                  kWidth,
                                ],
                              ),
                            ),
                          ),
                        ),
                        kHeight2,
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              children: [
                                Text(
                                  'From',
                                  style: kBigText,
                                ),
                                kHeight,
                                Container(
                                  height: 5.h,
                                  width: 17.h,
                                  decoration: const BoxDecoration(
                                    color: kWhiteColor,
                                  ),
                                  child: TextFormField(
                                    readOnly: true,
                                    decoration: const InputDecoration(
                                      hintText: 'Start Time',
                                      prefixIcon: Icon(
                                        Icons.watch_later_outlined,
                                        color: kBlackColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              children: [
                                Text(
                                  'To',
                                  style: kBigText,
                                ),
                                kHeight,
                                Container(
                                  height: 5.h,
                                  width: 17.h,
                                  decoration: const BoxDecoration(
                                    color: kWhiteColor,
                                  ),
                                  child: TextFormField(
                                    readOnly: true,
                                    decoration: const InputDecoration(
                                      hintText: 'End Time',
                                      prefixIcon: Icon(
                                        Icons.watch_later_outlined,
                                        color: kBlackColor,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
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
                                    child: const BookingConfirmPage(),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

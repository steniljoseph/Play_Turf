
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:play_turf/controllers/booking_controller.dart';
import 'package:play_turf/model/booking_model.dart';
import 'package:play_turf/view/bookingpages/widgets/custom_booking_history.dart';
import 'package:play_turf/view/constants.dart';
import 'package:sizer/sizer.dart';

class BookingHistory extends StatelessWidget {
  BookingHistory({Key? key}) : super(key: key);

  final BookingController bc = Get.put(BookingController());
  

  @override
  Widget build(BuildContext context) {
     BookingDatas bookingDatas = bc.fetchBookingDatas() as BookingDatas;
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
          child: 
          // GetBuilder(
          //   // initState: bc.fetchBookingDatas(),
          //   // future: bc.fetchBookingDatas(),
          //   builder: (controller) {
              // if (controller == ConnectionState.waiting) {
              //   return Shimmer.fromColors(
              //     highlightColor: Colors.grey,
              //     baseColor: Colors.white,
              //     child: Container(
              //       height: 35.h,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(20),
              //         color: Colors.grey,
              //       ),
              //     ),
              //   );
              // }
             

               bookingDatas.turf.isNotEmpty
                  ? ListView.separated(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      separatorBuilder: (context, index) => kHeight2,
                      itemCount: bookingDatas.turf.length,
                      itemBuilder: (context, index) {
                        // var a = bookingDatas.turf[index].status;
                        return CustommBookingHistory(
                          centername: bookingDatas.turf[index].turfDetails[0].centername,
                          date: bookingDatas.turf[index].date,
                          startTime: bookingDatas.turf[index].startTime,
                          endTime: bookingDatas.turf[index].endTime,
                          totalPrice: bookingDatas.turf[index].totalPrice.toString(),
                          offerPercentage: bookingDatas.turf[index].offer.toString(),
                          category: bookingDatas.turf[index].turfDetails[0].category,
                          status: bookingDatas.turf[index].status,
                          view: () {},
                        );
                      },
                    )
                  : SizedBox(
                      height: 80.h,
                      child: Lottie.asset("assets/animation/nodata.json",
                          height: 45.h, width: double.maxFinite),
                    )
            // },
          ),
        ),
      );
    
  }
}

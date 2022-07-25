import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:play_turf/Controllers/booking_controller.dart';
import 'package:play_turf/Views/Pages/bookingpages/widgets/custom_booking_history.dart';
import 'package:play_turf/Views/constants.dart';
import 'package:sizer/sizer.dart';

class BookingHistory extends StatelessWidget {
  BookingHistory({Key? key}) : super(key: key);

  final BookingController bc = Get.put(BookingController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () {
          return Scaffold(
            appBar: AppBar(
              foregroundColor: kBlackColor,
              title: Text(
                'Booking History',
                style: kAppBarTitleStyle,
              ),
            ),
            body: Padding(
              padding: EdgeInsets.only(left: 5.w, right: 5.w),
              child: bc.isLoading.value
                  ? const Center(
                      child: CupertinoActivityIndicator(
                        radius: 18,
                        color: kGreenColor,
                      ),
                    )
                  : bc.bookingHistory.value.turf!.isNotEmpty
                      ? ListView.separated(
                          itemCount: bc.bookingHistory.value.turf!.length,
                          separatorBuilder: (context, index) => kHeight2,
                          itemBuilder: (context, index) => CustommBookingHistory(
                            offerPercentage: bc.bookingHistory.value.turf![index].offer != null
                                ? "${bc.bookingHistory.value.turf![index].offer}%"
                                : 'No offers',
                            centername:
                                bc.bookingHistory.value.turf![index].turfDetails[0].centername,
                            date: bc.bookingHistory.value.turf![index].date,
                            startTime: bc.bookingHistory.value.turf![index].startTime,
                            endTime: bc.bookingHistory.value.turf![index].endTime,
                            totalPrice: bc.bookingHistory.value.turf![index].totalPrice.toString(),
                            category: bc.bookingHistory.value.turf![index].turfDetails[0].category,
                            status: bc.bookingHistory.value.turf![index].status,
                            view: () {},
                            cancel: () {},
                          ),
                        )
                      : SizedBox(
                          height: 80.h,
                          child: Lottie.asset(
                            "assets/animation/nodata.json",
                            height: 45.h,
                            width: double.maxFinite,
                          ),
                        ),
            ),
          );
        },
      ),
    );
  }
}








          //   future: bc.fetchBkngHistory(),
          //   builder: (context, AsyncSnapshot<BookingDatas> snapshot) {
          //     if (snapshot.connectionState == ConnectionState.waiting) {
          //       return Shimmer.fromColors(
          //         highlightColor: Colors.grey,
          //         baseColor: Colors.white,
          //         child: Padding(
          //           padding: EdgeInsets.only(left: 10.w, right: 10.w),
          //           child: Container(
          //             height: 25.h,
          //             decoration: BoxDecoration(
          //               borderRadius: BorderRadius.circular(20),
          //               color: Colors.grey,
          //             ),
          //           ),
          //         ),
          //       );
          //     }
          //     BookingDatas bookingDatas = snapshot.data!;
          //     return bookingDatas.turf.isNotEmpty
          //         ? ListView.separated(
          //             separatorBuilder: (context, index) => kHeight2,
          //             itemCount: bookingDatas.turf.length,
          //             itemBuilder: (context, index) {
          //               return CustommBookingHistory(
          //                 centername: bookingDatas.turf[index].turfDetails[0].centername,
          //                 date: bookingDatas.turf[index].date,
          //                 startTime: bookingDatas.turf[index].startTime,
          //                 endTime: bookingDatas.turf[index].endTime,
          //                 totalPrice: bookingDatas.turf[index].totalPrice.toString(),
          //                 offerPercentage: bookingDatas.turf[index].offer.toString(),
          //                 category: bookingDatas.turf[index].turfDetails[0].category,
          //                 status: bookingDatas.turf[index].status,
          //                 view: () {},
          //               );
          //             },
          //           )
          //         : SizedBox(
          //             height: 80.h,
          //             child: Lottie.asset("assets/animation/nodata.json",
          //                 height: 45.h, width: double.maxFinite),
          //           );
          //   }
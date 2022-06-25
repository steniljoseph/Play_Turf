import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:play_turf/constants.dart';
import 'package:play_turf/controllers/homepage_controller.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import '../../bookingpages/booknow.dart';

final HomePageController c = Get.put(HomePageController());

class FivePerOffer extends StatelessWidget {
  const FivePerOffer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(
          const Duration(seconds: 3),
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(
                    c.offer['offer'][0]['turfDetails'][0]['turfPictures'][0],
                    // c.offerDetails[0].image,
                  ),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.8),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      height: 11.h,
                      width: 80.w,
                    ),
                  ),
                  Positioned(
                    top: 16.h,
                    left: 5.w,
                    child: Text(
                      // c.offerDetails[0].centername.toString(),
                      c.offer['offer'][0]['turfDetails'][0]['centername'].toString(),
                      // "",
                      style: kBigText,
                    ),
                  ),
                  Positioned(
                    top: 19.h,
                    left: 5.w,
                    child: Text(
                      '₹ 1945',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 20, 113, 22),
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 19.5.h,
                    left: 25.w,
                    child: Text(
                      '₹ ${c.offer['offer'][0]['turfDetails'][0]['price'].toString()}',
                      // "",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ),
                  Positioned(
                    child: GestureDetector(
                      child: kBookNowButton,
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: const BookNowPage(),
                            type: PageTransitionType.bottomToTop,
                          ),
                        );
                      },
                    ),
                    top: 17.h,
                    left: 52.w,
                  ),
                  kFivePercentage,
                ],
              ),
            );
          }
          return Container();
        });
  }
}

class TenPerOffer extends StatelessWidget {
  const TenPerOffer({Key? key}) : super(key: key);

  // final HomePageController c = Get.put(HomePageController());

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.delayed(
          const Duration(seconds: 3),
        ),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return Container(
              width: double.maxFinite,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(
                      // c.offerDetails[1].image,
                      c.offer['offer'][1]['turfDetails'][0]['turfPictures'][0]),
                  fit: BoxFit.cover,
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey.withOpacity(.8),
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      height: 11.h,
                      width: 80.w,
                    ),
                  ),
                  Positioned(
                    top: 16.h,
                    left: 5.w,
                    child: Text(
                      c.offer['offer'][1]['turfDetails'][0]['centername'],
                      // c.offerDetails[1].centername.toString(),
                      style: kBigText,
                    ),
                  ),
                  Positioned(
                    top: 19.h,
                    left: 5.w,
                    child: Text(
                      '₹ 1485',
                      style: TextStyle(
                        color: const Color.fromARGB(255, 20, 113, 22),
                        fontSize: 17.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 19.5.h,
                    left: 25.w,
                    child: Text(
                      '₹ ${c.offer['offer'][1]['turfDetails'][0]['price'].toString()}',
                      // "",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                  ),
                  Positioned(
                    child: GestureDetector(
                      child: kBookNowButton,
                      onTap: () {
                        Navigator.push(
                          context,
                          PageTransition(
                            child: const BookNowPage(),
                            type: PageTransitionType.bottomToTop,
                          ),
                        );
                      },
                    ),
                    top: 17.h,
                    left: 52.w,
                  ),
                  kTenPercentage,
                ],
              ),
            );
          }
          return Shimmer.fromColors(
            baseColor: Colors.grey,
            highlightColor: Colors.white,
            child: const SizedBox(
              width: double.maxFinite,
            ),
          );
        });
  }
}

final kFivePercentage = Container(
  height: 7.h,
  width: 15.w,
  decoration: const BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      bottomRight: Radius.circular(20),
    ),
    color: Color.fromARGB(255, 25, 191, 83),
  ),
  child: Center(
    child: Text(
      '${c.offer['offer'][0]['offerPercent'].toString()} %\nOff',
      // "",
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
      textAlign: TextAlign.center,
    ),
  ),
);

final kTenPercentage = Container(
  height: 7.h,
  width: 15.w,
  decoration: const BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: Radius.circular(20),
      bottomRight: Radius.circular(20),
    ),
    color: Color.fromARGB(255, 25, 191, 83),
  ),
  child: Center(
    child: Text(
      '${c.offer['offer'][1]['offerPercent'].toString()} %\nOff',
      // '',
      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
      textAlign: TextAlign.center,
    ),
  ),
);

// final HomePageController c = Get.put(HomePageController());

// class FivePerOffer extends StatelessWidget {
//   const FivePerOffer({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.maxFinite,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         image: const DecorationImage(
//           image: NetworkImage(
//             // c.offer['offer'][0]['turfDetails'][0]['turfPictures'][0],
//             '',
//           ),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Stack(
//         children: [
//           Positioned(
//             bottom: 0,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.grey.withOpacity(.8),
//                 borderRadius: const BorderRadius.only(
//                   bottomLeft: Radius.circular(20),
//                   bottomRight: Radius.circular(20),
//                 ),
//               ),
//               height: 11.h,
//               width: 80.w,
//             ),
//           ),
//           Positioned(
//             top: 16.h,
//             left: 5.w,
//             child: Text(
//               // c.offerDetails[0].centername.toString(),
//               // c.offer['offer'][0]['turfDetails'][0]['centername'].toString(),
//               "",
//               style: kBigText,
//             ),
//           ),
//           Positioned(
//             top: 19.h,
//             left: 5.w,
//             child: Text(
//               '₹ 1945',
//               style: TextStyle(
//                 color: const Color.fromARGB(255, 20, 113, 22),
//                 fontSize: 17.sp,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Positioned(
//             top: 19.5.h,
//             left: 25.w,
//             child: Text(
//               // '₹ ${c.offer['offer'][0]['turfDetails'][0]['price'].toString()}',
//               "",
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 12.sp,
//                 decoration: TextDecoration.lineThrough,
//               ),
//             ),
//           ),
//           Positioned(
//             child: GestureDetector(
//               child: kBookNowButton,
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   PageTransition(
//                     child: const BookNowPage(),
//                     type: PageTransitionType.bottomToTop,
//                   ),
//                 );
//               },
//             ),
//             top: 17.h,
//             left: 52.w,
//           ),
//           kFivePercentage,
//         ],
//       ),
//     );
//   }
// }

// class TenPerOffer extends StatelessWidget {
//   const TenPerOffer({Key? key}) : super(key: key);

//   // final HomePageController c = Get.put(HomePageController());

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: double.maxFinite,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(20),
//         image: const DecorationImage(
//           image: NetworkImage(
//             "",
//             // c.offer['offer'][1]['turfDetails'][0]['turfPictures'][0],
//           ),
//           fit: BoxFit.cover,
//         ),
//       ),
//       child: Stack(
//         children: [
//           Positioned(
//             bottom: 0,
//             child: Container(
//               decoration: BoxDecoration(
//                 color: Colors.grey.withOpacity(.8),
//                 borderRadius: const BorderRadius.only(
//                   bottomLeft: Radius.circular(20),
//                   bottomRight: Radius.circular(20),
//                 ),
//               ),
//               height: 11.h,
//               width: 80.w,
//             ),
//           ),
//           Positioned(
//             top: 16.h,
//             left: 5.w,
//             child: Text(
//               // c.offer['offer'][1]['turfDetails'][0]['centername'],
//               '',
//               style: kBigText,
//             ),
//           ),
//           Positioned(
//             top: 19.h,
//             left: 5.w,
//             child: Text(
//               '₹ 1485',
//               style: TextStyle(
//                 color: const Color.fromARGB(255, 20, 113, 22),
//                 fontSize: 17.sp,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           ),
//           Positioned(
//             top: 19.5.h,
//             left: 25.w,
//             child: Text(
//               // '₹ ${c.offer['offer'][1]['turfDetails'][0]['price'].toString()}',
//               "",
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 fontSize: 12.sp,
//                 decoration: TextDecoration.lineThrough,
//               ),
//             ),
//           ),
//           Positioned(
//             child: GestureDetector(
//               child: kBookNowButton,
//               onTap: () {
//                 Navigator.push(
//                   context,
//                   PageTransition(
//                     child: const BookNowPage(),
//                     type: PageTransitionType.bottomToTop,
//                   ),
//                 );
//               },
//             ),
//             top: 17.h,
//             left: 52.w,
//           ),
//           kTenPercentage,
//         ],
//       ),
//     );
//   }
// }

// final kFivePercentage = Container(
//   height: 7.h,
//   width: 15.w,
//   decoration: const BoxDecoration(
//     borderRadius: BorderRadius.only(
//       topLeft: Radius.circular(20),
//       bottomRight: Radius.circular(20),
//     ),
//     color: Color.fromARGB(255, 25, 191, 83),
//   ),
//   child: Center(
//     child: Text(
//       // '${c.offer['offer'][0]['offerPercent'].toString()} %\nOff',
//       "",
//       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
//       textAlign: TextAlign.center,
//     ),
//   ),
// );

// final kTenPercentage = Container(
//   height: 7.h,
//   width: 15.w,
//   decoration: const BoxDecoration(
//     borderRadius: BorderRadius.only(
//       topLeft: Radius.circular(20),
//       bottomRight: Radius.circular(20),
//     ),
//     color: Color.fromARGB(255, 25, 191, 83),
//   ),
//   child: Center(
//     child: Text(
//       // '${c.offer['offer'][1]['offerPercent'].toString()} %\nOff',
//       '',
//       style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
//       textAlign: TextAlign.center,
//     ),
//   ),
// );

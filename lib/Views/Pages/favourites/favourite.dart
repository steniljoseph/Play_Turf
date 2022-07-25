import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:play_turf/Controllers/favourite_controller.dart';
import 'package:play_turf/Views/Pages/favourites/custom_fav.dart';
import 'package:play_turf/Views/constants.dart';
import 'package:sizer/sizer.dart';

class FavouritePAge extends StatefulWidget {
  const FavouritePAge({Key? key}) : super(key: key);

  @override
  State<FavouritePAge> createState() => _FavouritePAgeState();
}

class _FavouritePAgeState extends State<FavouritePAge> {
  final FavouriteController fc = Get.put(FavouriteController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Obx(
        () {
          return Scaffold(
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
                child: fc.isLoading.value
                    ? const Center(
                        child: CupertinoActivityIndicator(
                          radius: 18,
                          color: kGreenColor,
                        ),
                      )
                    : fc.fav.value.turf!.isNotEmpty
                        ? ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: fc.fav.value.turf!.length,
                            separatorBuilder: (context, index) => kHeight2,
                            itemBuilder: (context, index) => CustomFavourite(
                              image: fc.fav.value.turf![index].turfDetails[0].turfPictures[0],
                              turfName: fc.fav.value.turf![index].turfDetails[0].centername,
                              location: fc.fav.value.turf![index].turfDetails[0].location,
                              category: fc.fav.value.turf![index].turfDetails[0].category,
                              price: "price",
                              remove: () {
                                fc.addFavourite(fc.fav.value.turf![index].id);
                                log(fc.fav.value.turf![index].turfDetails[0].centername);
                              },
                              bookNow: () {},
                            ),
                          )
                        : SizedBox(
                            height: 80.h,
                            child: Lottie.asset("assets/animation/nodata.json",
                                height: 45.h, width: double.maxFinite),
                          ),
              ),
            ),
          );
        },
      ),
    );
  }

//     FutureBuilder<FavouriteData>(
  //   future: fc.fetchFavorites(),
  //   builder: (context, AsyncSnapshot<FavouriteData> snapshot) {
  //     if (snapshot.connectionState == ConnectionState.waiting) {
  //       return ListView.separated(
  //         shrinkWrap: true,
  //         physics: const NeverScrollableScrollPhysics(),
  //         separatorBuilder: (context, index) => kHeight2,
  //         itemCount: 5,
  //         itemBuilder: (context, index) => Shimmer.fromColors(
  //           highlightColor: Colors.grey,
  //           baseColor: Colors.white,
  //           child: Container(
  //             height: 12.h,
  //             decoration: BoxDecoration(
  //               borderRadius: BorderRadius.circular(20),
  //               color: Colors.grey,
  //             ),
  //           ),
  //         ),
  //       );
  //     }
  //     FavouriteData favouriteData = snapshot.data!;
  //     return favouriteData.turf.isNotEmpty
  //         ? ListView.separated(
  //             shrinkWrap: true,
  //             physics: const NeverScrollableScrollPhysics(),
  //             separatorBuilder: (context, index) => kHeight2,
  //             itemCount: favouriteData.turf.length,
  //             itemBuilder: (context, index) => CustomFavourite(
  //               image: favouriteData.turf[index].turfDetails[0].turfPictures[0],
  //               turfName: favouriteData.turf[index].turfDetails[0].centername,
  //               location: favouriteData.turf[index].turfDetails[0].location,
  //               category: favouriteData.turf[index].turfDetails[0].category,
  //               price: favouriteData.turf[index].turfDetails[0].price.toString(),
  //               remove: () {
  //                 fc.addFavourite(favouriteData.turf[index].turfId);
  //                 log(favouriteData.turf[index].turfDetails[0].centername);
  //               },
  //               bookNow: () {},
  //             ),
  //           )
  //         // )
  //         : SizedBox(
  //             height: 80.h,
  //             child: Lottie.asset("assets/animation/nodata.json",
  //                 height: 45.h, width: double.maxFinite),
  //           );
  //   },
  // )
}

// ignore_for_file: must_be_immutable, prefer_const_constructors_in_immutables

import 'dart:developer';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:play_turf/Controller/favourite_controller.dart';
import 'package:play_turf/Controller/homepage_controller.dart';
import 'package:play_turf/View/Pages/bookingpages/booknow.dart';
import 'package:play_turf/View/Pages/home_screen/widgets/custom_banner.dart';
import 'package:play_turf/View/Pages/home_screen/widgets/custom_offers.dart';
import 'package:play_turf/View/Pages/home_screen/widgets/drawer.dart';
import 'package:play_turf/View/Pages/turfs/customturf.dart';
import 'package:play_turf/view/constants.dart';
import 'package:play_turf/model/banner.dart';
import 'package:play_turf/model/offer_model.dart';
import 'package:play_turf/model/turf_model.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map userDetails = {};
  bool isFav = false;
  final HomePageController c = Get.put(HomePageController());
  final FavouriteController fc = Get.put(FavouriteController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: FadeInLeft(
        duration: const Duration(milliseconds: 200),
        child: Scaffold(
          drawer: DrawerClass(),
          appBar: AppBar(
            title: Text(
              "Hii ${c.userDetails['user']['name']} !",
              style: kAppBarTitleStyle,
            ),
            leading: Builder(
              builder: (BuildContext context) {
                return Padding(
                  padding: EdgeInsets.only(left: 4.w),
                  child: IconButton(
                    icon: Icon(
                      Icons.sort,
                      color: Colors.black,
                      size: 4.h,
                    ),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                    tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
                  ),
                );
              },
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 5.w, right: 5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.maxFinite,
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(30),
                          child: FutureBuilder<BannerDatas>(
                            future: c.fetchBanner(),
                            builder: (context, AsyncSnapshot<BannerDatas> snapshot) {
                              if (snapshot.connectionState == ConnectionState.waiting) {
                                return Shimmer.fromColors(
                                  highlightColor: Colors.grey,
                                  baseColor: Colors.white,
                                  child: Container(
                                    height: 25.h,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.grey,
                                    ),
                                  ),
                                );
                              }
                              BannerDatas bannerDatas = snapshot.data!;
                              return CarouselSlider.builder(
                                options: CarouselOptions(
                                  autoPlayInterval: const Duration(seconds: 3),
                                  autoPlay: true,
                                  viewportFraction: 1,
                                  padEnds: false,
                                  autoPlayCurve: Curves.decelerate,
                                  onPageChanged: (index, reason) {
                                    c.bannerChange(index);
                                  },
                                ),
                                itemCount: bannerDatas.banner.length,
                                itemBuilder:
                                    (BuildContext context, int itemIndex, int pageViewIndex) =>
                                        CustomBanner(
                                  image: bannerDatas.banner[itemIndex].bannerImage,
                                  description: bannerDatas.banner[itemIndex].description,
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      kHeight,
                      Text(
                        'Available Offers for you!',
                        style: kBigText,
                      ),
                      kHeight2,
                    ],
                  ),
                ),
                Column(
                  children: [
                    FutureBuilder<OfferDatas>(
                      future: c.fetchOffers(),
                      builder: (context, AsyncSnapshot<OfferDatas> snapshot) {
                        if (snapshot.connectionState == ConnectionState.waiting) {
                          return Shimmer.fromColors(
                            highlightColor: Colors.grey,
                            baseColor: Colors.white,
                            child: Padding(
                              padding: EdgeInsets.only(left: 10.w, right: 10.w),
                              child: Container(
                                height: 25.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          );
                        }
                        OfferDatas offerDatas = snapshot.data!;
                        return CarouselSlider.builder(
                          options: CarouselOptions(
                            height: 25.h,
                            autoPlay: true,
                            enlargeCenterPage: true,
                            autoPlayCurve: Curves.decelerate,
                            onPageChanged: (index, reason) {
                              c.offerChange(index);
                            },
                          ),
                          itemCount: offerDatas.offer.length,
                          itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) {
                            var percentage = offerDatas.offer[itemIndex].offerPercent;
                            var price = offerDatas.offer[itemIndex].turfDetails[0].price;
                            var offerPrice = price - ((price / 100) * percentage).round();
                            return CustomOffer(
                              image: offerDatas.offer[itemIndex].turfDetails[0].turfPictures[0],
                              centername: offerDatas.offer[itemIndex].turfDetails[0].centername,
                              price: price.toString(),
                              offerPrice: offerPrice.toString(),
                              offerPercentage: "$percentage%\nOff",
                              bookNowbutton: () {
                                Get.to(const BookNowPage());
                                log(offerDatas.offer[itemIndex].turfDetails[0].centername);
                              },
                            );
                          },
                        );
                      },
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(left: 5.w, right: 5.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      kHeight2,
                      Text(
                        'Book Now!',
                        style: kBigText,
                      ),
                      kHeight2,
                      FutureBuilder<TurfDetails>(
                        future: c.fetchTurfs(),
                        builder: (context, AsyncSnapshot<TurfDetails> snapshot) {
                          if (snapshot.connectionState == ConnectionState.waiting) {
                            return ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              separatorBuilder: (context, index) => kHeight2,
                              itemCount: 5,
                              itemBuilder: (context, index) => Shimmer.fromColors(
                                highlightColor: Colors.grey,
                                baseColor: Colors.white,
                                child: Container(
                                  height: 12.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                            );
                          }
                          TurfDetails turfDetails = snapshot.data!;
                          return ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) => kHeight2,
                            itemCount: turfDetails.turf.length,
                            itemBuilder: (context, index) => CustomTurf(
                              image: turfDetails.turf[index].turfPictures[0].toString(),
                              turfName: turfDetails.turf[index].centername,
                              categoryName: turfDetails.turf[index].category,
                              location: turfDetails.turf[index].location,
                              price: turfDetails.turf[index].price.toString(),
                              booknow: () {},
                              favbutton: () {
                                fc.addFavourite(turfDetails.turf[index].id);
                              },
                            ),
                          );
                        },
                      ),
                      kHeight2,
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}


//  CarouselSlider(
//                       options: CarouselOptions(
//                         height: 25.h,
//                         autoPlay: true,
//                         enlargeCenterPage: true,
//                         autoPlayCurve: Curves.decelerate,
//                         onPageChanged: (index, reason) {
//                           c.offerChange(index);
//                         },
//                       ),
//                       items: offerList,
//                     ),




    // CustomOffer(
    //                         image:
    //                             offerDatas.offer[itemIndex].turfDetails[itemIndex].turfPictures[0],
    //                         centername:
    //                             offerDatas.offer[itemIndex].turfDetails[itemIndex].centername,
    //                         price:
    //                             offerDatas.offer[itemIndex].turfDetails[itemIndex].price.toString(),
    //                         offerPercentage: offerDatas.offer[itemIndex].offerPercent.toString(),
    //                         bookNowbutton: () {},
    //                       ),




    //  imagesList
    //                             .map(
    //                               (item) => Stack(
    //                                 children: <Widget>[
    //                                   SizedBox(
    //                                     width: double.maxFinite,
    //                                     height: 30.h,
    //                                     child: c.bannerDetails.isNotEmpty
    //                                         ? Image.network(
    //                                             c.bannerDetails[c.bannerIndex.value].banner,
    //                                             fit: BoxFit.cover,
    //                                             width: 90.w,
    //                                           )
    //                                         : Shimmer.fromColors(
    //                                             highlightColor: Colors.grey,
    //                                             baseColor: Colors.white,
    //                                             child: Container(
    //                                               width: 90.w,
    //                                               height: 30.h,
    //                                               color: Colors.grey,
    //                                             ),
    //                                           ),
    //                                   ),
    //                                   Center(
    //                                     child: c.bannerDetails.isNotEmpty
    //                                         ? Text(
    //                                             c.bannerDetails[c.bannerIndex.value].message,
    //                                             style: TextStyle(
    //                                               fontSize: 15.sp,
    //                                               fontWeight: FontWeight.bold,
    //                                               color: Colors.white,
    //                                             ),
    //                                             textAlign: TextAlign.center,
    //                                           )
    //                                         : Shimmer.fromColors(
    //                                             baseColor: Colors.grey,
    //                                             highlightColor: Colors.white,
    //                                             child: const SizedBox(),
    //                                           ),
    //                                   ),
    //                                 ],
    //                               ),
    //                             )
    //                             .toList(),
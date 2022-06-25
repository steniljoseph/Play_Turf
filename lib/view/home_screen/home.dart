import 'dart:developer';

import 'package:animate_do/animate_do.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:play_turf/api/api_constant.dart';
import 'package:play_turf/constants.dart';
import 'package:play_turf/controllers/homepage_controller.dart';
import 'package:play_turf/model/offer_model.dart';
import 'package:play_turf/view/home_screen/widgets/drawer.dart';
import 'package:play_turf/view/home_screen/widgets/offers.dart';
import 'package:shimmer/shimmer.dart';
import 'package:play_turf/view/home_screen/widgets/turfs.dart';
import 'package:sizer/sizer.dart';
import 'package:carousel_slider/carousel_slider.dart';

final List<Widget> offerList = [
  const FivePerOffer(),
  const TenPerOffer(),
];

final List<Widget> turfList = [
  const Turfs1(),
  const Turfs2(),
  const Turfs3(),
];

// List<BannerDetails> bannerDetails = [];

// final List<String> titles = [
//   'Be Active With Play Turf',
//   'Get 50% Off on your First Booking',
// ];

class HomePage extends StatefulWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // late dynamic data;
  // late dynamic dataa;
  // final int _currentIndex = 0;
  int currentIndex = 0;
  Map userDetails = {};

  late dynamic offer;
  // List<BannerDetails> bannerDetails = [];
  List<OfferDetails> offerDetails = [];

  final List<String> imagesList = [
    'assets/images/first.jpg',
    'assets/images/second.jpg',
  ];

  final HomePageController c = Get.put(HomePageController());

  // @override
  // void initState() {
  //   fetchOffers();
  //   super.initState();
  // }

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
                          child:
                              //  Obx(
                              //   () =>
                              CarouselSlider(
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
                            items: imagesList
                                .map(
                                  (item) => Stack(
                                    children: <Widget>[
                                      SizedBox(
                                        width: double.maxFinite,
                                        height: 30.h,
                                        child: c.bannerDetails.isNotEmpty
                                            ? Image.network(
                                                c.bannerDetails[c.bannerIndex.value].banner,
                                                fit: BoxFit.cover,
                                                width: 90.w,
                                              )
                                            : Shimmer.fromColors(
                                                highlightColor: Colors.grey,
                                                baseColor: Colors.white,
                                                child: Container(
                                                  width: 90.w,
                                                  height: 30.h,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                      ),
                                      Center(
                                        child: c.bannerDetails.isNotEmpty
                                            ? Text(
                                                c.bannerDetails[c.bannerIndex.value].message,
                                                style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.white,
                                                ),
                                                textAlign: TextAlign.center,
                                              )
                                            : Shimmer.fromColors(
                                                baseColor: Colors.grey,
                                                highlightColor: Colors.white,
                                                child: const SizedBox(),
                                              ),
                                      ),
                                    ],
                                  ),
                                )
                                .toList(),
                          ),
                          // ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: imagesList.map((urlOfItem) {
                          int index = imagesList.indexOf(urlOfItem);
                          return Container(
                            width: 10.0,
                            height: 10.0,
                            margin: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 2.0,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: c.bannerIndex.value == index
                                  ? const Color.fromRGBO(0, 0, 0, 0.8)
                                  : const Color.fromRGBO(0, 0, 0, 0.3),
                            ),
                          );
                        }).toList(),
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
                    // Obx(
                    //   () =>
                    CarouselSlider(
                      options: CarouselOptions(
                        height: 25.h,
                        autoPlay: true,
                        enlargeCenterPage: true,
                        autoPlayCurve: Curves.decelerate,
                        onPageChanged: (index, reason) {
                          c.offerChange(index);
                        },
                      ),
                      items: offerList,
                    ),
                    // ),
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
                      CarouselSlider(
                        options: CarouselOptions(
                          autoPlayInterval: const Duration(seconds: 3),
                          height: 30.h,
                          autoPlay: true,
                          viewportFraction: 1,
                          enlargeCenterPage: true,
                          autoPlayCurve: Curves.decelerate,
                          onPageChanged: (index, reason) {
                            setState(
                              () {
                                currentIndex = index;
                              },
                            );
                          },
                        ),
                        items: turfList,
                      ),
                      kHeight2,
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: turfList.map((urlOfItem) {
                          int index = turfList.indexOf(urlOfItem);
                          return Container(
                            width: 10.0,
                            height: 10.0,
                            margin: const EdgeInsets.symmetric(
                              vertical: 10.0,
                              horizontal: 2.0,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: currentIndex == index
                                  ? const Color.fromRGBO(0, 0, 0, 0.8)
                                  : const Color.fromRGBO(0, 0, 0, 0.3),
                            ),
                          );
                        }).toList(),
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

  // fetchBanner() async {
  //   try {
  //     Response response = await Dio().get('https://sudheeshm.herokuapp.com/admin_panel/banner');
  //     if (response.statusCode == 200) {
  //       log(response.data.toString());
  //       data = response.data;
  //       bannerDetails.add(BannerDetails(
  //           message: data['banner'][0]['description'].toString(),
  //           banner: data['banner'][0]['bannerImage'].toString()));
  //       bannerDetails.add(BannerDetails(
  //           message: data['banner'][1]['description'].toString(),
  //           banner: data['banner'][1]['bannerImage'].toString()));
  //       // print(data['banner'][1]['description'].toString());
  //       // print(data['banner'][1]['bannerImage'].toString());
  //       // var listUsers = getUsersData.map((i) => User.fromJSON(i)).toList();
  //       // return listUsers;
  //     } else {
  //       throw DioError;
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }

  // fetchOffers() async {
  //   try {
  //     final response = await Dio().get(ApiUrl.baseUrl + ApiUrl.getOfferData);
  //     if (response.statusCode == 200) {
  //       print('object');
  //       offer = response.data;
  //       print(offer);
  //       offerDetails.add(OfferDetails(
  //         offerPercent: offer['offer'][0]['offerPercent'].toString(),
  //         centername: offer['offer'][0]['turfDetails'][0]['centername'].toString(),
  //         price: offer['offer'][0]['turfDetails'][0]['price'].toString(),
  //         image: offer['offer'][0]['turfDetails'][0]['turfPictures'].toString(),
  //       ));
  //       offerDetails.add(OfferDetails(
  //         offerPercent: offer['offer'][1]['offerPercent'].toString(),
  //         centername: offer['offer'][1]['turfDetails'][0]['centername'].toString(),
  //         price: offer['offer'][1]['turfDetails'][0]['price'].toString(),
  //         image: offer['offer'][1]['turfDetails'][0]['turfPictures'].toString(),
  //       ));

  //       print('jjjjj');

  //       print(offer['message']);
  //       print(offer['offer'][1]['turfDetails'][0]['centername'].toString());
  //       print(offer['offer'][0]['turfDetails'][0]['centername'].toString());
  //       print(offer['offer'][1]['turfDetails'][0]['turfPictures'].toString());
  //     } else {
  //       throw DioError;
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }
}

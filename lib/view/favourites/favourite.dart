import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:play_turf/controllers/favourite_controller.dart';
import 'package:play_turf/view/constants.dart';
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
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: kBlackColor,
          title: Text(
            'Favourites',
            style: kAppBarTitleStyle,
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(padding: EdgeInsets.only(left: 5.w, right: 5.w), child: const SizedBox()
              //  FutureBuilder<List<FavouriteData>>(
              //   future: fc.fetchFavorites(),
              //   builder: (context, AsyncSnapshot<List<FavouriteData>> snapshot) {
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
              //     List<FavouriteData> favouriteData = snapshot.data!;
              //     return favouriteData.isNotEmpty
              //         ?
              //         //  GetX(
              //         //     builder: (controller) =>
              //         ListView.separated(
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
              //                 // setState(() {});
              //                 // fc.addFavourite(favouriteData.turf[index].turfId);
              //                 // log(favouriteData.turf[index].turfDetails[0].centername);
              //                 // setState(() {
              //                 //   fc.fetchFavorites();
              //                 // });
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
              ),
        ),
      ),
    );
  }
}

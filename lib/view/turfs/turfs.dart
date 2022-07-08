import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:play_turf/controllers/favourite_controller.dart';
import 'package:play_turf/view/constants.dart';
import 'package:play_turf/controllers/homepage_controller.dart';
import 'package:play_turf/model/turf_model.dart';
import 'package:play_turf/view/turfs/customturf.dart';
import 'package:sizer/sizer.dart';

class TurfLIstPage extends StatelessWidget {
  TurfLIstPage({Key? key}) : super(key: key);

  final HomePageController c = Get.put(HomePageController());
  final FavouriteController fc = Get.put(FavouriteController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: kBlackColor,
          title: Text(
            'Turfs',
            style: kAppBarTitleStyle,
          ),
          actions: [
            Wrap(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.filter_2),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.watch_later_outlined),
                ),
              ],
            )
          ],
        ),
        body: Padding(
          padding: EdgeInsets.only(left: 5.w, right: 5.w),
          child: FutureBuilder<TurfDetails>(
            future: c.fetchTurfs(),
            builder: (context, AsyncSnapshot<TurfDetails> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const Center(
                  child: CupertinoActivityIndicator(
                    radius: 18,
                    color: kGreenColor,
                  ),
                );
              }
              TurfDetails turfDetails = snapshot.data!;
              return ListView.separated(
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
                    // fc.turfID = turfDetails.turf[index].id;
                    // print(turfDetails.turf[index].centername);
                    // fc.addFavourite();
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}

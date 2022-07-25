// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:play_turf/Controllers/favourite_controller.dart';
import 'package:play_turf/Controllers/turf_controller.dart';
import 'package:play_turf/Models/turf_model.dart';
import 'package:play_turf/Views/Pages/turfs/customturf.dart';
import 'package:play_turf/Views/constants.dart';
import 'package:sizer/sizer.dart';

// final TurfController tc = Get.put(TurfController());
final tc = Get.find<TurfController>();
late List<TurfList> turfList = tc.turfList.turf!;

class TurfLIstPage extends StatefulWidget {
  const TurfLIstPage({Key? key}) : super(key: key);

  @override
  State<TurfLIstPage> createState() => _TurfLIstPageState();
}

class _TurfLIstPageState extends State<TurfLIstPage> {
  bool valuefirst = false;
  bool valuesecond = false;
  bool valuethird = false;
  bool valuefourth = false;
  final FavouriteController fc = Get.put(FavouriteController());

  final TurfController tc = Get.put(TurfController());

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
                  onPressed: () {
                    showSearch(context: context, delegate: MysearchDelegate());
                  },
                  icon: const Icon(Icons.search),
                ),
                IconButton(
                  onPressed: () {
                    
                    Get.bottomSheet(
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30),
                            topLeft: Radius.circular(30),
                          ),
                          color: kGreyColour,
                        ),
                        padding: const EdgeInsets.all(25),
                        height: 22.h,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Filter Turfs by Category",
                              style: kBigText,
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  checkColor: Colors.greenAccent,
                                  activeColor: Colors.red,
                                  value: valuefirst,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      // navigator!.pop();
                                      valuefirst = value!;
                                    });
                                  },
                                ),
                                Text(
                                  "Football",
                                  style: kDetailText,
                                ),
                                kWidth2,
                                Checkbox(
                                  checkColor: Colors.greenAccent,
                                  activeColor: Colors.red,
                                  value: valuesecond,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      // navigator!.pop();
                                      valuesecond = value!;
                                    });
                                  },
                                ),
                                Text(
                                  "Cricket",
                                  style: kDetailText,
                                ),
                              ],
                            ),
                            Text(
                              "Filter Turfs by Location",
                              style: kBigText,
                            ),
                            Row(
                              children: [
                                Checkbox(
                                  checkColor: Colors.greenAccent,
                                  activeColor: Colors.red,
                                  value: valuethird,
                                  onChanged: (value) {
                                    print("HAiiiii");

                                    setState(() {
                                      // navigator!.pop();
                                      valuethird = value!;
                                    });
                                  },
                                ),
                                Text(
                                  "Kochi",
                                  style: kDetailText,
                                ),
                                kWidth2,
                                kWidth2,
                                Checkbox(
                                  checkColor: Colors.greenAccent,
                                  activeColor: Colors.red,
                                  value: valuefourth,
                                  onChanged: (value) {
                                    setState(() {
                                      // navigator!.pop();
                                      valuefourth = value!;
                                    });
                                  },
                                ),
                                Text(
                                  "Kakkanad",
                                  style: kDetailText,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.filter_alt_outlined),
                ),
              ],
            )
          ],
        ),
        body: Obx(
          () => Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: tc.loading.value
                ? const Center(
                    child: CupertinoActivityIndicator(
                      radius: 18,
                      color: kGreenColor,
                    ),
                  )
                : ListView.separated(
                    itemCount: turfList.length,
                    separatorBuilder: (context, index) => kHeight2,
                    itemBuilder: (context, index) => CustomTurf(
                      turfList: turfList[index],
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}

class MysearchDelegate extends SearchDelegate {
  @override
  List<Widget>? buildActions(BuildContext context) => [
        IconButton(
          onPressed: () {
            if (query.isEmpty) {
              close(context, null);
            } else {
              query = '';
            }
          },
          icon: const Icon(
            Icons.clear,
            color: kBlackColor,
          ),
        )
      ];

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        return close(context, null);
      },
      icon: const Icon(
        Icons.arrow_back,
        color: kBlackColor,
      ),
    );
  }

  TurfList? turfRes;

  @override
  Widget buildResults(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 6.w, top: 3.h),
      child: CustomTurf(turfList: turfRes!),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final list = turfList.where(
      (element) {
        if (element.centername.toLowerCase().contains(query.toLowerCase())) {
          return true;
        }
        return false;
      },
    ).toList();
    return ListView.builder(
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(list[index].centername),
          onTap: () {
            turfRes = list[index];
            showResults(context);
          },
        );
      },
      itemCount: list.length,
    );
  }
}

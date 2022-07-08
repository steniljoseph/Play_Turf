// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:page_transition/page_transition.dart';
import 'package:play_turf/view/constants.dart';
import 'package:play_turf/main.dart';
import 'package:play_turf/model/savedkeys.dart';
import 'package:play_turf/view/bookingpages/bknghistory.dart';
import 'package:play_turf/view/common_widgets/customlist.dart';
import 'package:play_turf/view/favourites/favourite.dart';
import 'package:play_turf/view/home_screen/widgets/alert.dart';
import 'package:play_turf/view/profile/profile.dart';
import 'package:play_turf/view/settings/settings.dart';
import 'package:play_turf/view/sign_in/signin.dart';
import 'package:play_turf/view/turfs/turfs.dart';
import 'package:share_plus/share_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sizer/sizer.dart';

class DrawerClass extends StatelessWidget {
  DrawerClass({
    Key? key,
  }) : super(key: key);

  Map userDetails = SharedPrefrenceModel.getString('userDetails');

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                PageTransition(
                  child: ProfilePage(),
                  type: PageTransitionType.bottomToTop,
                ),
              );
            },
            child: DrawerHeader(
              child: Column(
                children: [
                  CircleAvatar(
                    backgroundImage: const AssetImage('assets/images/second.jpg'),
                    radius: 12.w,
                    backgroundColor: Colors.black,
                  ),
                  kHeight,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(userDetails['user']['email']),
                      Text(userDetails['user']['phone'].toString())
                    ],
                  ),
                ],
              ),
            ),
          ),
          CustomListTile(
            titleNew: 'Turfs',
            leadingNew: Icons.sports_soccer_rounded,
            ontapNew: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                PageTransition(
                  child: TurfLIstPage(),
                  type: PageTransitionType.bottomToTop,
                ),
              );
            },
          ),
          CustomListTile(
            titleNew: 'My Bookings',
            leadingNew: Icons.calendar_month,
            ontapNew: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                PageTransition(
                  child: BookingHistory(),
                  type: PageTransitionType.bottomToTop,
                ),
              );
            },
          ),
          CustomListTile(
            titleNew: 'My Favourites',
            leadingNew: Icons.favorite,
            ontapNew: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                PageTransition(
                  child: const FavouritePAge(),
                  type: PageTransitionType.bottomToTop,
                ),
              );
            },
          ),
          CustomListTile(
            titleNew: 'Help & Support',
            leadingNew: Icons.headset_mic,
            ontapNew: () {
              Navigator.pop(context);
            },
          ),
          CustomListTile(
            titleNew: 'FAQ',
            leadingNew: Icons.help,
            ontapNew: () {
              Navigator.pop(context);
            },
          ),
          CustomListTile(
            titleNew: 'Settings',
            leadingNew: Icons.settings,
            ontapNew: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                PageTransition(
                  child: const SettingsPage(),
                  type: PageTransitionType.bottomToTop,
                ),
              );
            },
          ),
          CustomListTile(
            titleNew: 'Invite a Friend',
            leadingNew: Icons.share,
            ontapNew: () {
              Navigator.pop(context);
              Share.share(
                'Hey Checkout this Cool Turf Booking App.',
              );
            },
          ),
          CustomListTile(
            titleNew: 'Logout',
            leadingNew: Icons.logout,
            ontapNew: () => showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertPopUp(
                  title: "Logout",
                  description: "Do you want to Logout",
                  leftontap: () {
                    sharedprefLogout(context);
                  },
                  leftButton: "Yes",
                  rightbutton: "No",
                  rightontap: () {
                    Navigator.of(context).pop();
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

Future sharedprefLogout(BuildContext context) async {
  final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.setBool(savedKey, false);
  Get.offAll(SignInPage(), transition: Transition.fade);
  // Navigator.pushAndRemoveUntil(
  //   context,
  //   PageTransition(child: SignInPage(), type: PageTransitionType.fade),
  //   (route) => false,
  // );
}

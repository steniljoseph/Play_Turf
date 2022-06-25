import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:play_turf/constants.dart';
import 'package:play_turf/model/savedkeys.dart';
import 'package:play_turf/view/profile/changepass.dart';
import 'package:play_turf/view/profile/editprofile.dart';
import 'package:sizer/sizer.dart';

class ProfilePage extends StatelessWidget {
  // final dynamic dtata;
  ProfilePage({
    Key? key,
  }) : super(key: key);

  Map userDetails = SharedPrefrenceModel.getString('userDetails');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          foregroundColor: kBlackColor,
          title: Text(
            'Profile',
            style: kAppBarTitleStyle,
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(3.h),
          child: SizedBox(
            width: double.maxFinite,
            child: Column(
              children: [
                kHeight2,
                Container(
                  decoration: BoxDecoration(
                    color: kGreyColour[300],
                    borderRadius: const BorderRadius.only(
                      bottomLeft: Radius.circular(40),
                      bottomRight: Radius.circular(40),
                    ),
                  ),
                  child: Column(
                    children: [
                      kHeight2,
                      SizedBox(
                        width: double.maxFinite,
                        child: CircleAvatar(
                          backgroundImage: const AssetImage('assets/images/second.jpg'),
                          backgroundColor: kBlackColor,
                          radius: 20.w,
                        ),
                      ),
                      kHeight2,
                    ],
                  ),
                ),
                kHeight2,
                Container(
                  decoration: BoxDecoration(
                    color: kGreyColour[300],
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.only(left: 5.w, right: 5.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        kHeight2,
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Name',
                                    style: kBigText,
                                  ),
                                  Text(
                                    ' : ',
                                    style: kBigText,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Text(
                                userDetails['user']['name'],
                                style: kBigText,
                              ),
                              flex: 2,
                            ),
                          ],
                        ),
                        kHeight2,
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Email',
                                    style: kBigText,
                                  ),
                                  Text(
                                    ' : ',
                                    style: kBigText,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Text(
                                userDetails['user']['email'],
                                style: kBigText,
                              ),
                              flex: 2,
                            ),
                          ],
                        ),
                        kHeight2,
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Phone',
                                    style: kBigText,
                                  ),
                                  Text(
                                    ' : ',
                                    style: kBigText,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Text(
                                userDetails['user']['phone'].toString(),
                                style: kBigText,
                              ),
                              flex: 2,
                            ),
                          ],
                        ),
                        kHeight2,
                        Row(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Address',
                                    style: kBigText,
                                  ),
                                  Text(
                                    ' : ',
                                    style: kBigText,
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Text(
                                'Kannur ',
                                style: kBigText,
                              ),
                              flex: 2,
                            ),
                          ],
                        ),
                        kHeight2,
                      ],
                    ),
                  ),
                ),
                kHeight2,
                GestureDetector(
                  onTap: (() {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: const EditProfile(),
                        type: PageTransitionType.fade,
                      ),
                    );
                  }),
                  child: Container(
                    width: 90.w,
                    height: 6.5.h,
                    decoration: const BoxDecoration(
                      color: kFillColour,
                    ),
                    child: Center(
                      child: Text(
                        'Edit Profile',
                        style: kBigText,
                      ),
                    ),
                  ),
                ),
                kHeight2,
                GestureDetector(
                  onTap: (() {
                    Navigator.push(
                      context,
                      PageTransition(
                        child: const ChangePass(),
                        type: PageTransitionType.fade,
                      ),
                    );
                  }),
                  child: Container(
                    width: 90.w,
                    height: 6.5.h,
                    decoration: const BoxDecoration(
                      color: kFillColour,
                    ),
                    child: Center(
                      child: Text(
                        'Change Password',
                        style: kBigText,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:play_turf/constants.dart';
import 'package:play_turf/controllers/homepage_controller.dart';
import 'package:sizer/sizer.dart';

final HomePageController c = Get.put(HomePageController());

class Turfs1 extends StatelessWidget {
  const Turfs1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/mts.jpg',
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
              height: 10.h,
              width: 90.w,
            ),
          ),
          Positioned(
            top: 23.h,
            left: 5.w,
            child: Text(
              'Folks Play',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 22.h,
            left: 45.w,
            child: IconButton(
              iconSize: 4.h,
              onPressed: () {},
              icon: const Icon(Icons.favorite_border),
            ),
          ),
          Positioned(
            child: kBookNowButton,
            top: 22.5.h,
            left: 60.w,
          ),
        ],
      ),
    );
  }
}

class Turfs2 extends StatelessWidget {
  const Turfs2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/folks.jpg',
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
              height: 10.h,
              width: 90.w,
            ),
          ),
          Positioned(
            top: 23.h,
            left: 5.w,
            child: Text(
              'MTS Turf',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 22.h,
            left: 45.w,
            child: IconButton(
              iconSize: 4.h,
              onPressed: () {},
              icon: const Icon(Icons.favorite_border),
            ),
          ),
          Positioned(
            child: kBookNowButton,
            top: 22.5.h,
            left: 60.w,
          ),
        ],
      ),
    );
  }
}

class Turfs3 extends StatelessWidget {
  const Turfs3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/cricketturf.jpg',
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
              height: 10.h,
              width: 90.w,
            ),
          ),
          Positioned(
            top: 23.h,
            left: 5.w,
            child: Text(
              'F12 Arena',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 22.h,
            left: 45.w,
            child: IconButton(
              iconSize: 4.h,
              onPressed: () {},
              icon: const Icon(Icons.favorite_border),
            ),
          ),
          Positioned(
            child: kBookNowButton,
            top: 22.5.h,
            left: 60.w,
          ),
        ],
      ),
    );
  }
}

class Turfs4 extends StatelessWidget {
  const Turfs4({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.maxFinite,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image: const DecorationImage(
          image: AssetImage(
            'assets/images/second.jpg',
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
              height: 10.h,
              width: 90.w,
            ),
          ),
          Positioned(
            top: 23.h,
            left: 5.w,
            child: Text(
              'Folks Play',
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Positioned(
            top: 22.h,
            left: 45.w,
            child: IconButton(
              iconSize: 4.h,
              onPressed: () {},
              icon: const Icon(Icons.favorite_border),
            ),
          ),
          Positioned(
            child: kBookNowButton,
            top: 22.5.h,
            left: 60.w,
          ),
        ],
      ),
    );
  }
}

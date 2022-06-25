import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TabbarTabs extends StatelessWidget {
  const TabbarTabs({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 6.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(
          10.0.w,
        ),
      ),
      child: TabBar(
        isScrollable: true,
        automaticIndicatorColorAdjustment: true,
        controller: _tabController,
        indicatorPadding: EdgeInsets.zero,
        indicator: BoxDecoration(borderRadius: BorderRadius.circular(10.w), color: Colors.black),
        labelColor: Colors.white,
        labelStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
        unselectedLabelColor: Colors.black,
        unselectedLabelStyle: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.bold),
        tabs: const [
          Tab(
            text: 'Football',
          ),
          Tab(
            text: 'Cricket',
          ),
        ],
      ),
    );
  }
}

class TabBarViews extends StatelessWidget {
  const TabBarViews({
    Key? key,
    required TabController tabController,
  })  : _tabController = tabController,
        super(key: key);

  final TabController _tabController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TabBarView(
        controller: _tabController,
        children: [
          Center(
            child: Column(
              children: [
                Row(
                    // children: [
                    //   FadeInLeft(
                    //     child:
                    //   ),
                    //   SizedBox(
                    //     width: 2.w,
                    //   ),
                    //   FadeInRight(
                    //     child:
                    //   ),
                    // ],
                    ),
                // FadeInUp(child:)
              ],
            ),
          ),
          Center(
            child: Column(
              children: [
                Row(
                    // children: [
                    //   FadeInLeft(
                    //     child:
                    //   ),
                    //   SizedBox(
                    //     width: 2.w,
                    //   ),
                    //   FadeInRight(
                    //     child: ,
                    //   ),
                    // ],
                    ),
                // FadeInUp(child: )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

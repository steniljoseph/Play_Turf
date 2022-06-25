import 'package:flutter/material.dart';
import 'package:play_turf/constants.dart';
import 'package:sizer/sizer.dart';

class TurfLIstPage extends StatelessWidget {
  const TurfLIstPage({Key? key}) : super(key: key);

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
          body: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.only(left: 5.w, right: 5.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        width: 20.w,
                        height: 12.h,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/mts.jpg',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: 32.h,
                        height: 12.h,
                        decoration: BoxDecoration(
                          color: kGreyColour[300],
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 5.w, right: 5.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              kHeight,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'MTS Turf',
                                    style: kDetailText,
                                  ),
                                  Text(
                                    '  |  ',
                                    style: kDetailText,
                                  ),
                                  Text(
                                    'Football',
                                    style: kDetailText,
                                  ),
                                ],
                              ),
                              kHeight,
                              Text(
                                'Kakkanad',
                                style: kDetailText,
                              ),
                              kHeight,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '₹ 1500',
                                    style: kDetailText,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.favorite_border,
                                        size: 2.5.h,
                                      ),
                                      kWidth,
                                      kWidth,
                                      Container(
                                        height: 3.5.h,
                                        width: 20.w,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.orange,
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'Book Now',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  kHeight2,
                  Row(
                    children: [
                      Container(
                        width: 20.w,
                        height: 12.h,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20),
                            bottomLeft: Radius.circular(20),
                          ),
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/images/mts.jpg',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Container(
                        width: 32.h,
                        height: 12.h,
                        decoration: BoxDecoration(
                          color: kGreyColour[300],
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                          ),
                        ),
                        child: Padding(
                          padding: EdgeInsets.only(left: 5.w, right: 5.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              kHeight,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text(
                                    'MTS Turf',
                                    style: kDetailText,
                                  ),
                                  Text(
                                    '  |  ',
                                    style: kDetailText,
                                  ),
                                  Text(
                                    'Football',
                                    style: kDetailText,
                                  ),
                                ],
                              ),
                              kHeight,
                              Text(
                                'Kakkanad',
                                style: kDetailText,
                              ),
                              kHeight,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    '₹ 1500',
                                    style: kDetailText,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.favorite_border,
                                        size: 2.5.h,
                                      ),
                                      kWidth,
                                      kWidth,
                                      Container(
                                        height: 3.5.h,
                                        width: 20.w,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.orange,
                                        ),
                                        child: const Center(
                                          child: Text(
                                            'Book Now',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )),
    );
  }
}

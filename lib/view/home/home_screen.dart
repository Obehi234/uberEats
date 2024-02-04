import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/textStyles.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> categories = [
    ['assets/images/categories/carrebian.png', 'Carribean'],
    ['assets/images/categories/chinese.png', 'Chinese'],
    ['assets/images/categories/convenience.png', 'Convenience'],
    ['assets/images/categories/dessert.png', 'Dessert'],
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
          children: [
            SizedBox(height: 2.h),
            Text(
              'Current Location',
              style: AppTextStyles.body16Bold,
            ),
            SizedBox(height: 2.h),
            Row(
              children: [
                Expanded(
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.sp),
                        color: greyShade3,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'American',
                            style: AppTextStyles.body16Bold,
                          ),
                          const Image(
                            image: AssetImage(
                                'assets/images/categories/american.png'),
                          )
                        ],
                      )),
                ),
                SizedBox(width: 2.w),
                Expanded(
                  child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.sp),
                        color: greyShade3,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Grocery',
                            style: AppTextStyles.body16Bold,
                          ),
                          const Image(
                            image: AssetImage(
                                'assets/images/categories/grocery.png'),
                          )
                        ],
                      )),
                )
              ],
            ),
            SizedBox(height: 1.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: categories
                  .map((e) => Column(
                        children: [
                          Container(
                            height: 22.w,
                            width: 22.w,
                            decoration: BoxDecoration(
                              color: greyShade3,
                              borderRadius: BorderRadius.circular(5.sp),
                            ),
                            child: Image(image: AssetImage(e[0])),
                          ),
                          SizedBox(height: 1.h),
                          Text(e[1],
                              style: AppTextStyles.small10Bold
                                  .copyWith(fontSize: 10.sp)),
                        ],
                      ))
                  .toList(),
            ),
            SizedBox(height: 2.h),
            Divider(
              thickness: 1.h,
              color: greyShade3,
            ),
            SizedBox(height: 0.8.h),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Container(
                    height: 18.h,
                    width: 94.w,
                    margin: EdgeInsets.only(bottom: 2.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5.sp),
                      color: greyShade3,
                    ),
                  );
                })
          ]),
    );
  }
}

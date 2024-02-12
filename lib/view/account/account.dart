import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sizer/sizer.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({super.key});

  @override
  State<AccountScreen> createState() => _AccountState();
}

class _AccountState extends State<AccountScreen> {
  List account = [
    [FontAwesomeIcons.shop, 'Orders'],
    [FontAwesomeIcons.heart, 'Your favourites'],
    [FontAwesomeIcons.star, 'Resturant Rewards'],
    [FontAwesomeIcons.wallet, 'Wallet'],
    [FontAwesomeIcons.gift, 'Send a gift'],
    [FontAwesomeIcons.suitcase, 'Business preferences'],
    [FontAwesomeIcons.person, 'Help'],
    [FontAwesomeIcons.tag, 'Promotion'],
    [FontAwesomeIcons.ticket, 'Uber Pass'],
    [FontAwesomeIcons.parachuteBox, 'Deliver with Uber'],
    [FontAwesomeIcons.gear, 'Settings'],
    [FontAwesomeIcons.powerOff, 'Sign Out'],
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 2.h),
              Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      border: Border.all(color: black, width: 1.5),
                    ),
                    child: CircleAvatar(
                      backgroundColor: white,
                      radius: 4.h,
                      child: FaIcon(
                        FontAwesomeIcons.user,
                        size: 4.h,
                        color: black,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    'Users Name',
                    style: AppTextStyles.body16,
                  ),
                ],
              ),
              SizedBox(height: 4.h),
              Expanded(
                child: ListView.builder(
                  itemCount: account.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading:
                          FaIcon(account[index][0], color: black, size: 2.h),
                      title: Text(account[index][1]),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

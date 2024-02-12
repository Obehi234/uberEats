// ignore: file_names
import 'package:delivery_app/controller/provider/authProvider/mobile_auth_provider.dart';
import 'package:delivery_app/controller/services/authServices/mobile_auth_services.dart';
import 'package:delivery_app/utils/colors.dart';
import 'package:delivery_app/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:country_picker/country_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class MobileLoginScreen extends StatefulWidget {
  const MobileLoginScreen({super.key});

  @override
  State<MobileLoginScreen> createState() => _MobileLoginScreenUserState();
}

class _MobileLoginScreenUserState extends State<MobileLoginScreen> {
  String selectedCountry = '+91';
  TextEditingController mobileNumberController = TextEditingController();
  bool receivedOTPButtonPressed = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        receivedOTPButtonPressed = false;
      });
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
            children: [
              SizedBox(height: 3.h),
              Text('Enter your mobile number', style: AppTextStyles.body16),
              SizedBox(height: 3.h),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () {
                      showCountryPicker(
                        context: context,
                        showPhoneCode: true,
                        onSelect: (Country country) {
                          setState(() {
                            selectedCountry = '+${country.phoneCode}';
                          });
                          // ignore: avoid_print
                          print('Select country: ${country.displayName}');
                        },
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: 6.h,
                      width: 25.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.sp),
                        // color: greyShade3,
                        border: Border.all(color: grey),
                      ),
                      child: Text(
                        selectedCountry,
                        style: AppTextStyles.body14,
                      ),
                    ),
                  ),
                  SizedBox(
                      width: 65.w,
                      child: TextField(
                        controller: mobileNumberController,
                        cursorColor: black,
                        style: AppTextStyles.textFieldTextStyle,
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                vertical: 0, horizontal: 2.w),
                            hintText: 'Mobile Number',
                            hintStyle: AppTextStyles.textFieldHintTextStyle,
                            // filled: true,
                            // fillColor: greyShade3,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(4.sp),
                              borderSide: BorderSide(
                                color: grey,
                              ),
                            )),
                      ))
                ],
              ),
              SizedBox(height: 3.h),
              ElevatedButton(
                  onPressed: () {
                    setState(() {
                      receivedOTPButtonPressed = true;
                    });
                    context.read<MobileAuthProvider>().updateMobileNumber(
                        '$selectedCountry${mobileNumberController.text.trim()}');
                    MobileAuthServices.receiveOTP( context,
                    
                        '$selectedCountry${mobileNumberController.text.trim()}');
                  },
                  style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                      backgroundColor: black,
                      minimumSize: Size(90.w, 6.h)),
                  child:receivedOTPButtonPressed? CircularProgressIndicator(color: white): Stack(
                    children: [
                      Align(
                          alignment: Alignment.center,
                          child: Text('NEXT',
                              style:
                                  AppTextStyles.body16.copyWith(color: white))),
                      Positioned(
                          right: 2.w,
                          child: Icon(Icons.arrow_forward,
                              color: white, size: 4.h))
                    ],
                  )),
              SizedBox(height: 3.h),
              Text(
                'By proceeding, you concent to get calls, Whatsapp or SMS messages, including by automated means, from uber and its affiliates to the number provided',
                style: AppTextStyles.small12.copyWith(color: grey),
              ),
              SizedBox(height: 2.h),
              Row(
                children: [
                  Expanded(child: Divider(color: grey)),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Text('or',
                        style: AppTextStyles.small12.copyWith(color: grey)),
                  ),
                  Expanded(child: Divider(color: grey))
                ],
              ),
              SizedBox(height: 2.h),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.zero),
                      backgroundColor: white,
                      minimumSize: Size(90.w, 6.h)),
                  onPressed: () {},
                  child: Stack(
                    children: [
                      Align(
                          alignment: Alignment.center,
                          child: Text(
                            'Continue with google',
                            style: AppTextStyles.body16,
                          )),
                      Positioned(
                          left: 2.w,
                          child: IconButton(
                            onPressed: () {},
                            icon: Padding(
                              padding: const EdgeInsets.only(bottom: 12.0),
                              child: Icon(MdiIcons.google,
                                  color: black, size: 3.h),
                            ),
                          )),
                    ],
                  ))
            ]),
      ),
    );
  }
}

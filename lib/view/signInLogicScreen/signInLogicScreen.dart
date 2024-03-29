import 'package:delivery_app/controller/services/authServices/mobileAuthServices.dart';
import 'package:flutter/material.dart';

class SignInLogicScreen extends StatefulWidget {
  const SignInLogicScreen({super.key});

  @override
  State<SignInLogicScreen> createState() => _SignInLogicScreenState();
}

class _SignInLogicScreenState extends State<SignInLogicScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      MobileAuthServices.checkAuthentication(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Image(
      image: AssetImage('assets/images/splashScreenImage/SplashScreen.png'),
      fit: BoxFit.cover,
    ));
  }
}

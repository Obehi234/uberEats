import 'package:delivery_app/controller/provider/authProvider/mobileAuthProvider.dart';
import 'package:delivery_app/firebase_options.dart';
import 'package:delivery_app/view/signInLogicScreen/signInLogicScreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const UberEatsApp());
}

class UberEatsApp extends StatelessWidget {
  const UberEatsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (builder, _, __) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider<MobileAuthProvider>(create: (_) => MobileAuthProvider(),)
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(),
          home: const SignInLogicScreen(),
        ),
      );
    });
  }
}

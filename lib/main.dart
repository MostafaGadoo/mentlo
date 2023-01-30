import 'package:flutter/material.dart';
import 'package:mentlo/features/onboarding/widgets/onboarding_widget.dart';
import 'package:mentlo/features/sign_in/page/signin_page.dart';
import 'package:mentlo/features/sign_up/page/sigin_up_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SignInScreen(),
    );
  }
}



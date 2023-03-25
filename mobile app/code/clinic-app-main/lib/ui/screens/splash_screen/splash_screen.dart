// ignore_for_file: unnecessary_new, prefer_const_constructors

import 'dart:async';

import 'package:clinicapp/services/secure_sorage_service/secure_sorage_service.dart';
import 'package:clinicapp/ui/screens/auth/sign_in.dart';
import 'package:clinicapp/ui/screens/home/homescreen.dart';
import 'package:clinicapp/ui/styles/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => StartState();
}

class StartState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return initScreen(context);
  }

  @override
  void initState() {
    super.initState();

    startTimer();
  }

  startTimer() async {
    var duration = Duration(seconds: 3);

    return new Timer(duration, route);
  }

  Future authCheck() async {
    final token = await SecureStorageService().getToken();
    if (token != null) {
      return true;
    } else {
      return false;
    }
  }

  route() async {
    bool loginStatus = await authCheck();
    if (loginStatus) {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    } else {
      // ignore: use_build_context_synchronously
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => SignIn()));
    }
  }

  initScreen(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: Container(
      width: size.width,
      height: size.height,
      decoration: BoxDecoration(color: kPrimaryColorlight),
      child: Column(
        children: [
          SizedBox(
            height: size.height * 0.2,
          ),
          Padding(
              padding: EdgeInsets.only(
                  top: size.width * 0.1,
                  left: size.width * 0.1,
                  right: size.width * 0.1),
              child: SvgPicture.asset(
                "assets/icons/logo.svg",
                width: size.width * 0.6,
                height: size.height * 0.3,
              )),
          SizedBox(
            height: size.height * 0.12,
          ),
          CircularProgressIndicator(color: kPrimaryColordark),
          SizedBox(
            height: size.height * 0.22,
          ),
          Text(
            "Copyright 2023 © The GUIDE Clinic",
            style: TextStyle(
              fontSize: size.width * 0.03,
              fontWeight: FontWeight.w500,
              color: Colors.black.withOpacity(0.7),
            ),
          ),
        ],
      ),
    ));
  }
}

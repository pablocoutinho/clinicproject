import 'dart:async';

import 'package:clinicapp/config/http_handeler/httpClient.dart';
import 'package:clinicapp/ui/styles/app_styles.dart';
import 'package:flutter/material.dart';

import 'package:lottie/lottie.dart';

class MyPosition extends StatefulWidget {
  const MyPosition({super.key, required this.cinicName, required this.id});
  final int id;
  final String cinicName;
  @override
  State<MyPosition> createState() => _MyPositionState();
}

class _MyPositionState extends State<MyPosition> {
  @override
  void initState() {
    loadData();
    super.initState();
  }

  String frontpeople = "loading..";

  String posstion = "loading..";

  loadData() async {
    var pdata = await httpClient.getPossition(widget.id);
    if (pdata != null) {
      posstion = pdata.possition;
      frontpeople = pdata.front.toString();
      setState(() {});
      Timer(const Duration(seconds: 5), () {
        if (mounted) {
          loadData();
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: kPrimaryColordark),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                widget.cinicName,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: size.width * 0.066,
                  color: Colors.blue,
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Lottie.asset("assets/animation/waiting.json",
                  width: size.width * 0.6),
            ),
            Text(
              frontpeople,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: size.width * 0.096,
                color: kPrimaryColordark,
              ),
            ),
            Text(
              " People  infront of you",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: size.width * 0.046,
                color: kPrimaryColordark,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 14),
              child: Text(
                "Your Possition is $posstion",
                style: TextStyle(
                    fontSize: size.width * 0.041,
                    color: Colors.black.withOpacity(0.7)),
              ),
            ),
            SizedBox(
              height: size.height * 0.08,
            )
          ],
        ),
      ),
    );
  }
}

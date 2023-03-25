// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:clinicapp/ui/styles/app_styles.dart';

class BookkingCard extends StatelessWidget {
  final Color mainColor = kPrimaryColordark;

  final String titel;
  final String des;

  final Function() b1fun;
  final Function() b2fun;
  const BookkingCard({
    Key? key,
    required this.titel,
    required this.des,
    required this.b1fun,
    required this.b2fun,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(
              titel,
              style: TextStyle(color: mainColor, fontSize: size.width * 0.057),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              des,
              style: TextStyle(
                  color: Colors.black.withOpacity(0.6),
                  fontWeight: FontWeight.w400,
                  fontSize: size.width * 0.044),
            ),
            const SizedBox(
              height: 12,
            ),
            SizedBox(
              width: size.width * 0.7,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: BorderSide(
                      color: mainColor,
                    ),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  b1fun();
                },
                child: Text(
                  "Show my Possition",
                  style:
                      TextStyle(color: mainColor, fontSize: size.width * 0.04),
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.7,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Colors.red),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  b2fun();
                },
                child: Text(
                  "Cancel",
                  style:
                      TextStyle(color: Colors.red, fontSize: size.width * 0.04),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

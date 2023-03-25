import 'package:flutter/material.dart';

class ClinicCard extends StatelessWidget {
  final Color mainColor;

  final String titel;
  final String des;
  final String b1text;
  final String b2text;
  final Function() b1fun;
  final Function() b2fun;
  const ClinicCard({
    super.key,
    required this.mainColor,
    required this.titel,
    required this.des,
    required this.b1text,
    required this.b2text,
    required this.b1fun,
    required this.b2fun,
  });

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
                  b1text,
                  style:
                      TextStyle(color: mainColor, fontSize: size.width * 0.04),
                ),
              ),
            ),
            SizedBox(
              width: size.width * 0.7,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                    side: BorderSide(),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                  b2fun();
                },
                child: Text(
                  b2text,
                  style: TextStyle(
                      color: Colors.black.withOpacity(0.6),
                      fontSize: size.width * 0.04),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

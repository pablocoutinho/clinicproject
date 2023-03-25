import 'package:clinicapp/ui/screens/home/tab2/add_booking/add_booking_screen.dart';
import 'package:clinicapp/ui/screens/home/tab2/card_screen/s1.dart';
import 'package:clinicapp/ui/screens/home/tab2/card_screen/s2.dart';
import 'package:clinicapp/ui/screens/home/tab2/card_screen/s3.dart';
import 'package:clinicapp/ui/screens/home/tab2/card_screen/s4.dart';
import 'package:clinicapp/ui/widgets/clinic_card.dart';
import 'package:flutter/material.dart';

class ClinicScreen extends StatelessWidget {
  const ClinicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
              left: size.width * 0.05,
              right: size.width * 0.05,
              top: size.height * 0.05),
          child: Container(
            child: Column(
              children: [
                ClinicCard(
                  mainColor: Colors.blue,
                  titel: "STI Clinic",
                  des:
                      "Sexual health service offering screening and treatment for STIs",
                  b1text: "Book STI Screen Online",
                  b2text: "What to expect at the STI Clinic",
                  b1fun: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AddBooking()));
                  },
                  b2fun: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const S1Screen()));
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                ClinicCard(
                  mainColor: Colors.red,
                  titel: "HIV Clinic",
                  des: "Treatment for people who have been diagnosed with HIV",
                  b1text: "I’ve been recently diagnosed with HIV",
                  b2text: "See how we treat HIV",
                  b1fun: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const S2Screen()));
                  },
                  b2fun: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const S2Screen()));
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                ClinicCard(
                  mainColor: Colors.green,
                  titel: "Infectious Diseases Clinic",
                  des:
                      "Treatment and investigation for infection-associated conditions",
                  b1text: "What to expect",
                  b2text: "see how we treat IDs",
                  b1fun: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const S3Screen()));
                  },
                  b2fun: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const S4Screen()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

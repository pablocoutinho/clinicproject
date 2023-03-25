import 'package:flutter/material.dart';

class S2Screen extends StatelessWidget {
  const S2Screen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    final titel1Style = TextStyle(
        color: Colors.black.withOpacity(0.8),
        fontSize: size.width * 0.062,
        fontWeight: FontWeight.w600);
    final titel2Style = TextStyle(
        color: Colors.black.withOpacity(0.8),
        fontSize: size.width * 0.054,
        fontWeight: FontWeight.w600);
    final bodyStyle = TextStyle(
        color: Colors.black.withOpacity(0.8),
        fontSize: size.width * 0.044,
        fontWeight: FontWeight.w400);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black.withOpacity(0.7)),
        backgroundColor: Colors.transparent,
        // title: Text(
        //   "What to expect",
        //   style: TextStyle(color: Colors.black.withOpacity(0.7)),
        // ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                "New Persons Clinic ",
                style: titel1Style,
              ),
              const SizedBox(
                height: 14,
              ),
              Text(
                "We recognise that getting a new HIV diagnosis is difficult and therefore we have a dedicated \"new persons clinic\". At this clinic a team of people provide you with all the information and support that you need at this difficult time. At your first visit you will meet a Clinical Nurse Specialist (CNS) in HIV, a Medical Social Worker, a Health Advisor and if necessary a doctor. Being told that you have HIV does not mean that you are suddenly going become ill and you won't necessarily have to start medication straight away. It is important to remember that being diagnosed with HIV doesn't automatically mean that you can't work, have sex, have children or get a mortgage. ",
                style: bodyStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                " You will have the opportunity to ask any questions you wish and if you cannot take everything in, don't worry - you can ask them again another time when you are better able to listen and understand what is happening to you. Sometimes it helps to have your questions written down in advance.At your first visit you will have a number of baseline blood tests and a Chest X-ray.",
                style: bodyStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "We are really lucky to have our own phlebotomy service at the clinic so you don't need to leave the clinic to have your bloods taken. The CNS will ask you lots of questions which together with the baseline investigations will help us to work out the best care plan for you.After your first visit you will be given an appointment to come back to discuss your baseline results and work out the appropriate care plan for you.",
                style: bodyStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

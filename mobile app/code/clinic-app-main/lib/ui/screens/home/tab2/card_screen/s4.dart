import 'package:flutter/material.dart';

class S4Screen extends StatelessWidget {
  const S4Screen({super.key});

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
        backgroundColor: Colors.transparent,
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black.withOpacity(0.7)),
        title: Text(
          "What to expect",
          style: TextStyle(color: Colors.black.withOpacity(0.7)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                "The clinic is staffed by an Infectious Diseases Consultant, 2-3 specialist registrars in Infectious Diseases, a clinical nurse specialist and a number of staff nurses.When you attend the clinic you will register at reception. A nurse will then check you into the clinic and you will join a queue to be reviewed by a doctor.You will subsequently be seen by a doctor in the clinic, this will either be a Consultant in Infectious Diseases or a specialist registrar. Your doctor will take your history with you, examine you, and discuss with you the potential diagnoses and treatments.",
                style: bodyStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "Blood tests are done within the clinic. Further investigations such as X-rays and scans are usually organised as necessary within St. James' Hospital.If you require a follow-up appointment this will be made before you leave the clinic. If it is ok with you a letter will be sent to your referring doctor with an update on your condition.",
                style: bodyStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

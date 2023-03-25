import 'package:flutter/material.dart';

class S1Screen extends StatelessWidget {
  const S1Screen({super.key});

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
        backgroundColor: Colors.transparent,
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
                "EXAMINATION  ",
                style: titel1Style,
              ),
              const SizedBox(
                height: 13,
              ),
              Text(
                " Your full name will be called by a health care provider (HCP). If you prefer a female or male provider please mention at registration. Chaperones are available on request. The GUIDE clinic is a major provider of sexual health education and training for healthcare professionals in Ireland. You may be offered the option of letting another health professional attend your consultation to gain experience. You have the right to decline having a consultation with a student or trainee present.Your health care provider will start the consultation by asking some personal questions about your sexual health risks and general health eg \"When did you last have sex?\", \"Was it vaginal? Anal? Oral?\" Your risk factors for HIV will be assessed. Personal sexual health questions are only asked for the purposes of assessing your health and to guide the provider to take the appropriate tests for you depending on what risks you have been exposed to.A physical examination will then be carried out of your genital area.",
                style: bodyStyle,
              ),
              const SizedBox(
                height: 12,
              ),
              Text(
                "Men ",
                style: titel2Style,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Males need to hold their urine for at least 2 hours before being seen. Peeing before seeing the HCP may flush out any infection meaning the bugs may not be detected.Your skin and testicles are examined for any rashes, lumps, bumps and discharge. A swab may be taken from your penis, anus and/or throat, if required. These tests are not painful.The HCP will tell you if they think you have anything wrong. You will then give a urine sample and have your blood checked for HIV, Hepatitis B and Syphilis as well as any other infections the HCP thinks are required. ",
                style: bodyStyle,
              ),
              const SizedBox(
                height: 13,
              ),
              Text(
                "Women ",
                style: titel2Style,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "The HCP will examine your skin for any rashs, lumps and bumps. They will insert a small instrument called a 'speculum' that lets them see the inside of your vagina, including your cervix, this is not painful . Swabs will be taken and sent for testing. Depending on your history swabs may be taken from your throat and anus.The HCP will tell you if they think you have anything wrong. Your blood will be checked for HIV, Hepatitis B and Syphilis as well as any other infections the HCP thinks are required. ",
                style: bodyStyle,
              ),
              const SizedBox(
                height: 13,
              ),
              Text(
                "Dropbox/ Test of Cure (TOC)  ",
                style: titel2Style,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "You may be offered a repeat test to ensure the infection is cleared.The Nurse will give you samples to take home. The following videos will guide you as to how to take the samples and when to return them to a specified box at the entrance to the clinic.",
                style: bodyStyle,
              ),
              const SizedBox(
                height: 13,
              ),
              Text(
                " RESULTS",
                style: titel1Style,
              ),
              const SizedBox(
                height: 8,
              ),
              Text(
                "Your HCP will let you know whether or not you should wait for provisional results on the day. Not everybody will be asked to wait, only if something was seen on your examination. These initial results are analysed in the lab on site and are back in 20-30mins. Only certain diagnosis can be made on the day eg: Non-Specific Urethritis, Bacterial Vaginosis, Candida, and Gonorrhoea (click on for more info). Most tests eg Chlamydia, HIV, take 2 weeks to process.If a positive result is found on the day you will see a Health Advisor and free treatment will be given. The Health Advisor will also explain about your diagnosis, teach you about safe sex and work out how best to treat any contacts.A complete set of results will be through in 2 weeks. It is the clinic policy to contact patients by phone if any results are positive, please ensure your contact details are correct. If your results are negative you will not be contacted, no news is good news.For most people a once off visit is all that is required. However some patients may require a return appointment for review. Your HCP on the day will advise you if you need to make this ",
                style: bodyStyle,
              ),
              const SizedBox(
                height: 13,
              ),
            ],
          ),
        ),
      ),
    );
  }
}



// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:flutter/src/widgets/placeholder.dart';

// class S1Screen extends StatelessWidget {
//   const S1Screen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     final titel1Style = TextStyle(
//         color: Colors.black.withOpacity(0.8),
//         fontSize: size.width * 0.062,
//         fontWeight: FontWeight.w600);
//     final titel2Style = TextStyle(
//         color: Colors.black.withOpacity(0.8),
//         fontSize: size.width * 0.054,
//         fontWeight: FontWeight.w600);
//     final bodyStyle = TextStyle(
//         color: Colors.black.withOpacity(0.8),
//         fontSize: size.width * 0.044,
//         fontWeight: FontWeight.w400);

//     return Scaffold(
//       appBar: AppBar(
//         iconTheme: IconThemeData(color: Colors.black.withOpacity(0.7)),
//         title: Text(
//           "What to expect",
//           style: TextStyle(color: Colors.black.withOpacity(0.7)),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Padding(
//           padding: const EdgeInsets.all(10.0),
//           child: Column(


//             children: [
//                 Text(" ",style: titel1Style,),
// Text(" ",style: titel1Style,),
// Text(" ",style: titel1Style,),


//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

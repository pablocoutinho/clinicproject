import 'package:flutter/material.dart';

class S3Screen extends StatelessWidget {
  const S3Screen({super.key});

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
          "What we do",
          style: TextStyle(color: Colors.black.withOpacity(0.7)),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Text(
                "The Infectious Diseases (ID) clinic provides investigation and management of a wide range of infections and infection-associated conditions, including but not limited to:",
                style: bodyStyle,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                "\n* Common infectious diseases such as:\n\t\t# Pneumonia\n\t\t# Urinary tract infections\n\t\t# Skin and soft tissue infections\n\t\t# Bone infections\n\t\t# Diabetic foot infections\n\t\t# Meningitis and encephalitis\n*Outpatient antimicrobial therapy (OPAT)\n*Healthcare associated infections such as MRSA, Clostridium Difficile infection, vancomycin resistant enterococci (VRE)\n*Fever of unknown origin\n*Endocarditis\n*Viral hepatitis\n*Tuberculosis and latent tuberculosis infection (LTBI)\n*Lyme disease and tick borne illnesses\n*Infection management in immunocompromised patients\n\t\t# Congential immunodeficiency\n\t\t# HIV infection\n\t\t# Treatment induced immunodeficiency including chemotherapy and immunosuppressive agents\n*Travel Health",
                style: bodyStyle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

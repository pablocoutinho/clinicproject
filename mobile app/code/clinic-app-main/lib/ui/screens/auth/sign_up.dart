import 'dart:io';

import 'package:clinicapp/config/http_handeler/httpClient.dart';
import 'package:clinicapp/models/user_model.dart';
import 'package:clinicapp/services/validator/validate_handeler.dart';
import 'package:clinicapp/ui/screens/auth/sign_in.dart';
import 'package:clinicapp/ui/screens/home/homescreen.dart';
import 'package:clinicapp/ui/styles/app_styles.dart';
import 'package:clinicapp/ui/widgets/already_have_an_account_acheck.dart';
import 'package:clinicapp/ui/widgets/or_divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _email = "";
  String _passWord = "";
  String _cpassWord = "";
  String _name = "";
  String _mobile = "";
  String pno = "";
  String _addr = "";
  String _dob = "";
  String _surname = "";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailcon = TextEditingController();
  final TextEditingController _pwcon = TextEditingController();
  final TextEditingController _cpwcon = TextEditingController();
  final TextEditingController _namecon = TextEditingController();
  final TextEditingController _sornamecon = TextEditingController();

  final TextEditingController _mobilecon = TextEditingController();
  final TextEditingController pnocon = TextEditingController();
  final TextEditingController _addrcon = TextEditingController();
  final TextEditingController _dobcon = TextEditingController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Form(
          key: _formKey,
          child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(gradient: kGradientGreen),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: size.height * 0.03),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Sign Up",
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Hello!! ",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      SizedBox(height: size.height * 0.005),
                    ],
                  ),
                ),
                const SizedBox(height: 1),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(60),
                            topRight: Radius.circular(60))),
                    child: SingleChildScrollView(
                      keyboardDismissBehavior:
                          ScrollViewKeyboardDismissBehavior.onDrag,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 30, right: 30),
                        child: Column(
                          children: [
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color.fromARGB(84, 55, 147, 222),
                                        blurRadius: 20,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors
                                                          .grey.shade200))),
                                          child: TextFormField(
                                            controller: _namecon,
                                            onChanged: (value) {
                                              _name = value;
                                            },
                                            validator: (value) {
                                              return Validater.genaralvalid(
                                                  value!);
                                            },
                                            decoration: const InputDecoration(
                                                hintText: "Name ",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey),
                                                border: InputBorder.none),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              border: Border(
                                                  bottom: BorderSide(
                                                      color: Colors
                                                          .grey.shade200))),
                                          child: TextFormField(
                                            controller: _sornamecon,
                                            onChanged: (value) {
                                              _surname = value;
                                            },
                                            validator: (value) {
                                              return Validater.genaralvalid(
                                                  value!);
                                            },
                                            decoration: const InputDecoration(
                                                hintText: "Surname ",
                                                hintStyle: TextStyle(
                                                    color: Colors.grey),
                                                border: InputBorder.none),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: TextFormField(
                                      keyboardType: TextInputType.emailAddress,
                                      controller: _emailcon,
                                      onChanged: (value) {
                                        _email = value;
                                      },
                                      validator: (value) {
                                        return Validater.vaildemail(value!);
                                      },
                                      decoration: const InputDecoration(
                                          hintText: "Email",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: TextFormField(
                                      keyboardType: TextInputType.phone,
                                      controller: _mobilecon,
                                      onChanged: (value) {
                                        _mobile = value;
                                      },
                                      validator: (value) {
                                        return Validater.vaildmobile(value!);
                                      },
                                      decoration: const InputDecoration(
                                          hintText:
                                              "Mobile No (+344-XXXXXXXXX) ",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: TextFormField(
                                      controller: pnocon,
                                      onChanged: (value) {
                                        pno = value;
                                      },
                                      validator: (value) {
                                        return null;
                                      },
                                      decoration: const InputDecoration(
                                          hintText:
                                              "Patient number (if you already have)",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: TextFormField(
                                      keyboardType: TextInputType.datetime,
                                      controller: _dobcon,
                                      onChanged: (value) {
                                        _dob = value;
                                      },
                                      validator: (value) {
                                        return Validater.genaralvalid(value!);
                                      },
                                      decoration: const InputDecoration(
                                          hintText: "Date of birth(dd/mm/yyyy)",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: TextFormField(
                                      obscureText: true,
                                      controller: _pwcon,
                                      onChanged: (value) {
                                        _passWord = value;
                                      },
                                      validator: (value) {
                                        return Validater.signupPassword(value!);
                                      },
                                      decoration: const InputDecoration(
                                          //suffixIcon: Icon(Icons.visibility),
                                          hintText: "Password ",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            bottom: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: TextFormField(
                                      obscureText: true,
                                      controller: _cpwcon,
                                      onChanged: (value) {
                                        _cpassWord = value;
                                      },
                                      validator: (value) {
                                        if (_cpwcon.text == _pwcon.text) {
                                          return null;
                                        } else {
                                          return "not match with password";
                                        }
                                      },
                                      decoration: const InputDecoration(
                                          //    suffixIcon: Icon(Icons.visibility),
                                          hintText: "Confirm Password",
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () async {
                                if (_formKey.currentState!.validate()) {
                                  print("press");
                                  // _scaffoldKey.currentState!
                                  //     .showBottomSheet((context) => SnackBar(
                                  //           duration:
                                  //               const Duration(seconds: 4),
                                  //           backgroundColor: kPrimaryColordark,
                                  //           content: Row(
                                  //             children: const <Widget>[
                                  //               CircularProgressIndicator(),
                                  //               Text("Registering...")
                                  //             ],
                                  //           ),
                                  //         ));

                                  var userModel = UserModel(
                                      name: _namecon.text,
                                      email: _emailcon.text.trim(),
                                      surName: _sornamecon.text,
                                      dateOfBirth: _dobcon.text,
                                      phone: _mobilecon.text,
                                      patientNo: pnocon.text,
                                      password: _pwcon.text);
                                  final r = await httpClient.signUp(userModel);

                                  if (r == true) {
                                    // ignore: use_build_context_synchronously
                                    Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) {
                                          return const HomeScreen();
                                        },
                                      ),
                                    );
                                    print(r);
                                  } else {
                                    Get.snackbar(
                                      "SignUp failed",
                                      "Please enter the valid details",
                                      icon: const Icon(Icons.error,
                                          color: Colors.white),
                                      snackPosition: SnackPosition.BOTTOM,
                                    );
                                  }
                                } else {
                                  print("Not Complete");
                                }
                              },
                              child: Container(
                                height: 50,
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 50),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: kPrimaryColordark),
                                child: const Center(
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            OrDivider(),
                            AlreadyHaveAnAccountCheck(
                              login: false,
                              press: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return const SignIn();
                                    },
                                  ),
                                );
                              },
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:clinicapp/config/http_handeler/httpClient.dart';
import 'package:clinicapp/models/user_model.dart';
import 'package:clinicapp/services/secure_sorage_service/secure_sorage_service.dart';
import 'package:clinicapp/services/validator/validate_handeler.dart';
import 'package:clinicapp/ui/screens/auth/sign_in.dart';
import 'package:clinicapp/ui/screens/home/homescreen.dart';
import 'package:clinicapp/ui/styles/app_styles.dart';
import 'package:clinicapp/ui/widgets/already_have_an_account_acheck.dart';
import 'package:clinicapp/ui/widgets/or_divider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
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
  setUserData() async {
    var user = await SecureStorageService().getUserData();
    _namecon.text = user!.name;
    _sornamecon.text = user.surName;
    _emailcon.text = user.email;
    _dobcon.text = user.dateOfBirth;
    pnocon.text = user.patientNo ?? "";
    _mobilecon.text = user.phone;
    setState(() {});
  }

  @override
  void initState() {
    setUserData();
    super.initState();
  }

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
                // SizedBox(height: size.height * 0.03),
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: size.height * 0.02),
                      const BackButton(
                        color: Colors.white,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "My Profile",
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(height: size.height * 0.001),
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
                        padding:
                            const EdgeInsets.only(left: 30, right: 30, top: 50),
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
                                            readOnly: true,
                                            controller: _namecon,
                                            onChanged: (value) {
                                              _name = value;
                                            },
                                            validator: (value) {
                                              return Validater.genaralvalid(
                                                  value!);
                                            },
                                            decoration: const InputDecoration(
                                                labelText: "Name ",
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
                                            readOnly: true,
                                            controller: _sornamecon,
                                            onChanged: (value) {
                                              _surname = value;
                                            },
                                            validator: (value) {
                                              return Validater.genaralvalid(
                                                  value!);
                                            },
                                            decoration: const InputDecoration(
                                                labelText: "Surname ",
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
                                      readOnly: true,
                                      keyboardType: TextInputType.emailAddress,
                                      controller: _emailcon,
                                      onChanged: (value) {
                                        _email = value;
                                      },
                                      validator: (value) {
                                        return Validater.vaildemail(value!);
                                      },
                                      decoration: const InputDecoration(
                                          labelText: "Email",
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
                                      readOnly: true,
                                      keyboardType: TextInputType.phone,
                                      controller: _mobilecon,
                                      onChanged: (value) {
                                        _mobile = value;
                                      },
                                      validator: (value) {
                                        return Validater.vaildmobile(value!);
                                      },
                                      decoration: const InputDecoration(
                                          labelText: "Mobile No  ",
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
                                      readOnly: true,
                                      controller: pnocon,
                                      onChanged: (value) {
                                        pno = value;
                                      },
                                      validator: (value) {
                                        return null;
                                      },
                                      decoration: const InputDecoration(
                                          labelText: "Patient number ",
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
                                      readOnly: true,
                                      keyboardType: TextInputType.datetime,
                                      controller: _dobcon,
                                      onChanged: (value) {
                                        _dob = value;
                                      },
                                      validator: (value) {
                                        return Validater.genaralvalid(value!);
                                      },
                                      decoration: const InputDecoration(
                                          labelText:
                                              "Date of birth(dd/mm/yyyy)",
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

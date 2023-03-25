import 'package:clinicapp/config/http_handeler/httpClient.dart';
import 'package:clinicapp/services/secure_sorage_service/secure_sorage_service.dart';
import 'package:clinicapp/ui/screens/auth/sign_in.dart';
import 'package:clinicapp/ui/screens/contact_us/contact_us.dart';
import 'package:clinicapp/ui/screens/my_profile/myprofile.dart';
import 'package:clinicapp/ui/styles/app_styles.dart';
import 'package:clinicapp/ui/widgets/popup_dilog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({
    Key? key,
  }) : super(key: key);

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  @override
  void initState() {
    setUserData();
    super.initState();
  }

  String name = "";

  String email = "";

  setUserData() async {
    var user = await SecureStorageService().getUserData();
    name = "${user!.name} ${user.surName}";
    email = user.email;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      child: Container(
        color: Colors.white,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              decoration: const BoxDecoration(color: kPrimaryColordark),
              accountEmail: Text(email),
              accountName: Text(name),
              currentAccountPictureSize: Size.square(
                size.width * 0.2,
              ),
              currentAccountPicture: Center(
                child: SvgPicture.asset(
                  'assets/icons/logo.svg',
                ),
              ),
            ),
            Card(
              elevation: 0,
              child: ListTile(
                leading: const Icon(
                  Icons.person_outlined,
                  color: kPrimaryColordark,
                ),
                title: const Text('My Profile'),
                onTap: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyProfile()));
                },
              ),
            ),
            Card(
              elevation: 0,
              child: ListTile(
                leading: const Icon(
                  Icons.contact_page,
                  color: kPrimaryColordark,
                ),
                title: const Text('Contact Us'),
                onTap: () async {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const ContactUsScreen()));
                },
              ),
            ),
            Card(
              elevation: 0,
              child: ListTile(
                leading: const Icon(
                  Icons.logout_rounded,
                  color: kPrimaryColordark,
                ),
                title: const Text('Logout'),
                onTap: () {
                  PopupDialog.showPopuplogout(
                      context, "Signout", "Do you want to signout ? ",
                      () async {
                    await httpClient.setSavedToken();
                    await httpClient.signOut();
                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const SignIn()));
                    print("logingout");
                  });
                },
              ),
            ),
            SizedBox(
              height: size.height * 0.2,
            ),
          ],
        ),
      ),
    );
  }
}

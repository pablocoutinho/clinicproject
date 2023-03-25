import 'package:clinicapp/ui/screens/home/tab1/tab1_screen.dart';
import 'package:clinicapp/ui/screens/home/tab2/tab2_screen.dart';
import 'package:clinicapp/ui/screens/home/tab3/tab3_screen.dart';
import 'package:clinicapp/ui/styles/app_styles.dart';
import 'package:clinicapp/ui/widgets/drawer.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:line_icons/line_icons.dart';

class HomeScreen extends StatefulWidget {
  final int index;

  const HomeScreen({Key? key, this.index = 1}) : super(key: key);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  int _selectedIndex = 1;
  @override
  void initState() {
    _selectedIndex = widget.index;
    super.initState();
  }

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.w600);
  DateTime pre_backpress = DateTime.now();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    List<Widget> _widgetOptions = const [
      PrepScreen(),
      ClinicScreen(),
      MyBookingScreen()
    ];
    return WillPopScope(
      onWillPop: () {
        final timegap = DateTime.now().difference(pre_backpress);
        final cantExit = timegap >= const Duration(seconds: 2);
        pre_backpress = DateTime.now();
        if (cantExit) {
          final snack = const SnackBar(
            content: Text('Press Back button again to Exit'),
            duration: Duration(seconds: 2),
          );
          ScaffoldMessenger.of(context).showSnackBar(snack);
          return Future<bool>.value(false);
        } else {
          return Future<bool>.value(true);
        }
      },
      child: Scaffold(
        drawer: const MenuDrawer(),
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "The Guide Clinic",
            style: TextStyle(
                color: Colors.black.withOpacity(0.7),
                fontSize: size.width * 0.05),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              _scaffoldKey.currentState!.openDrawer();
            },
            icon: Icon(
              Icons.menu_rounded,
              color: Colors.black.withOpacity(0.8),
            ),
          ),
        ),
        key: _scaffoldKey,
        // backgroundColor: Colors.white,
        body: Center(
          child: _widgetOptions.elementAt(_selectedIndex),
        ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: kPrimaryColorlight,
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              )
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
              child: GNav(
                rippleColor: kPrimaryColordark,
                hoverColor: Colors.lightBlueAccent,
                gap: 8,
                activeColor: Colors.black,
                iconSize: 24,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                duration: const Duration(milliseconds: 300),
                tabBackgroundColor: Colors.blue.shade800.withOpacity(0.7),
                color: Colors.black,
                tabs: const [
                  GButton(
                    icon: LineIcons.tag,
                    text: 'Prep Queue',
                  ),
                  GButton(
                    icon: LineIcons.home,
                    text: 'Home',
                  ),
                  GButton(
                    icon: LineIcons.bookmark,
                    text: 'My Booking',
                  ),
                ],
                selectedIndex: _selectedIndex,
                onTabChange: (index) {
                  setState(() {
                    _selectedIndex = index;
                  });
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}

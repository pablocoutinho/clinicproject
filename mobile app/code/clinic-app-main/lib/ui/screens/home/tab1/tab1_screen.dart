import 'package:clinicapp/config/constant/constant.dart';
import 'package:clinicapp/config/http_handeler/httpClient.dart';
import 'package:clinicapp/models/prep_model.dart';
import 'package:clinicapp/ui/screens/home/tab1/add_prep/add_prep_screen.dart';
import 'package:clinicapp/ui/screens/home/tab2/my_possition/my_possiton.dart';
import 'package:clinicapp/ui/styles/app_styles.dart';
import 'package:clinicapp/ui/widgets/booking_card.dart';
import 'package:clinicapp/ui/widgets/errorpage.dart';
import 'package:clinicapp/ui/widgets/popup_dilog.dart';
import 'package:clinicapp/ui/widgets/tots.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class PrepScreen extends StatefulWidget {
  const PrepScreen({super.key});

  @override
  State<PrepScreen> createState() => _PrepScreenState();
}

class _PrepScreenState extends State<PrepScreen> {
  @override
  void initState() {
    loadData();
    super.initState();
  }

  late Future<List<PrepModel>> futureData;

  loadData() {
    futureData = httpClient.getPreps();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
          backgroundColor: kPrimaryColordark,
          onPressed: () async {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const AddPrep()));
          },
          label: Text("Create new prep"),
          icon: Icon(Icons.add)),
      body: Container(
        child: FutureBuilder(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<PrepModel> data = snapshot.data as List<PrepModel>;
              print(data);
              if (data.isNotEmpty) {
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    var itemData = data[index];
                    return BookkingCard(
                      titel: "Prep Clinic",
                      des: "",
                      b1fun: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyPosition(
                                    cinicName: "Prep Clinic",
                                    id: itemData.id!)));
                      },
                      b2fun: () {
                        PopupDialog.showPopupWarning(
                            context, "Delete", "Are you sure to delete?",
                            () async {
                          final res =
                              await httpClient.deleteBooking(data[index].id!);
                          if (res) {
                            Customtost.commontost("Successfull", Colors.blue);
                          } else {
                            Customtost.commontost("Error", Colors.red);
                          }
                          //Navigator.pop(context);
                          loadData();
                          setState(() {});
                        });
                      },
                    );
                  },
                );
              } else {
                return Center(
                    child: Lottie.asset("assets/animation/emptybox.json",
                        width: size.width * 0.6));
              }
            } else if (snapshot.hasError) {
              return Errorpage(size: size.width * 0.7);
            }

            return Center(
                child: Lottie.asset("assets/animation/loadingdots.json",
                    width: size.width * 0.2));
          },
        ),
      ),
    );
  }
}

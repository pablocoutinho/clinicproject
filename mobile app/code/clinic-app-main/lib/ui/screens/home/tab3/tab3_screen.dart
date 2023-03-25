import 'package:clinicapp/config/constant/constant.dart';
import 'package:clinicapp/config/http_handeler/httpClient.dart';
import 'package:clinicapp/models/book_model.dart';
import 'package:clinicapp/ui/screens/home/tab2/my_possition/my_possiton.dart';
import 'package:clinicapp/ui/widgets/booking_card.dart';
import 'package:clinicapp/ui/widgets/errorpage.dart';
import 'package:clinicapp/ui/widgets/popup_dilog.dart';
import 'package:clinicapp/ui/widgets/tots.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MyBookingScreen extends StatefulWidget {
  const MyBookingScreen({super.key});

  @override
  State<MyBookingScreen> createState() => _MyBookingScreenState();
}

class _MyBookingScreenState extends State<MyBookingScreen> {
  @override
  void initState() {
    loadData();
    super.initState();
  }

  late Future<List<BookModel>> futureData;

  loadData() {
    futureData = httpClient.getbookings();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        child: FutureBuilder(
          future: futureData,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              List<BookModel> data = snapshot.data as List<BookModel>;
              print(data);
              if (data.isNotEmpty) {
                return ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (context, index) {
                    var itemData = data[index];
                    return BookkingCard(
                      titel: cliicItems[int.parse(itemData.c_id)],
                      des: itemData.date,
                      b1fun: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MyPosition(
                                    cinicName:
                                        cliicItems[int.parse(itemData.c_id)],
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

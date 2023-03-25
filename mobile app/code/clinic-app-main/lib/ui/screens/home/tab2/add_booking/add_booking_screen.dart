import 'package:clinicapp/config/http_handeler/httpClient.dart';
import 'package:clinicapp/models/book_model.dart';
import 'package:clinicapp/ui/screens/home/homescreen.dart';
import 'package:clinicapp/ui/styles/app_styles.dart';
import 'package:clinicapp/ui/widgets/tots.dart';
import 'package:flutter/material.dart';

class AddBooking extends StatefulWidget {
  const AddBooking({Key? key}) : super(key: key);

  @override
  State<AddBooking> createState() => _AddBookingState();
}

class _AddBookingState extends State<AddBooking> {
  String _email = "";
  String _passWord = "";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _uncon = TextEditingController();
  final TextEditingController _pwcon = TextEditingController();
  final TextEditingController _cpwcon = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
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
                SizedBox(height: size.height * 0.02),
                const BackButton(
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Book your clinic",
                        style: TextStyle(color: Colors.white, fontSize: 40),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "The GUIDE Clinic is the largest, free STI, HIV and Infectious Disease service in Ireland.",
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      SizedBox(height: size.height * 0.01),
                      // SizedBox(
                      //   width: size.width,
                      //   child: Lottie.asset('assets/animations/sendpin.json',
                      //       height: size.height * 0.3),
                      // ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
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
                        padding: const EdgeInsets.all(30),
                        child: Column(
                          children: <Widget>[
                            const SizedBox(
                              height: 10,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        color: Color.fromARGB(84, 41, 136, 214),
                                        blurRadius: 20,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding: const EdgeInsets.all(10),
                                    decoration: BoxDecoration(
                                        border: Border(
                                            top: BorderSide(
                                                color: Colors.grey.shade200),
                                            bottom: BorderSide(
                                                color: Colors.grey.shade200))),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        value: dropdownvalue,
                                        icon: const Icon(
                                            Icons.keyboard_arrow_down),
                                        items: items.map((String items) {
                                          return DropdownMenuItem(
                                            value: items,
                                            child: Text(items),
                                          );
                                        }).toList(),
                                        onChanged: (String? newValue) {
                                          setState(() {
                                            dropdownvalue = newValue!;
                                          });
                                        },
                                      ),
                                    ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              top: BorderSide(
                                                  color: Colors.grey.shade200),
                                              bottom: BorderSide(
                                                  color:
                                                      Colors.grey.shade200))),
                                      child: GestureDetector(
                                        onTap: () {
                                          _selectDate(context);
                                        },
                                        child: ListTile(
                                            title: Text(
                                              date,
                                              style: TextStyle(
                                                fontSize: size.width * 0.033,
                                              ),
                                            ),
                                            leading: Icon(
                                              Icons.date_range_outlined,
                                              size: size.width * 0.075,
                                            )),
                                      )),
                                ],
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            GestureDetector(
                              onTap: () async {
                                if (_formKey.currentState!.validate()) {
                                  if (dropdownvalue != 'Select your Clinic' &&
                                      date != "Select your date") {
                                    int ctype = items.indexWhere(
                                        (element) => element == dropdownvalue);

                                    final model = BookModel(
                                        c_id: ctype.toString(), date: date);

                                    final res =
                                        await httpClient.createbooking(model);
                                    if (res) {
                                      Customtost.commontost(
                                          "Sucessfully Added", Colors.blue);
                                      // ignore: use_build_context_synchronously
                                      Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const HomeScreen(
                                                    index: 2,
                                                  )));
                                    } else {
                                      Customtost.commontost(
                                          "Adding Fialed", Colors.red);
                                    }
                                  } else {
                                    Customtost.commontost(
                                        "Please complete details", Colors.red);
                                  }
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
                                    "Book Now",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 50,
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

  String dropdownvalue = 'Select your Clinic';

  var items = [
    'Select your Clinic',
    'STC Clinic',
    'HIV Clinic',
    'Infectious Diseases Clinic',
  ];

  _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
        date = "${selectedDate.day}/${selectedDate.month}/${selectedDate.year}";
        setState(() {});
      });
    }
  }

  String date = "Select your date";

  DateTime selectedDate = DateTime.now();
}

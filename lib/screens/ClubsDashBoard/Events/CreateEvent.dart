import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:venq_assessment/Styles/Colors.dart';
import 'package:venq_assessment/screens/Auth/Register.dart';
import 'package:venq_assessment/widgets/ClubDashBoard/HeaderContent.dart';

class CreateEvent extends StatefulWidget {
  CreateEvent({super.key});

  @override
  State<CreateEvent> createState() => _CreateEventState();
}

class _CreateEventState extends State<CreateEvent> {
  DateTime? selectedDate;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: selectedDate ??
          DateTime
              .now(), // Use selectedDate if available, else use current date
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null && pickedDate != selectedDate) {
      setState(() {
        selectedDate = pickedDate; // Update selectedDate if a date was picked
      });
    }
  }

  String formatDate(DateTime? date) {
    if (date != null) {
      final DateFormat formatter = DateFormat('E d MMM, yyyy');
      return formatter.format(date);
    }
    return 'Select Date';
  }

  final TextEditingController emailController = TextEditingController();

  final TextEditingController firstnameController = TextEditingController();

  final TextEditingController lastnameController = TextEditingController();
  TimeOfDay time =
      TimeOfDay(hour: DateTime.now().hour, minute: DateTime.now().minute);

  @override
  Widget build(BuildContext context) {
    final hours = time.hour.toString().padLeft(2, "0");
    final minute = time.minute.toString().padLeft(2, "0");

    var widthofs = MediaQuery.of(context).size.width;
    var heightofs = MediaQuery.of(context).size.height;
    return SafeArea(
        child: Scaffold(
      backgroundColor: backgroundColorfigma,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          HeaderContent(title: "Create Event"),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: heightofs / 40,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25),
                  child: Column(
                    children: [
                      customtextfield(
                          firstnameController, "Name", Colors.green),
                      customtextfield(
                          lastnameController, "Description", Colors.green),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Container(
                          height: heightofs / 20,
                          width: widthofs / 2,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(34, 34, 34, 0.37),
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 20.0,
                                ),
                                child: Text(
                                    selectedDate != null
                                        ? formatDate(selectedDate)
                                        : "Select Date",
                                    style: GoogleFonts.sairaCondensed(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: IconButton(
                                  onPressed: () {
                                    _selectDate(
                                        context); // Show the date picker on icon press
                                  },
                                  icon: const Icon(
                                    Icons.calendar_today_outlined,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 20),
                        child: Container(
                          height: heightofs / 20,
                          width: widthofs / 2,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(34, 34, 34, 0.37),
                            borderRadius: BorderRadius.circular(15.0),
                            border: Border.all(
                              color: Colors.black,
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                  left: 20.0,
                                ),
                                child: Text("${hours}:${minute}",
                                    style: GoogleFonts.sairaCondensed(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.white,
                                    )),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: IconButton(
                                  onPressed: () async {
                                    TimeOfDay? newtime = await showTimePicker(
                                        context: context, initialTime: time);
                                    if (newtime == null) {
                                      return;
                                    }
                                    setState(() {
                                      time = newtime;
                                    });
                                  },
                                  icon: const Icon(
                                    Icons.alarm,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Padding(
                          padding: const EdgeInsets.only(
                              top: 0.0, left: 50, right: 50, bottom: 20.0),
                          child: Container(
                            height: heightofs / 20,
                            width: double.maxFinite,
                            decoration: const BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromARGB(255, 202, 196, 196),
                                  blurRadius: 10,
                                  spreadRadius: -2,
                                  offset: Offset(-2, -2),
                                ),
                                BoxShadow(
                                  color: Colors.black,
                                  blurRadius: 20,
                                  spreadRadius: -2,
                                  offset: Offset(2, 2),
                                ),
                              ],
                              color: Color(0xFF2D3135),
                              borderRadius: BorderRadius.all(
                                Radius.circular(20.0),
                              ),
                            ),
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 10.0, right: 20.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        "Create",
                                        style: GoogleFonts.bebasNeue(
                                            fontSize: 20, color: golden),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

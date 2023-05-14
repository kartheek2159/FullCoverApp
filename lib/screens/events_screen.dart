import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/BookingScreen/FooterButtons.dart';

class EventsScreen extends StatelessWidget {
  const EventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    double overlapFraction = 0.5;
    return SafeArea(
      child: Scaffold(
        backgroundColor: const Color(0xFF2C2F33),
        body: Column(
          children: [
            Container(
              height: height / 10,
              width: double.maxFinite,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: height / 15,
                    width: width / 7,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF2C2F33),
                    ),
                  ),
                  SizedBox(
                    width: width / 3,
                  ),
                  Container(
                    height: height / 15,
                    width: width / 7,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xFF2C2F33),
                    ),
                  ),
                ],
              ),
            ),
            Align(
              alignment: Alignment(0, -overlapFraction),
              child: FractionalTranslation(
                translation: Offset(0, -overlapFraction),
                child: Container(
                  height: height / 10,
                  width: 3 * width / 6,
                  decoration: const BoxDecoration(
                    color: Color(0xFF2C2F33),
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      height: height / 10,
                      width: width / 3,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(
                          Radius.circular(40),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Center(
              child: Text("EVENTS",
                  style: GoogleFonts.bebasNeue(
                    fontSize: 30,
                    color: Colors.white,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Container(
                height: 4.8 * height / 10,
                width: width,
                decoration: const BoxDecoration(color: Color(0xFF2C2F33)),
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0)),
                        child: Container(
                          height: height / 10,
                          width: width / 2,
                          decoration: const BoxDecoration(
                              color: Color(0xFFD9D9D9),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20.0))),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Container(
                height: 60,
                width: 60,
                decoration: const BoxDecoration(
                  color: Color(0xFF2C2F33),
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color.fromARGB(255, 124, 120, 120),
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
                ),
                child: IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.qr_code_scanner,
                      size: 45,
                      color: Colors.white,
                    )),
              ),
            ),
            FooterButtons(
                width: width,
                colorb: Colors.white,
                textcolor: const Color(0xFF2C2F33)),
          ],
        ),
      ),
    );
  }
}

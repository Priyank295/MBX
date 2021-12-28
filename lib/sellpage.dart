import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:line_icons/line_icons.dart';
import 'package:lottie/lottie.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SellPage extends StatefulWidget {
  const SellPage({Key? key}) : super(key: key);

  @override
  _SellPageState createState() => _SellPageState();
}

class _SellPageState extends State<SellPage> {
  @override
  void initState() {
    super.initState();
    // writeData();
  }

  // Future<void> writeData() async {
  //   CollectionReference<Map<String, dynamic>> _ref = FirebaseFirestore.instance.collection('users');

  // //   _ref.doc('uid').collection('product').add(
  // //     {

  // //     }

  // //   )
  // // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffF1F4FB),
      body: Flex(
        direction: Axis.vertical,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 20, top: 60),
                        child: SvgPicture.asset(
                          'assets/arrow.svg',
                          color: Colors.black,
                          height: 18,
                          width: 18,
                        ),
                      ),
                    ],
                  ),
                  Container(
                    child: Lottie.asset(
                      'assets/image.json',
                      height: 270,
                      width: 270,
                      frameRate: FrameRate(60),
                    ),
                  ),
                  Text(
                    "UPLOAD YOUR IMAGE",
                    style: TextStyle(
                        fontFamily: 'Lato', fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(40),
                      color: Colors.white,
                    ),
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 39),
                                  child: Text(
                                    "Product Name",
                                    style: TextStyle(
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 30),
                                  height: 50,
                                  width: 170,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      // suffixIcon: _isEmail
                                      //     ? SizedBox()
                                      //     : Padding(
                                      //         padding: EdgeInsets.all(12.0),
                                      //         child: SvgPicture.asset("assets/WarningCircle.svg"),
                                      //       ),
                                      prefixIconConstraints:
                                          const BoxConstraints(
                                        minHeight: 24,
                                        minWidth: 24,
                                      ),
                                      hintText: "Enter Product Name",

                                      hintStyle: const TextStyle(
                                        color: Color(0xFFFAEAEAE),
                                        fontFamily: "Lato",
                                        fontSize: 12,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                          color: Color(0xFFFD2D2D2),
                                        ),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFF6342E8),
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.only(left: 10),
                                    ),
                                    style: const TextStyle(
                                      fontFamily: "Lato",
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 20,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 39),
                                  child: Text(
                                    "Price",
                                    style: TextStyle(
                                        fontFamily: "Lato",
                                        fontWeight: FontWeight.bold,
                                        fontSize: 14),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 30),
                                  height: 50,
                                  width: 131,
                                  child: TextFormField(
                                    decoration: InputDecoration(
                                      // suffixIcon: _isEmail
                                      //     ? SizedBox()
                                      //     : Padding(
                                      //         padding: EdgeInsets.all(12.0),
                                      //         child: SvgPicture.asset("assets/WarningCircle.svg"),
                                      //       ),
                                      prefixIconConstraints:
                                          const BoxConstraints(
                                        minHeight: 14,
                                        minWidth: 14,
                                      ),
                                      prefixIcon: Padding(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: SvgPicture.asset(
                                          "assets/rupee.svg",
                                          height: 8,
                                          width: 8,
                                        ),
                                      ),
                                      hintText: "Price",
                                      hintStyle: const TextStyle(
                                        color: Color(0xFFFAEAEAE),
                                        fontFamily: "Lato",
                                        fontSize: 12,
                                      ),
                                      border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(8),
                                        borderSide: const BorderSide(
                                          color: Color(0xFFFD2D2D2),
                                        ),
                                      ),
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0xFFF6342E8),
                                        ),
                                      ),
                                      contentPadding: EdgeInsets.only(left: 10),
                                    ),
                                    style: const TextStyle(
                                      fontFamily: "Lato",
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 39),
                          child: Text(
                            "Phone Model",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Lato",
                                fontSize: 14),
                          ),
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Container(
                            height: 50,
                            width: double.infinity,
                            child: TextFormField(
                              // validator: (val) {
                              //   if (!isEmail(val!) && !isPhone(val)) {
                              //     setState(() {
                              //       _isEmail = false;
                              //     });
                              //   }
                              // },

                              decoration: InputDecoration(
                                // prefixIcon: Padding(
                                //   padding: const EdgeInsets.all(10.0),
                                //   child: SvgPicture.asset(
                                //     "assets/mail.svg",
                                //   ),
                                // ),
                                // suffixIcon: _isEmail
                                //     ? SizedBox()
                                //     : Padding(
                                //         padding: EdgeInsets.all(12.0),
                                //         child: SvgPicture.asset("assets/WarningCircle.svg"),
                                //       ),
                                prefixIconConstraints: const BoxConstraints(
                                  minHeight: 24,
                                  minWidth: 24,
                                ),
                                hintText: "Enter Phone Model Name",
                                hintStyle: const TextStyle(
                                  color: Color(0xFFFAEAEAE),
                                  fontFamily: "Lato",
                                  fontSize: 12,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFFD2D2D2),
                                  ),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFF6342E8),
                                  ),
                                ),
                                contentPadding: EdgeInsets.only(left: 10),
                              ),
                              style: const TextStyle(
                                fontFamily: "Lato",
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 39),
                          child: Text(
                            "Description",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: "Lato",
                                fontSize: 14),
                          ),
                        ),
                        SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Container(
                            height: 49,
                            width: double.infinity,
                            child: TextFormField(
                              keyboardType: TextInputType.multiline,
                              maxLines: null,
                              // validator: (val) {
                              //   if (!isEmail(val!) && !isPhone(val)) {
                              //     setState(() {
                              //       _isEmail = false;
                              //     });
                              //   }
                              // },

                              decoration: InputDecoration(
                                // prefixIcon: Padding(
                                //   padding: const EdgeInsets.all(10.0),
                                //   child: SvgPicture.asset(
                                //     "assets/mail.svg",
                                //   ),
                                // ),
                                // suffixIcon: _isEmail
                                //     ? SizedBox()
                                //     : Padding(
                                //         padding: EdgeInsets.all(12.0),
                                //         child: SvgPicture.asset("assets/WarningCircle.svg"),
                                //       ),
                                prefixIconConstraints: const BoxConstraints(
                                  minHeight: 24,
                                  minWidth: 24,
                                ),
                                hintText: "Write Description about your phone",

                                hintStyle: const TextStyle(
                                  color: Color(0xFFFAEAEAE),
                                  fontFamily: "Lato",
                                  fontSize: 12,
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                  borderSide: const BorderSide(
                                    color: Color(0xFFFD2D2D2),
                                  ),
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0xFFF6342E8),
                                  ),
                                ),
                                contentPadding: EdgeInsets.only(left: 10),
                              ),
                              style: const TextStyle(
                                fontFamily: "Lato",
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Center(
                            child: Container(
                              height: 54,
                              width: 340,
                              decoration: BoxDecoration(
                                color: Color(0xFFF6342E8),
                                borderRadius: BorderRadius.circular(56),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SvgPicture.asset(
                                      'assets/cart.svg',
                                      color: Colors.white,
                                      height: 24,
                                      width: 24,
                                    ),
                                    SizedBox(width: 5),
                                    Text(
                                      "PROCEED TO SELL",
                                      style: TextStyle(
                                        fontFamily: "Lato",
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

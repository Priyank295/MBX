import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get_connect.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:mbx/firstpage.dart';
import 'package:mbx/loginpage.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 60),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "MBX.",
                  style: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Lato',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: SvgPicture.asset(
                        'assets/bell.svg',
                        height: 24,
                        width: 24,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: SvgPicture.asset(
                        'assets/cart.svg',
                        height: 24,
                        width: 24,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: SvgPicture.asset(
                        'assets/Favroite.svg',
                        height: 24,
                        width: 24,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: SvgPicture.asset(
                        'assets/Search.svg',
                        height: 24,
                        width: 24,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      child: SvgPicture.asset(
                        'assets/Menu.svg',
                        height: 17,
                        width: 15,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          // Center(
          //   child: RaisedButton(
          //     onPressed: () {
          //       signOut();
          //     },
          //     child: Text("Sign out"),
          //   ),
          // )
          // Center(
          //     child: Lottie.asset("assets/loading.json",
          //         frameRate: FrameRate(60), height: 250, width: 250)),
        ],
      ),
    );
  }

  void signOut() async {
    await _auth.signOut().then((value) => Navigator.push(
        context, MaterialPageRoute(builder: (context) => FirstPage())));
    _auth.currentUser;
  }
}

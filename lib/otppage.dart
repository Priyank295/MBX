import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mbx/homepage.dart';
import 'package:otp_text_field/otp_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:otp_text_field/style.dart';
import './register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:pinput/pin_put/pin_put.dart';
import 'package:pinput/pin_put/pin_put_state.dart';

class OtpPage2 extends StatefulWidget {
  String phone;
  String verifyCode;

  OtpPage2({
    required this.phone,
    required this.verifyCode,
  });

  @override
  _OtpPage2State createState() => _OtpPage2State();
}

class _OtpPage2State extends State<OtpPage2> {
  FirebaseAuth auth = FirebaseAuth.instance;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final TextEditingController otptext = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 60, left: 20),
                    child: SvgPicture.asset(
                      "assets/arrow.svg",
                      height: 18,
                      width: 18,
                      color: Colors.black,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 120,
              ),
              Column(
                children: [
                  Container(
                    child: SvgPicture.asset(
                      "assets/msg.svg",
                      height: 170,
                      width: 189,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: Container(
                  child: const Text(
                    "OTP Verification",
                    style: TextStyle(
                      fontFamily: "Lato",
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Center(
                child: Container(
                  child: Text(
                    "Enter the OTP sent to +91-${widget.phone}",
                    style: const TextStyle(
                      fontFamily: "Lato",
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 40),
                child: Center(
                  child: PinPut(
                    fieldsCount: 6,
                    textStyle: const TextStyle(
                      fontSize: 17,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.bold,
                    ),
                    eachFieldWidth: 40.0,
                    eachFieldHeight: 55.0,
                    controller: otptext,
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Container(
                height: 54,
                width: 300,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(56),
                  color: Color(0xFFF6342E8),
                ),
                child: FlatButton(
                    onPressed: () async {
                      signInWithPhoneNumber();
                    },
                    child: const Text(
                      "VERIFY",
                      style: TextStyle(
                        fontFamily: "Lato",
                        fontSize: 12,
                        color: Colors.white,
                      ),
                    )),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Center(
                    child: Text(
                      "Don’t receive the OTP?",
                      style: TextStyle(fontFamily: "Lato", fontSize: 18),
                    ),
                  ),
                  SizedBox(
                    width: 8,
                  ),
                  Text(
                    "RESEND OTP",
                    style: TextStyle(
                      fontFamily: "Lato",
                      fontSize: 18,
                      color: Color(0xFFF6342E8),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  void verificationCompleted(PhoneAuthCredential credential) async {
    await FirebaseAuth.instance.signInWithCredential(credential);
    displayMessage(
        "Phone number is automatically verified and user signed in : ${auth.currentUser!.uid}");
    Navigator.of(context).push(MaterialPageRoute(builder: (c) => HomePage()));
  }

  void displayMessage(String message) {
    _scaffoldKey.currentState!.showSnackBar(SnackBar(content: Text(message)));
  }

  void signInWithPhoneNumber() async {
    try {
      final AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: widget.verifyCode,
        smsCode: otptext.text,
      );
      final User? user =
          (await auth.signInWithCredential(credential).then((value) async {
        if (value.user != null) {
          Navigator.pushAndRemoveUntil(context,
              MaterialPageRoute(builder: (c) => HomePage()), (route) => false);
        }
      }));
      displayMessage("Successfully signed in UID : ${user!.uid}");

      Navigator.of(context).push(MaterialPageRoute(builder: (c) => HomePage()));
    } catch (e) {
      displayMessage("Failed to sign in :" + e.toString());
    }
  }
}

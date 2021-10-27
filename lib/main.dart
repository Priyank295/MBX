import 'package:flutter/material.dart';
import 'package:mbx/firstpage.dart';
import 'package:mbx/homepage.dart';
import 'package:mbx/loginpage.dart';
import './otppage.dart';
import 'package:mbx/register.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import './otppage.dart';
import './register.dart';
import './user.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home: OtpPage2(phone: ""),
      routes: {
        '/': (context) => FirstPage(),
        '/login': (context) => LoginPage(),
        '/register': (context) => RegisterPage(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:mbx/fill_profile.dart';
import 'package:mbx/firstpage.dart';
import 'package:mbx/home.dart';
import 'package:mbx/main_widget.dart';
import 'package:mbx/navbar.dart';
import 'package:mbx/loginpage.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  var email = sharedPreferences.getString('email');
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: email == null ? FirstPage() : NavBar(),
    routes: {
      "/login": (context) => LoginPage(),
      '/register': (context) => RegisterPage(),
    },
  ));
}

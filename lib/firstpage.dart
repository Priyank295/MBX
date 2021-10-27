import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class FirstPage extends StatelessWidget {
  const FirstPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SvgPicture.asset("assets/vector1.svg"),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/login');
                },
                child: Container(
                  height: 54,
                  width: 222,
                  decoration: BoxDecoration(
                      border: Border.all(width: 3),
                      borderRadius: BorderRadius.circular(56)),
                  child: const Center(
                    child: Text(
                      "LOG IN",
                      style: TextStyle(
                        fontFamily: "Lato",
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset("assets/Line.svg"),
                  Container(
                    margin: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                    ),
                    child: const Text(
                      "OR",
                      style: TextStyle(
                        fontFamily: "Lato",
                        fontWeight: FontWeight.w800,
                      ),
                    ),
                  ),
                  SvgPicture.asset("assets/Line.svg"),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, '/register');
                },
                child: Container(
                  height: 54,
                  width: 222,
                  decoration: BoxDecoration(
                      color: const Color(0xFFF6342E8),
                      borderRadius: BorderRadius.circular(56)),
                  child: const Center(
                    child: Text(
                      "REGISTER",
                      style: TextStyle(
                        fontFamily: "Lato",
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

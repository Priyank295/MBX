import 'dart:convert';
import 'package:lottie/lottie.dart';
import 'package:snapshot/snapshot.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mbx/navbar.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';

import 'product.dart';

class MainWidget extends StatefulWidget {
  const MainWidget({Key? key}) : super(key: key);

  @override
  _MainWidgetState createState() => _MainWidgetState();
}

// List<Product> product = [];

final FirebaseFirestore _fstore = FirebaseFirestore.instance;

class _MainWidgetState extends State<MainWidget> {
  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   readData();
  // }

  // // Future<void> readData() async {
  // //   final doc = _fstore
  // //       .collection("users")
  // //       .doc("5N0XbO0lGTKIPV0K5B7l")
  // //       .collection("product");

  // //   QuerySnapshot querySnapshot = await doc.get();

  // //   final allData = querySnapshot.docs.map((doc) => doc.data()).toList();
  // //   Product(Description: )
  // // }

  // Future<List<Product>> fetchProduct() async {
  //   final product = <Product>[];
  //   final doc = await FirebaseFirestore.instance
  //       .collection("users")
  //       .doc("5N0XbO0lGTKIPV0K5B7l")
  //       .collection("product")
  //       .doc("KYYlVMBFPyAvd2uDoz0k")
  //       .get();
  //   final productTmp = doc.data().forEach((pro) {
  //     product.add(Product.fromMap(pro));
  //   });
  // }

  // Future<void> readData() async {
  //   FirebaseFirestore _firestore = FirebaseFirestore.instance.collection('users').doc('uid').collection('product').;

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection("users")
              .doc("5N0XbO0lGTKIPV0K5B7l")
              .collection("product")
              .snapshots(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: Lottie.asset("assets/loading.json",
                    frameRate: FrameRate(30)),
              );
            }
            return GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemCount: snapshot.data!.docs.length,
              itemBuilder: (context, index) {
                return Column(children: [
                  Container(
                    height: 208,
                    width: 170,
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      color: Color(0xfffF1F4FB),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image.network(
                          snapshot.data!.docs[index].get('Photo'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    snapshot.data!.docs[index].get('Name'),
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                  Text(
                    "\u{20B9}" +
                        snapshot.data!.docs[index].get("Price").toString(),
                    style: TextStyle(fontSize: 20, color: Colors.black),
                  ),
                ]);
              },
            );
          }),
      // body: GridView.builder(
      //   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
      //     crossAxisCount: 2,
      //     crossAxisSpacing: 10,
      //     mainAxisSpacing: 10,
      //   ),
      //   itemCount: product.length,
      //   itemBuilder: (context, index) {
      //     return Container(
      //         height: 208,
      //         width: 170,
      //         child: Column(
      //           children: [
      //             Card(
      //               color: Color(0xfffF1F4FB),
      //               shape: RoundedRectangleBorder(
      //                   borderRadius: BorderRadius.circular(30)),
      //               child: Image.network(product[index].ImgUrl),
      //             ),
      //           ],
      //         ));
      //   },
      // ),
    );
  }
}

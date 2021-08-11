import 'package:boxtox/style/color.dart';
import 'package:boxtox/view/search.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Scaffold(
      extendBody: true,
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          Container(
            width: width,
            height: height / 1.5,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  primer,
                  primer,
                  primer,
                  Color(0xffc88241),
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Stack(
              children: [
                Positioned(
                  top: 15,
                  left: 15,
                  child: SafeArea(
                    child: Image.asset(
                      'assets/logo.png',
                      width: 70,
                    ),
                  ),
                ),
                SafeArea(
                  child: Center(
                    child: Column(
                      children: [
                        SizedBox(
                          height: height / 9,
                        ),
                        Text(
                          "Tracking your shipment",
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          "Please enter your tracking number.",
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.white.withOpacity(0.9),
                          ),
                        ),
                        Search(
                          depan: true,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: 0,
                  right: 0,
                  child: SvgPicture.asset(
                    'assets/home.svg',
                    width: width / 1.6,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

class COntainerStyle extends StatefulWidget {
  const COntainerStyle({super.key});

  @override
  _COntainerStyleState createState() => _COntainerStyleState();
}

class _COntainerStyleState extends State<COntainerStyle> {
  @override
  Widget build(BuildContext context) {
    const boxWidth = 300.0;
    const boxHeight = 200.0;
    return Scaffold(
      body: Column(
        children: [
          Container(
            width: boxWidth,
            height: boxHeight,

            ///* second color
            color: Colors.blue.shade300,
            child: Stack(
              clipBehavior: Clip.hardEdge,
              children: [
                Positioned(
                  left: -boxWidth * 0.5,
                  child: Transform.rotate(
                    angle: .9,
                    child: Container(
                      ///* 2nd color of border
                      color: Colors.red.shade800,
                      height: boxHeight * 1.2,
                      width: boxWidth * 1.5,
                    ),
                  ),
                ),
                //main view
              ],
            ),
          ),
        ],
      ),
    );
  }
}

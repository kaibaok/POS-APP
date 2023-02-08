// ignore_for_file: prefer_const_constructors, sort_child_properties_last
import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:pos/views/layouts/user_layout_style_2.dart';

class testWidget extends StatefulWidget {
  const testWidget({super.key});

  @override
  State<testWidget> createState() => _testWidgetState();
}

class _testWidgetState extends State<testWidget> {
  bool isButtonPress = false;

  @override
  Widget build(BuildContext context) {
    return UserLayoutStyle2(
      title: "Test",
      childWidget: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                isButtonPress = !isButtonPress;
              });
            },
            child: AnimatedContainer(
              duration: Duration(microseconds: 500),
              width: 160,
              height: 160,
              child: Icon(
                Icons.language,
                color: Colors.white,
                size: 60,
              ),
              decoration: BoxDecoration(
                  color: Colors.orange,
                  borderRadius: BorderRadius.all(
                    Radius.circular(20),
                  ),
                  boxShadow: isButtonPress
                      ? []
                      : [
                          BoxShadow(
                            color: Colors.orange.shade900,
                            offset: Offset(6, 6),
                            blurRadius: 15,
                            spreadRadius: 1,
                          ),
                          BoxShadow(
                            color: Colors.white,
                            offset: Offset(-6, -6),
                            blurRadius: 15,
                            spreadRadius: 1,
                          ),
                        ]),
            ),
          ),
          Transform(
            alignment: Alignment.center,
            transform: Matrix4.rotationZ(
              math.pi / 4,
            ),
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  width: 3,
                  color: Colors.amber,
                ),
              ),
              child: InkWell(
                splashColor: Colors.blueAccent,
                onTap: () {},
                child: Center(
                  child: Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.rotationZ(
                      -math.pi / 4,
                    ),
                    child: Text(
                      "Click",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

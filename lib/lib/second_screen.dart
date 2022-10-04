// ignore_for_file: unnecessary_import, implementation_imports
// ignore_for_file: prefer_const_constructors
import 'dart:ui';
import 'package:bmiapp/first_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class second_screen extends StatefulWidget {
  final String bmiC;
  final String cond;
  final String adv;
  final Image ftp;
  const second_screen(
      {super.key,
      required this.bmiC,
      required this.cond,
      required this.adv,
      required this.ftp});

  @override
  State<second_screen> createState() => _second_screenState();
}

class _second_screenState extends State<second_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            SizedBox(height: 100),
            Container(
              height: 420,
              width: double.infinity,
              color: Colors.blueAccent,
              child: Column(
                children: [
                  SizedBox(height: 20),
                  Text(
                    "Your BMI is",
                    style: TextStyle(fontSize: 25),
                  ),
                  SizedBox(height: 20),
                  Text(
                    widget.bmiC,
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 45,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 15),
                  Text(widget.cond, style: TextStyle(fontSize: 20)),
                  SizedBox(height: 15),
                  Text(widget.adv, style: TextStyle(fontSize: 20)),
                  SizedBox(height: 10.6),
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: widget.ftp,
                  )
                ],
              ),
            ),
            SizedBox(height: 200),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                height: 47,
                width: 400,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Color.fromARGB(255, 21, 139, 235)),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.restart_alt, color: Colors.white, size: 18),
                      SizedBox(width: 7),
                      Text("Start over",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

// 로고_web
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:garida/Page/2.PageTwo.dart';
import 'dart:async';

class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  _FirstPage createState() => _FirstPage();
}

class _FirstPage extends State<PageOne> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
      Get.offAll(() => const PageTwo());
    });
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('images/Logo_null.png',
                  width: 300, height: 300, fit: BoxFit.fill),
            ],
          ),
        ),
      ),
    );
  }
}

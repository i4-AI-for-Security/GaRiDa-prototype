// 얼굴 인식
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:garida/Page/6.PageSix.dart';

class PageFive extends StatelessWidget {
  final String imagePath;

  const PageFive({super.key, required this.imagePath});

  @override
  Widget build(BuildContext context) {
    // 5초 후에 두 번째 페이지로 이동
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => PageSix(siximagePath: imagePath),
        ),
      );
    });

    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(100.0),
        child: SizedBox(
          height: 100,
          child: CupertinoNavigationBar(
            leading: Text(''),
            trailing: Text(''),
            border: Border(bottom: BorderSide.none),
            middle: Text('얼굴 가리기'),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 70.0),
            Image.file(
              File(imagePath),
              width: 400.0,
              height: 400.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 85.0),
            const SizedBox(
              width: 90.0,
              height: 90.0,
              child: CircularProgressIndicator(
                strokeWidth: 8.0,
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xFFD4F4F7)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

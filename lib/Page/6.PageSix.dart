// 얼굴 인식 확인
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:garida/Page/7.PageSeven.dart';

class PageSix extends StatelessWidget {
  final String siximagePath;

  const PageSix({super.key, required this.siximagePath});

  // 함수를 호출하여 다음 페이지로 이동하는 메서드
  void navigateToNextPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            PageSeven(sevenimagePath: siximagePath), // 이미지 경로를 전달
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
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
            GestureDetector(
              onTap: () {
                // 이미지를 터치했을 때 알림창을 띄우기
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      content: const Text('얼굴이 맞나요?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                            navigateToNextPage(context); // 알림창 닫기
                          },
                          child: const Text('예', selectionColor: Colors.blue),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('아니오', selectionColor: Colors.blue),
                        ),
                      ],
                    );
                  },
                );
              },
              child: Image.asset(
                'images/face_detection.png',
                width: 400.0,
                height: 400.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 85.0),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.transparent, // 배경색을 투명으로 설정
        elevation: 0,
        child: SizedBox(
          height: 70.0, // elevation을 0으로 설정하여 border 없애기
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    // 이전 페이지로 이동하는 코드를 여기에 추가
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(CupertinoIcons.arrow_left), // 화살표 아이콘 추가
                  color: Colors.black, // 아이콘 색상 설정
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

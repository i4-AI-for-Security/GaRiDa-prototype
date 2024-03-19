// 추가 기능 선택
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:garida/Page/12.PageTwelve.dart';
import 'package:garida/Page/4.PageFour.dart';

class PageNine extends StatefulWidget {
  final String nineimagePath;

  const PageNine({Key? key, required this.nineimagePath}) : super(key: key);

  void navigateToNextPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            PageTwelve(twelveimagePath: nineimagePath), // 이미지 경로를 전달
      ),
    );
  }

  @override
  _PageNineState createState() => _PageNineState();
}

class _PageNineState extends State<PageNine> {
  bool faceCovered = false; // Track the state of "얼굴 가리기" button
  bool backgroundBlurred = false; // Track the state of "배경 흐리게" button
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    // 2초 뒤에 isLoading 상태를 false로 변경하여 나머지 요소가 표시됩니다.
    Future.delayed(const Duration(seconds: 3), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: SizedBox(
          height: 100,
          child: CupertinoNavigationBar(
            border: const Border(bottom: BorderSide.none),
            middle: const Text(
              "Image Editor",
              style: TextStyle(
                color: CupertinoColors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: const Text(''),
            trailing: CupertinoButton(
              padding: const EdgeInsets.all(0.0),
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFD7D0F7), // 보라색 배경색
                  borderRadius: BorderRadius.circular(17.0), // 둥글게 만들기
                ),
                padding: const EdgeInsets.symmetric(
                    horizontal: 16.0, vertical: 4.0), // 버튼 내 텍스트의 여백 설정
                child: const Text(
                  '적용', // 원하는 텍스트를 여기에 입력
                  style: TextStyle(
                    color: Color(0xFF545F71), // 텍스트 색상을 흰색으로 설정
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center, // 텍스트를 가운데 정렬
                ),
              ),
              onPressed: () {
                setState(() {
                  backgroundBlurred = !backgroundBlurred; // Toggle the state
                  faceCovered = false; // Reset the state of the other button
                });

                // 여기에서 다음 페이지로 이동하도록 코드 추가
                widget.navigateToNextPage(context);
              },
            ),
          ),
        ),
      ),
      body: isLoading
          ? const Center(
              child: SizedBox(
                width: 100, // Set the desired width
                height: 100, // Set the desired height
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xffD4F4F7)),
                  strokeWidth: 8,
                ),
              ),
            )
          : Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start, // 사진을 위로 정렬
                crossAxisAlignment: CrossAxisAlignment.center, // 가로 중앙 정렬
                children: [
                  const SizedBox(height: 70.0), // 사진 위에 20.0 픽셀의 여백 추가
                  Image.asset(
                    'images/face_mask.png',
                    width: 400.0,
                    height: 400.0,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(height: 40.0), // 사진과 버튼 사이의 간격 (20.0 픽셀로 조절)

                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 5.0), // 좌우 여백 설정
                    child: Row(
                      mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly, // 버튼을 가로로 균등하게 배치
                      children: [
                        // 첫 번째 버튼
                        CupertinoButton(
                          onPressed: () {
                            // 얼굴 가리기 버튼이 처음부터 0xffFFE4E4 색깔로 뜨도록 아무 동작도 추가하지 않습니다.
                          },
                          child: Column(
                            children: [
                              Container(
                                width: 80.0,
                                height: 80.0,
                                decoration: BoxDecoration(
                                  color: const Color(
                                      0xffFFE4E4), // 항상 0xffFFE4E4 색상으로 설정
                                  border: null,
                                  borderRadius: BorderRadius.circular(40.0),
                                ),
                                child: const Center(
                                  child: Icon(
                                    CupertinoIcons.eye_slash,
                                    color: CupertinoColors.black,
                                    size: 40.0,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 4.0),
                              const Text(
                                "얼굴 가리기",
                                style: TextStyle(
                                  fontSize: 13.0,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),

// 두 번째 버튼
                      ],
                    ),
                  ),
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
              mainAxisAlignment:
                  MainAxisAlignment.spaceBetween, // 왼쪽과 오른쪽 화살표를 양쪽 끝에 배치
              children: [
                IconButton(
                  onPressed: () {
                    // 왼쪽 화살표 아이콘을 눌렀을 때 실행할 코드 추가
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

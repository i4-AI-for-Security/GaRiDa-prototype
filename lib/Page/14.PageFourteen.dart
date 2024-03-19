// 옷 입히기
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import '3.PageThree.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:garida/Page/12.PageTwelve.dart';
import 'package:garida/Page/4.PageFour.dart';
import 'package:flutter/foundation.dart';

class PageFourteen extends StatefulWidget {
  final String fourteenimagePath;

  const PageFourteen({Key? key, required this.fourteenimagePath})
      : super(key: key);

  void navigateToNextPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            PageTwelve(twelveimagePath: fourteenimagePath), // 이미지 경로를 전달
      ),
    );
  }

  @override
  _PageFourteenState createState() => _PageFourteenState();
}

class _PageFourteenState extends State<PageFourteen> {
  bool faceCovered = false; // Track the state of "얼굴 가리기" button
  bool backgroundBlurred = false; // Track the state of "배경 흐리게" button
  String currentImagePath = 'images/face_mask_background_blurr.png';
  bool isChangingImage = false;

  void changeImageWithDelay(String imagePath) {
    setState(() {
      isChangingImage = true;
    });

    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        setState(() {
          currentImagePath = imagePath;
          isChangingImage = false;
        });
      }
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
              "옷 입히기",
              style: TextStyle(
                color: CupertinoColors.black,
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            leading: const Text(''),
            trailing: CupertinoButton(
              padding: const EdgeInsets.all(0.0),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      // 이미지 경로를 전달하면서 NextPage 위젯을 생성
                      return PageThree(imagePath: widget.fourteenimagePath);
                    },
                  ),
                );
              },
              child: Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFFFFCAD), // 보라색 배경색
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
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // 사진을 위로 정렬
          crossAxisAlignment: CrossAxisAlignment.center, // 가로 중앙 정렬
          children: [
            const SizedBox(height: 70.0), // 사진 위에 20.0 픽셀의 여백 추가
            Image.asset(
              currentImagePath,
              width: 400.0,
              height: 400.0,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 40.0), // 사진과 버튼 사이의 간격 (20.0 픽셀로 조절)

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5.0), // 좌우 여백 설정
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceEvenly, // 버튼을 가로로 균등하게 배치
                children: [
                  CupertinoButton(
                    onPressed: () {
                      setState(() {
                        faceCovered = !faceCovered; // Toggle the state
                        backgroundBlurred =
                            false; // Reset the state of the other button
                        if (faceCovered) {
                          changeImageWithDelay(
                              'images/face_cloth_mask_background_blurr.png'); // 옷 입히기 이모티콘 눌렀을 때의 이미지 경로
                        } else {
                          changeImageWithDelay(
                              'images/face_cloth_mask_background_blurr.png'); // 다른 이미지로 변경
                        }
                      });
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 80.0,
                          height: 80.0,
                          decoration: BoxDecoration(
                            color: faceCovered
                                ? const Color(
                                    0xffFFE4E4) // If "얼굴 가리기" is pressed, use white background
                                : CupertinoColors
                                    .white, // Otherwise, use the original color
                            border:
                                !faceCovered // If "얼굴 가리기" is not pressed, add a border
                                    ? Border.all(
                                        color: Colors.grey,
                                        width: 1.0,
                                      )
                                    : null,
                            borderRadius: BorderRadius.circular(40.0),
                          ),
                          child: const Center(
                            child: Icon(
                              CupertinoIcons.tag,
                              color: CupertinoColors.black,
                              size: 35.0,
                            ),
                          ),
                        ),
                        const SizedBox(height: 4.0), // 텍스트와 버튼 사이에 간격 추가
                        const Text(
                          "옷 입히기", // 두 번째 버튼 위에 텍스트 추가
                          style: TextStyle(
                              fontSize: 13.0, color: Colors.black // 텍스트 크기 조절
                              ),
                        ),
                      ],
                    ),
                  ),
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

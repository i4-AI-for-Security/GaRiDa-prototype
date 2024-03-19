// 사진 편집 첫 화면
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:garida/Page/12.PageTwelve.dart';
import 'package:garida/Page/14.PageFourteen.dart';
import 'package:garida/Page/6.PageSix.dart';
import 'package:dio/dio.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';

class PageFour extends StatelessWidget {
  final String imagePath;

  const PageFour({Key? key, required this.imagePath}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: SizedBox(
          height: 100,
          child: CupertinoNavigationBar(
            border: const Border(bottom: BorderSide.none),
            middle: const Text('Image Editor'),
            leading: CupertinoButton(
                padding: const EdgeInsets.all(0.0),
                child: const Icon(Icons.arrow_back_ios_new,
                    color: CupertinoColors.black),
                onPressed: () {
                  Navigator.of(context).pop();
                }),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // 사진을 위로 정렬
          crossAxisAlignment: CrossAxisAlignment.center, // 가로 중앙 정렬
          children: [
            const SizedBox(height: 70.0), // 사진 위에 20.0 픽셀의 여백 추가
            Image.file(
              File(imagePath),
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
                  // 첫 번째 버튼
                  CupertinoButton(
                    onPressed: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            // 이미지 경로를 전달하면서 NextPage 위젯을 생성
                            return PageSix(siximagePath: imagePath);
                          },
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 80.0, // 버튼의 크기를 조절합니다
                          height: 80.0,
                          decoration: BoxDecoration(
                            color: CupertinoColors.white, // 배경색 설정
                            border: Border.all(
                              color: Colors.grey, // 테두리 색상 설정
                              width: 1.0, // 테두리 두께 설정
                            ),
                            borderRadius:
                                BorderRadius.circular(40.0), // 동그라미 모양으로 설정
                          ),
                          child: const Center(
                            child: Icon(
                              CupertinoIcons.eye_slash, // Cupertino 스타일 아이콘
                              color: CupertinoColors.black, // 아이콘 색상 설정
                              size: 40.0, // 아이콘 크기 조절
                            ),
                          ),
                        ),
                        const SizedBox(height: 4.0), // 텍스트와 버튼 사이에 간격 추가
                        const Text(
                          "얼굴 가리기", // 첫 번째 버튼 위에 텍스트 추가
                          style: TextStyle(
                              fontSize: 13.0, color: Colors.black // 텍스트 크기 조절
                              ),
                        ),
                      ],
                    ),
                  ),

                  // 두 번째 버튼
                  CupertinoButton(
                    onPressed: () {
                      // 이동하려는 페이지로 이동하기 위해 Navigator를 사용
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            // 이미지 경로를 전달하면서 NextPage 위젯을 생성
                            return PageTwelve(twelveimagePath: imagePath);
                          },
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 80.0, // 버튼의 크기를 조절합니다
                          height: 80.0,
                          decoration: BoxDecoration(
                            color: CupertinoColors.white, // 배경색 설정
                            border: Border.all(
                              color: Colors.grey, // 테두리 색상 설정
                              width: 1.0, // 테두리 두께 설정
                            ),
                            borderRadius:
                                BorderRadius.circular(40.0), // 동그라미 모양으로 설정
                          ),
                          child: const Center(
                            child: Icon(
                              CupertinoIcons.smoke, // Cupertino 스타일 아이콘
                              color: CupertinoColors.black, // 아이콘 색상 설정
                              size: 40.0, // 아이콘 크기 조절
                            ),
                          ),
                        ),
                        const SizedBox(height: 4.0), // 텍스트와 버튼 사이에 간격 추가
                        const Text(
                          "배경 흐리게", // 두 번째 버튼 위에 텍스트 추가
                          style: TextStyle(
                              fontSize: 13.0, color: Colors.black // 텍스트 크기 조절
                              ),
                        ),
                      ],
                    ),
                  ),

                  // 세 번째 버튼
                  CupertinoButton(
                    onPressed: () {
                      // 이동하려는 페이지로 이동하기 위해 Navigator를 사용
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            // 이미지 경로를 전달하면서 NextPage 위젯을 생성
                            return PageFourteen(fourteenimagePath: imagePath);
                          },
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Container(
                          width: 80.0, // 버튼의 크기를 조절합니다
                          height: 80.0,
                          decoration: BoxDecoration(
                            color: CupertinoColors.white, // 배경색 설정
                            border: Border.all(
                              color: Colors.grey, // 테두리 색상 설정
                              width: 1.0, // 테두리 두께 설정
                            ),
                            borderRadius:
                                BorderRadius.circular(40.0), // 동그라미 모양으로 설정
                          ),
                          child: const Center(
                            child: Icon(
                              CupertinoIcons.tag, // Cupertino 스타일 아이콘
                              color: CupertinoColors.black, // 아이콘 색상 설정
                              size: 35.0, // 아이콘 크기 조절
                            ),
                          ),
                        ),
                        const SizedBox(height: 4.0), // 텍스트와 버튼 사이에 간격 추가
                        const Text(
                          "옷 입히기", // 세 번째 버튼 위에 텍스트 추가
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

            // Add your image editing widgets and logic here
          ],
        ),
      ),
    );
  }
}

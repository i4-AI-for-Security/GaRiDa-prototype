// 얼굴 가리는 방법 선택
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:garida/Page/8.PageEight.dart';
import 'package:garida/Page/10.PageTen.dart';

class PageSeven extends StatelessWidget {
  final String sevenimagePath; // 이미지 경로 추가

  const PageSeven({super.key, required this.sevenimagePath});

  void navigateToNextPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            PageEight(eightimagePath: sevenimagePath), // 이미지 경로를 전달
      ),
    );
  }

  void navigateToEmoticonPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            PageTen(tenimagePath: sevenimagePath), // 이미지 경로를 전달
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
          mainAxisAlignment: MainAxisAlignment.start, // 사진을 위로 정렬
          crossAxisAlignment: CrossAxisAlignment.center, // 가로 중앙 정렬
          children: [
            const SizedBox(height: 70.0), // 사진 위에 20.0 픽셀의 여백 추가
            Image.file(
              File(sevenimagePath),
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
                            return PageEight(eightimagePath: sevenimagePath);
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
                              CupertinoIcons.smiley, // Cupertino 스타일 아이콘
                              color: CupertinoColors.black, // 아이콘 색상 설정
                              size: 40.0, // 아이콘 크기 조절
                            ),
                          ),
                        ),
                        const SizedBox(height: 4.0), // 텍스트와 버튼 사이에 간격 추가
                        const Text(
                          "이모티콘", // 첫 번째 버튼 위에 텍스트 추가
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
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) {
                            // 이미지 경로를 전달하면서 NextPage 위젯을 생성
                            return PageTen(tenimagePath: sevenimagePath);
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
                              CupertinoIcons.drop, // Cupertino 스타일 아이콘
                              color: CupertinoColors.black, // 아이콘 색상 설정
                              size: 40.0, // 아이콘 크기 조절
                            ),
                          ),
                        ),
                        const SizedBox(height: 4.0), // 텍스트와 버튼 사이에 간격 추가
                        const Text(
                          "얼굴 흐리게", // 두 번째 버튼 위에 텍스트 추가
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

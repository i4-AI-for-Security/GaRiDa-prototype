// 배경 블러 조절
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:garida/Page/14.PageFourteen.dart';

class PageTwelve extends StatefulWidget {
  final String twelveimagePath;

  const PageTwelve({Key? key, required this.twelveimagePath}) : super(key: key);

  @override
  _PageTwelveState createState() => _PageTwelveState();
}

class _PageTwelveState extends State<PageTwelve> {
  double sliderValue = 30.0; // 슬라이더의 값

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
              "주변 배경 흐리게",
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
                  color: const Color(0xFFD4F4F7), // 보라색 배경색
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
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      // 이미지 경로를 전달하면서 NextPage 위젯을 생성
                      return PageFourteen(
                          fourteenimagePath: widget.twelveimagePath);
                    },
                  ),
                );
              },
            ),
          ),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 70.0),
          Image.asset(
            'images/face_mask_background_blurr.png',
            width: 400.0,
            height: 400.0,
            fit: BoxFit.cover,
          ),
          const SizedBox(height: 10.0),
          // 슬라이더 추가
          SliderTheme(
            data: SliderTheme.of(context).copyWith(
              trackHeight: 3.0, // 슬라이더의 높이
              activeTrackColor: Colors.black, // 활성화된 부분의 색상
              thumbColor: Colors.black, // 슬라이더 핸들의 색상
              inactiveTrackColor: const Color(0xffE3E5E5),
            ),
            child: Slider(
              value: sliderValue, // 슬라이더의 초기 값
              min: 0, // 최소값 설정
              max: 100, // 최대값 설정
              onChanged: (value) {
                setState(() {
                  sliderValue = value; // 슬라이더 값 변경
                });
              },
              // 원하는 슬라이더 설정을 여기에 추가
            ),
          ),
          const SizedBox(height: 0.0), // 슬라이더와 버튼 사이 여백
          // 슬라이더 값 표시 // 슬라이더 값 표시와 버튼 사이 여백
          // 둥근 원 모양의 버튼 추가
          CupertinoButton(
            onPressed: () {},
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
                    borderRadius: BorderRadius.circular(40.0), // 동그라미 모양으로 설정
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
                    fontSize: 13.0,
                    color: Colors.black, // 텍스트 크기 조절
                  ),
                ),
              ],
            ),
          ),
        ],
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

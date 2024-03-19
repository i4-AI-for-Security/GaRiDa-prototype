// 이모티콘 키워드 선택
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:io';
import 'package:get/get.dart';
import 'package:garida/Page/9.PageNine.dart';

class PageEight extends StatefulWidget {
  final String eightimagePath;

  const PageEight({Key? key, required this.eightimagePath}) : super(key: key);

  void navigateToNextPage(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            PageNine(nineimagePath: eightimagePath), // 이미지 경로를 전달
      ),
    );
  }

  @override
  _PageEightState createState() => _PageEightState();
}

class _PageEightState extends State<PageEight> {
  Map<String, String> selectedValues = {
    'Mood': '',
    'Age': '',
    'Style': '',
    'Gender': '',
  };

  // Define a function to handle button taps and update the selected value.
  void updateSelectedValue(String category, String value) {
    setState(() {
      if (selectedValues[category] == value) {
        selectedValues[category] = ''; // 버튼이 이미 눌린 상태라면 해제
      } else {
        selectedValues[category] = value; // 아니면 선택
      }
    });
    printSelectedValues();
  }

  void printSelectedValues() {
    print("Selected Values:");
    selectedValues.forEach((category, value) {
      if (value.isNotEmpty) {
        print("$category: $value");
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
              "이모티콘으로 가리기",
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
                widget.navigateToNextPage(context);
              },
            ),
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬
          children: [
            const SizedBox(height: 21.0),
            const Center(
              // 이 부분에 Center 위젯 추가
              child: Text(
                '나타내고 싶은 키워드를 선택해주세요!',
                style: TextStyle(
                  fontFamily: 'NanumSquareNeo',
                  fontSize: 13.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 29.0),
            Center(
              // 이미지를 중앙으로 정렬
              child: Image.file(
                File(widget.eightimagePath),
                width: 400.0,
                height: 400.0,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 1.0),
            buildCategoryRow("기분은", ["기쁨", "신남", "설렘", "억울"], 'Mood'),
            buildCategoryRow("나이는", ["아기", "아동", "청소년", "청년", "중년"], 'Age'),
            buildCategoryRow("컨셉은", ["디즈니", "픽사", "지브리"], 'Style'),
            buildCategoryRow("성별은", ["여성", "남성"], 'Gender'),
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

  Widget buildCategoryRow(
      String category, List<String> options, String categoryKey) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal, // 수평 스크롤
      child: Align(
        alignment: Alignment.centerLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            for (int i = 0; i < options.length; i++)
              Row(
                children: [
                  if (i == 0)
                    Padding(
                      padding: const EdgeInsets.only(left: 15.0), // 왼쪽 여백 추가
                      child: Text('$category?   '),
                    ),
                  if (i > 0) // 첫 번째 버튼 이후에만 간격 추가
                    const SizedBox(width: 8.0), // 원하는 간격 설정
                  ElevatedButton(
                    onPressed: () {
                      updateSelectedValue(categoryKey, options[i]);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: getButtonColor(i),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12.0, vertical: 5.0),
                      minimumSize: const Size(20.0, 10.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      elevation: isSelected(categoryKey, options[i]) ? 3 : 0,
                    ),
                    child: Text(
                      options[i],
                      style: const TextStyle(
                        fontSize: 15.0,
                        color: Colors.black, // 텍스트 색상을 검정색으로 설정
                      ),
                    ),
                  )
                ],
              ),
          ],
        ),
      ),
    );
  }

  bool isSelected(String categoryKey, String option) {
    return selectedValues[categoryKey] == option;
  }

  Color getTextColor(int index) {
    List<Color> textColors = [
      Colors.red,
      Colors.green,
      Colors.blue,
      Colors.yellow
    ];
    if (index < textColors.length) {
      return textColors[index];
    }
    // 나머지 버튼에 대한 텍스트 색상을 설정합니다.
    return textColors[index % textColors.length];
  }

  Color getButtonColor(int index) {
    List<Color> colors = [
      const Color(0xffECFCE5),
      const Color(0xffFFE5E5),
      const Color(0xffFFEFD7),
      const Color(0xffC9F0FF),
      const Color(0xffEBE5FC),
    ]; // 원하는 색상 추가
    if (index < colors.length) {
      return colors[index];
    }
    return Colors.grey; // 기본 색상
  }
}

void main() {
  runApp(const MaterialApp(
    home: PageEight(eightimagePath: 'your_image_path_here'),
  ));
}

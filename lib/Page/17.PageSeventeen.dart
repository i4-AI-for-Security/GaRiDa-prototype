// 완료 화면
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:share_plus/share_plus.dart';

class PageSeventeen extends StatefulWidget {
  @override
  _PageSeventeen createState() => _PageSeventeen();
  const PageSeventeen({super.key});
}

class _PageSeventeen extends State<PageSeventeen> {
  String loadedTitle = '';
  String loadedDescription = '';

  void _showSharePopup() {
    // 내용을 공유할 텍스트 메시지 또는 링크를 입력합니다.
    String shareMessage = 'i4';

    // 이미지 파일을 공유하려면 이미지 파일의 경로를 텍스트 메시지에 추가합니다.
    shareMessage += '\nAI for Security';

    // 이미지와 메시지를 공유합니다.
    Share.share(shareMessage, subject: '제목');
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
              middle: const Text(''),
              leading: const Text(''),
              trailing: Row(
                children: [
                  Expanded(child: Container()),
                  CupertinoButton(
                    padding: const EdgeInsets.all(0.0),
                    child: const Icon(CupertinoIcons.share_up,
                        color: CupertinoColors.black),
                    onPressed: () {
                      _showSharePopup(); // Add your onPressed logic here
                    },
                  ),
                  CupertinoButton(
                    padding: const EdgeInsets.all(0.0),
                    child: const Icon(Icons.perm_identity_outlined,
                        color: CupertinoColors.black),
                    onPressed: () {
                      // Add your onPressed logic here
                    },
                  ),
                ],
              )),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment:
              MainAxisAlignment.start, // Align children at the top
          children: [
            const SizedBox(
              height: 150,
            ),
            SizedBox(
              width: 200, // 조절할 이미지의 가로 너비
              height: 150, // 조절할 이미지의 세로 높이
              child: Image.asset('images/check-circle.png'),
            ),
            const SizedBox(height: 0), // 이미지와 텍스트 사이 여백 조절
            const Text(
              '저장 완료!',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 30), // 텍스트와 버튼 사이 여백 조절
            CupertinoButton(
              onPressed: () {
                // 이어서 편집 버튼을 눌렀을 때 이전 페이지로 돌아가는 로직
                Navigator.pop(context);
              },
              padding: const EdgeInsets.symmetric(horizontal: 16),
              borderRadius: BorderRadius.circular(8),
              color: Colors.transparent,
              pressedOpacity: 0.5,
              child: Container(
                width: 150,
                height: 45,
                decoration: BoxDecoration(
                  border:
                      Border.all(color: Colors.black, width: 1.5), // 테두리 스타일
                  borderRadius: BorderRadius.circular(8), // 테두리 둥글기 설정
                ),
                child: const Center(
                  child: Text(
                    '이어서 편집',
                    style: TextStyle(
                      color: CupertinoColors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

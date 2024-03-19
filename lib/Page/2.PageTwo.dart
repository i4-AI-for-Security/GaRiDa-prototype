// 메인
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:image_picker/image_picker.dart';
import 'package:garida/Page/4.PageFour.dart';
import 'package:path_provider/path_provider.dart';
import 'dart:io';

class PageTwo extends StatefulWidget {
  const PageTwo({super.key});

  @override
  State<StatefulWidget> createState() => _PageTwoState();
}

class ListItem {
  final String text;
  final String imagePath;
  final Color backgroundColor;

  ListItem(this.text, this.imagePath, this.backgroundColor);
}

class _PageTwoState extends State<PageTwo> {
  final ImagePicker _picker = ImagePicker();
  final List<ListItem> items = [
    ListItem(
      '우리집 귀염둥이, \n오늘은 공원 나들이 나갔어요~! \n너무 신난 우리 000이 오래도록 건강만 하길...',
      'images/listimage1.png',
      const Color(0xffFBF7F6),
    ),
    ListItem(
      '여유로웠던 제주도 여행 \n고딩 친구들과 즐거웠던 파워 수다',
      'images/listimage2.png',
      const Color(0xffFBE8F2),
    ),
    ListItem(
      '온천 여행으로 하코네에 갔다. \n편안한 야외 노천탕 너무 좋아!! \n나중에 또 와야지',
      'images/listimage3.png',
      const Color(0xffD4EFF8),
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: SizedBox(
            height: 100,
            child: CupertinoNavigationBar(
              border: const Border(bottom: BorderSide.none),
              middle: const Text('My Repository'),
              leading: CupertinoButton(
                padding: const EdgeInsets.all(0.0),
                child: const Icon(Icons.settings_outlined,
                    color: CupertinoColors.black),
                onPressed: () {
                  // Add your onPressed logic here
                },
              ),
              trailing: CupertinoButton(
                padding: const EdgeInsets.all(0.0),
                child: const Icon(Icons.perm_identity_outlined,
                    color: CupertinoColors.black),
                onPressed: () {
                  // Add your onPressed logic here
                },
              ),
            ),
          ),
        ),
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoTextField(
                  placeholder: 'Search',
                  prefix: const Padding(
                    padding: EdgeInsets.all(5.0), //search바 높이 조절
                    child: Icon(
                      CupertinoIcons.search,
                      color: CupertinoColors.inactiveGray,
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0), //search바 각진거 조절
                    color: CupertinoColors.lightBackgroundGray,
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0,
                      vertical: 8.0), //horizontal은 search글씨, vertical은 창 높이
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                  child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final item = items[index];
                  return Container(
                    margin: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0), // 리스트 아이템들 간격 조절
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: item.backgroundColor,
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.grey, // 그림자 색상
                          offset: Offset(0, 2), // 그림자의 위치 (가로, 세로)
                          blurRadius: 4.0, // 그림자의 흐릿함 정도
                          spreadRadius: 0.0, // 그림자 퍼짐 정도
                        ),
                      ],
                    ),
                    child: ListTile(
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 6.0, horizontal: 16.0),
                      leading: Image.asset(
                        item.imagePath,
                        width: 50,
                        height: 50,
                      ),
                      title: Text(
                        item.text,
                        style: const TextStyle(
                            fontSize: 11,
                            fontFamily: 'NanumSquareNeo',
                            fontWeight: FontWeight.bold),
                      ),
                      trailing: SizedBox(
                        width: 30,
                        child: IconButton(
                          icon: const Icon(
                            CupertinoIcons.delete,
                            size: 20,
                          ),
                          onPressed: () {
                            setState(() {
                              items.removeAt(index);
                            });
                          },
                        ),
                      ),
                    ),
                  );
                },
              )),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: const Color(0xFFF1D5FC),
          foregroundColor: Colors.black,
          onPressed: () async {
            final picker = ImagePicker();
            final image = await picker.pickImage(source: ImageSource.gallery);

            if (image != null) {
              final appDirectory = await getApplicationDocumentsDirectory();
              final newImagePath = '${appDirectory.path}/selected_image.jpg';
              final File newImageFile = File(newImagePath);
              await newImageFile.writeAsBytes(await image.readAsBytes());

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => PageFour(imagePath: newImagePath),
                ),
              );
            }
          },
          shape: const CircleBorder(),
          child: const Icon(Icons.add),
        ));
  }
}

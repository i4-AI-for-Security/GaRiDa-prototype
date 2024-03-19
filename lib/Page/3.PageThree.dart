// 사진 편집 및 글 작성
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:garida/Page/15.PageFifthteen.dart';
import 'package:garida/Page/17.PageSeventeen.dart';
import 'package:get/get.dart';
import 'package:garida/Page/4.PageFour.dart';
import 'package:garida/Page/2.PageTwo.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:garida/Page/14.PageFourteen.dart';
import 'dart:developer' as developer;

class PageThree extends StatefulWidget {
  final String imagePath;

  const PageThree({super.key, required this.imagePath});

  @override
  _PageThree createState() => _PageThree();
}

class _PageThree extends State<PageThree> {
  String title = '제목'; // 초기 텍스트
  String description = ''; // 추가: 사용자의 입력을 저장할 변수
  bool isImageDeleted = false;

  // Function to delete the selected image
  void deleteImage() {
    // Delete the image file
    File(widget.imagePath).deleteSync();

    // setState를 호출하지 않아서 isImageDeleted를 변경하지 않음
    setState(() {
      isImageDeleted = true;
    });
  }

  void saveDataAndNavigate() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('title', title);
    prefs.setString('description', description);

    // Navigate to another Dart page
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) =>
            PageFifthteen(fifthteenimagePath: widget.imagePath),
      ),
    );
  }

  void openInGallery() async {
    final picker = ImagePicker();
    final image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      final appDirectory = await getApplicationDocumentsDirectory();
      final newImagePath = '${appDirectory.path}/selected_image.jpg';
      final File newImageFile = File(newImagePath);
      await newImageFile.writeAsBytes(await image.readAsBytes());

      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => PageThree(imagePath: newImagePath),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    print("Image Path: ${widget.imagePath}");

    return Scaffold(
        extendBody: true,
        resizeToAvoidBottomInset: false,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(100.0),
          child: SizedBox(
            height: 100,
            child: CupertinoNavigationBar(
              border: const Border(bottom: BorderSide.none),
              middle: Text(
                title,
                style: const TextStyle(
                  color: CupertinoColors.black,
                  fontSize: 18.0,
                ),
              ),
              leading: CupertinoButton(
                padding: const EdgeInsets.all(0.0),
                child: const Icon(Icons.arrow_back_ios_new,
                    color: CupertinoColors.black),
                onPressed: () {
                  // 이동하려는 페이지로 이동하기 위해 Navigator를 사용
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (context) {
                        // 이동하려는 페이지의 위젯을 반환
                        return const PageTwo(); // YourDestinationPage는 이동하려는 페이지의 위젯입니다.
                      },
                    ),
                  );
                },
              ),
              trailing: CupertinoButton(
                padding: const EdgeInsets.all(0.0),
                child: const Icon(Icons.settings_outlined,
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
            children: [
              if (!isImageDeleted)
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, top: 16.0),
                  child: Row(
                    children: [
                      Image.asset(
                        'images/face_cloth_mask.png',
                        width: 200.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),

                      const SizedBox(
                          width:
                              16.0), // Add spacing between the image and buttons
                      Column(
                        children: [
                          SizedBox(
                            width: 100.0, // Adjust the width as needed
                            height: 40.0, // Adjust the height as needed
                            child: CupertinoButton(
                              padding: const EdgeInsets.all(0.0),
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    CupertinoIcons
                                        .pencil, // Add your desired icon for "이미지 편집"
                                    size: 16.0,
                                    color: Colors
                                        .black, // Adjust the icon size as needed
                                  ),
                                  SizedBox(
                                      width:
                                          4.0), // Add spacing between icon and text
                                  Text(
                                    '편집',
                                    style: TextStyle(
                                        fontSize: 14.0,
                                        color: Colors
                                            .black), // Adjust the font size
                                  ),
                                ],
                              ),
                              onPressed: () {
                                developer.log("현재 제목: $title");
                                developer.log("현재 문구: $description");

                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => PageFour(
                                      imagePath: widget.imagePath,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            width: 100.0, // Adjust the width as needed
                            height: 40.0, // Adjust the height as needed
                            child: CupertinoButton(
                              padding: const EdgeInsets.all(0.0),
                              onPressed: deleteImage,
                              child: const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    CupertinoIcons
                                        .delete, // Add your desired icon for "이미지 삭제"
                                    size:
                                        16.0, // Adjust the icon size as needed
                                    color: Colors
                                        .black, // Adjust the icon color as needed
                                  ),
                                  SizedBox(
                                      width:
                                          4.0), // Add spacing between icon and text
                                  Text(
                                    '삭제',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.0, // Adjust the font size
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              if (isImageDeleted) // Only show these buttons if isImageDeleted is true
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    top: 16.0,
                  ), // Adjust the padding values as needed
                  child: GestureDetector(
                    onTap: openInGallery, // 갤러리 열기 함수 호출
                    child: Container(
                      width: 200.0,
                      height: 200.0,
                      color: Colors.grey[350], // Gray out the image area
                      child: const Center(
                        child: Icon(
                          Icons.photo,
                          size: 48.0,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: CupertinoTextField(
                  decoration: BoxDecoration(
                    border: Border.all(width: 0, color: Colors.transparent),
                  ),
                  placeholder: '제목',
                  onChanged: (text) {
                    setState(() {
                      title = text;
                      // 사용자 입력을 title 변수에 저장하고 업데이트
                    });
                  },
                  style: const TextStyle(
                    color: CupertinoColors.black,
                    fontSize: 20.0,
                  ),
                ),
              ),
              // 추가: 사용자가 글을 계속 쓸 수 있는 텍스트 상자
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: SingleChildScrollView(
                  child: CupertinoTextField(
                    decoration: BoxDecoration(
                      border: Border.all(width: 0, color: Colors.transparent),
                    ),
                    placeholder: '문구를 입력하세요',
                    onChanged: (text) {
                      setState(() {
                        description = text;
                      });
                    },
                    style: const TextStyle(
                      color: CupertinoColors.black,
                      fontSize: 16.0,
                    ),
                    maxLines: null, // 여러 줄 입력 가능하도록 설정
                    keyboardType: TextInputType.multiline,
                  ),
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomAppBar(
          color: Colors
              .transparent, // Change this line to match the background color
          elevation: 0,
          shape: const CircularNotchedRectangle(),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Spacer(),
                CupertinoButton(
                  padding: const EdgeInsets.all(0.0),
                  child: const Icon(
                    CupertinoIcons.tray_arrow_down,
                    size: 32.0,
                    color: CupertinoColors.black,
                  ),
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const PageSeventeen(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:orm_practice/23_12_21/youtube_clone_screen.dart';
import '23_12_20/practice_1.dart';
import '23_12_20/practice_2.dart';
import '23_12_20/practice_3.dart';
import 'list_mapper_screen.dart';

void main() {
  runApp(const MyApp());
}

final Map<String, Widget> widgetList = {
  '[23/12/20] 생일선물카드': const MainListPage(
    title: '[23/12/20] 생일선물카드',
    widgetMapper: {
      '1. 생일선물카드 Ver1': BirthdayCardScreenVer1(),
      '2. 생일선물카드 Ver2': BirthdayCardScreenVer2(),
      '3. 생일선물카드 Ver3': BirthdayCardScreenVer3(),
    },
  ),
  '[23/12/21] 클론 UI - Youtube': YoutubeCloneScreen(),
};

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MainListPage(
        title: '메인화면',
        widgetMapper: widgetList,
      ),
    );
  }
}

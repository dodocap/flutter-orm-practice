import 'package:flutter/material.dart';
import 'package:orm_practice/23_12_20/practice_1.dart';
import 'package:orm_practice/23_12_20/practice_2.dart';
import 'package:orm_practice/23_12_20/practice_3.dart';
import 'package:orm_practice/23_12_21/youtube_clone_screen.dart';
import 'package:orm_practice/23_12_22/startbucks_clone_screen.dart';
import 'package:orm_practice/23_12_26/my_animated_container.dart';
import 'package:orm_practice/23_12_26/my_animated_opacity.dart';
import 'package:orm_practice/23_12_26/my_drawer.dart';
import 'package:orm_practice/23_12_26/my_snack_bar.dart';
import 'package:orm_practice/list_mapper_screen.dart';

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
  '[23/12/22] 클론 UI - Starbucks': StarbucksCloneScreen(),
  '[23/12/26] Flutter Cookbook' : const MainListPage(
      title: 'Flutter Cookbook',
      widgetMapper: {
        '1. AnimatedContainer' : MyAnimatedContainer(),
        '2. AnimatedOpacity' : MyAnimatedOpacity(),
        '3. Drawer' : MyDrawer(),
        '4. SnackBar' : MySnackBar(),
      },
  ),
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

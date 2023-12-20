import 'package:flutter/material.dart';

class BirthdayCardScreenVer1 extends StatelessWidget {
  const BirthdayCardScreenVer1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('생일선물 카드 Ver1'),
        ),
        body: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Happy\nBirthday\nSam!',
              style: TextStyle(fontSize: 65.0),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'From Emma',
                  style: TextStyle(fontSize: 25.0),
                ),
                Padding(padding: EdgeInsets.only(right: 16.0)),
              ],
            )
          ],
        ));
  }
}

import 'package:flutter/material.dart';

class BirthdayCardScreenVer2 extends StatelessWidget {
  const BirthdayCardScreenVer2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('생일선물 카드 Ver2'),
        ),
        body: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              'https://img.freepik.com/free-psd/birthday-vertical-blank-banner_23-2150453075.jpg?w=1060&t=st=1703076987~exp=1703077587~hmac=d08062b4cc72162f6a0cc631ca3a9c4de5ae2339e4332c5a38fdc7e07d8a1ae9',
              fit: BoxFit.cover,
            ),
            const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Happy\nBirthday\nSam!',
                  style: TextStyle(fontSize: 65.0),
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'From Emma',
                      style: TextStyle(fontSize: 25.0),
                    ),
                    Padding(padding: EdgeInsets.only(right: 16.0)),
                  ],
                )
              ],
            ),
          ],
        ));
  }
}

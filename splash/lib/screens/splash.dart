import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool lightMode =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    return Scaffold(
      backgroundColor:
      lightMode ? const Color(0xffe1f5fe) : const Color(0xff042a49),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
              'secondary splash',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40.0,
              ),

          ),
          Center(
              child: lightMode
                  ? Image.asset('assets/ocean-sea.gif')
                  : Image.asset('assets/ocean-sea.gif')),
        ],
      ),
    );
  }
}
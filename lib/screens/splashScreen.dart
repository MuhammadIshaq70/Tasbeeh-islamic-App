import 'dart:async';

import 'package:flutter/material.dart';
import 'package:tasbeeh_islamic_app/screens/home.dart';

class SplashScreen extends StatefulWidget {
  SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => Drood_e_Pak())));
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Center(
            child: Container(
              height: 180,
              width: 150,
              decoration: BoxDecoration(color: Colors.transparent),
              child: const Image(
                image: AssetImage('assets/images/tasbeh.png'),
                height: 140,
                width: 100,
              ),
            ),
          ),
          const Text(
            'Tasbeeh Islamic App',
            style: TextStyle(
                fontSize: 20, color: Colors.green, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          const SizedBox(
            height: 20,
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 26),
            child: Text('Powered By Elabd Technologies'),
          )
        ],
      ),
    );
  }
}

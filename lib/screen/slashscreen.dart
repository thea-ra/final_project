import 'package:final_project/screen/main_screen.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SlashSrceen extends StatefulWidget {
  const SlashSrceen({super.key});
  @override
  State<SlashSrceen> createState() => _SlashSrceenState();
}

class _SlashSrceenState extends State<SlashSrceen> {
  onNavigate() {
    Future.delayed(const Duration(seconds: 2), () async {
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => const MainScreen()));
    });
  }

  @override
  void initState() {
    onNavigate();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 170, left: 20, right: 20),
            child: Center(
              child: Lottie.asset('asset/lottie/travel.json'),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 25),
            child: Text(
              'Visit Me!',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: Colors.black),
            ),
          )
        ],
      ),
    );
  }
}

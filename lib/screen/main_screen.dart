import 'package:final_project/controller/home_screen_controller.dart';
import 'package:final_project/screen/account_screen.dart';
import 'package:final_project/screen/expore_screen.dart';
import 'package:final_project/screen/homescreen.dart';
import 'package:final_project/screen/more_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final con = Get.put(HomeController());
    return Scaffold(
      body: Obx(
        () => con.navindex.value == 0
            ? const HomeScreen()
            : con.navindex.value == 1
                ? const ExploreScreen()
                : con.navindex.value == 2
                    ? const AccountScreen()
                    : const MoreScreen(),
      ),
    );
  }
}

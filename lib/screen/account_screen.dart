import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/home_screen_controller.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final con = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: const Color(0xff0C3B0F),
        title: const Text('Account Screen'),
      ),
      body: const Center(child: Text('Account Screen')),
         bottomNavigationBar: BottomNavigationBar(
            onTap: (index) {
              con.navindex.value = index;
            },
            currentIndex: con.navindex.value,
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Explore'),
              BottomNavigationBarItem(
              icon: Icon(Icons.search), label: 'Search'),
              BottomNavigationBarItem(
                  icon: Icon(Icons.more_horiz), label: 'More'),
            ],
            ),
            
    );
  }
}

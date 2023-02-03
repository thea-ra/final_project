import 'package:final_project/controller/home_screen_controller.dart';
import 'package:final_project/screen/detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final con = Get.put(HomeController());
    return Scaffold(
      backgroundColor: const Color(0xffe6e6ff),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: const Color(0xff0C3B0F),
        centerTitle: true,
        title: const Text(
          'Visit Me',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
              color: Color(0xffFFFFFF)),
        ),
      ),
      body: Obx((() => con.isLoading.value
          ? const Center(child: CircularProgressIndicator())
          : NestedScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              headerSliverBuilder: (context, innerBoxIsScrolled) {
                return [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    expandedHeight: 148,
                    stretch: true,
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    onStretchTrigger: () async {
                      debugPrint('stretch');
                    },
                    flexibleSpace: FlexibleSpaceBar(
                      stretchModes: const [StretchMode.zoomBackground],
                      background: Padding(
                        padding:
                            const EdgeInsets.only(top: 24, left: 20, right: 20),
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: const Color(0xffB4C8E1),
                          ),
                          child: Row(children: [
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 22, left: 20, right: 18, bottom: 21),
                              child: Image.asset('asset/lottie/map.png'),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Padding(
                                  padding: EdgeInsets.only(top: 35, bottom: 18),
                                  child: Text(
                                    'Province Name',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xff0A0B09),
                                        fontFamily: 'DMSans'),
                                  ),
                                ),
                                Text(
                                  'Total place : ${con.sum}',
                                  style: const TextStyle(
                                      fontSize: 14,
                                      fontFamily: 'DMSans',
                                      fontWeight: FontWeight.w400,
                                      color: Color(0xff0A0B09)),
                                )
                              ],
                            ),
                          ]),
                        ),
                      ),
                    ),
                  )
                ];
              },
              body: Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Container(
                  decoration: const BoxDecoration(
                      color: Color(0xffFFFFFF),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(14),
                          topRight: Radius.circular(14))),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    physics: const AlwaysScrollableScrollPhysics(),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Center(
                            child: Container(
                              width: 39,
                              height: 4,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: const Color(0xffEBEBEB)),
                            ),
                          ),
                        ),
                        Column(
                            children: con.datalist.map((element) {
                          return Padding( 
                            padding: const EdgeInsets.only(
                                top: 25, left: 20, right: 20),
                            child: InkWell(
                              onTap: () {
                                con.index.value = element.id!;
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => DetailScreen(
                                       )));
                              },
                              child: Container(
                                width: double.infinity,
                                height: 90,
                                decoration: BoxDecoration(
                                    color: const Color(0xffFFFFFF),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 5,
                                        blurRadius: 7,
                                        offset: const Offset(
                                            0, 3), // changes position of shadow
                                      ),
                                    ],
                                    borderRadius: BorderRadius.circular(14)),
                                child: Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: CircleAvatar(
                                        radius: 50,
                                        backgroundImage: NetworkImage(
                                            element.image.toString()),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 15),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(element.name.toString()),
                                          Text(
                                              '${element.placeCount.toString()} places ')
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          );
                        }).toList()),
                      ],
                    ),
                  ),
              
                ),
              )))),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index) {
          con.navindex.value = index;
        },
        currentIndex: con.navindex.value,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.map), label: 'Explore'),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
          BottomNavigationBarItem(icon: Icon(Icons.more_horiz), label: 'More'),
        ],
      ),
    );
  }
}

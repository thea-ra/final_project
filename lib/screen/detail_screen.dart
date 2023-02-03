import 'package:final_project/controller/home_screen_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
  });

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  final con = Get.put(HomeController());

  @override
  void initState() {
    con.getData();
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff0C3B0F),
        title: Obx(
          () => Text(
            con.data.value.name.toString(),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        centerTitle: true,
      ),
      body: Obx(
        () => Column(
          children: [
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(con.data.value.image.toString()),
                      fit: BoxFit.cover)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Row(
                children: [
                  con.data.value.name.toString() == 'Phnom Penh'
                      ? Text(
                          '${con.data.value.name.toString()} City',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        )
                      : Text(
                          '${con.data.value.name.toString()} provice',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 20,
                bottom: 15,
              ),
              child: Row(
                children: [
                  RatingBarIndicator(
                    rating: 3.75,
                    itemBuilder: (context, index) => const Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    itemCount: 5,
                    itemSize: 16.0,
                    direction: Axis.horizontal,
                  ),
                  const Text(
                    'Views',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 10, left: 20, right: 20),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SvgPicture.asset(
                            'asset/lottie/description.svg',
                            width: 20,
                            height: 20,
                          ),
                          Expanded(
                              child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Text(
                              con.data.value.shortDescription.toString(),
                              textAlign: TextAlign.justify,
                            ),
                          ))
                        ],
                      ),
                    ),
                    ExpansionTile(
                      tilePadding: const EdgeInsets.only(left: 20),
                      title: const Text(
                        'Description',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w600),
                      ),
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SvgPicture.asset(
                                'asset/lottie/detail.svg',
                                width: 20,
                                height: 20,
                              ),
                              Expanded(
                                  child: Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  con.data.value.description.toString(),
                                  textAlign: TextAlign.justify,
                                ),
                              ))
                            ],
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            'All place in row',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                          children: con.datalist.map((e) {
                        return Padding(
                          padding: const EdgeInsets.only(
                              left: 10, top: 15, bottom: 20),
                          child: Column(
                            children: [
                              InkWell(
                                onTap: () {
                                  con.index.value = e.id!;

                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => DetailScreen()));
                                },
                                child: Container(
                                  width: 120,
                                  height: 80,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            e.image.toString(),
                                          ),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                              Text(
                                e.name.toString(),
                                textAlign: TextAlign.center,
                              )
                            ],
                          ),
                        );
                      }).toList()),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

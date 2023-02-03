import 'dart:convert';

import 'package:final_project/model/home_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  @override
  void onInit() {
    // TODO: implement onInit
    fetchData();
    super.onInit();
  }

  final navindex = 0.obs;
  final selected = ''.obs;
  final isLoading = false.obs;
  final datalist = <HomeModel>[].obs;
  final sum = 0.obs;
  final data = HomeModel().obs;
  final index = 0.obs;
  String baseUrl =
      'https://tests3bk.s3.ap-southeast-1.amazonaws.com/provinces.json';
// Fectdata from api
  Future<List<HomeModel>> fetchData() async {
    try {
      isLoading(true);
      final response = await http.get(Uri.parse(baseUrl));
      if (response.statusCode == 200) {
        var mydata = json.decode(response.body);
         mydata.map((e) {
          datalist.add(HomeModel.fromJson(e));
        }).toString();
      
        datalist.map((element) {
          sum.value = sum.value + int.parse(element.placeCount.toString());
        }).toList();
        print(sum);
      }
    } catch (e) {
      debugPrint(e.toString());
    }
    isLoading(false);
    return datalist;
  }

  Future<HomeModel> getData() async {
    // ignore: unnecessary_brace_in_string_interps
    await http
        .get(Uri.parse(
            'https://tests3bk.s3.ap-southeast-1.amazonaws.com/province/$index.json'))
        .then((res) {
      if (res.statusCode == 200) {
        print('Success');

        data.value = HomeModel.fromJson(
            jsonDecode(res.body.replaceAll("Pearl of Asia", "")));
      } else {
        print('Error');
      }
    });
    return data.value;
  }
}

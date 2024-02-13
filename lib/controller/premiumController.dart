import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:personWallpaperList/widget/loader.dart';

class PremiumController extends GetxController {
  RxList imageList = [].obs;
  RxInt pageCount = 1.obs;

  getAllImage({bool isLoader = false, BuildContext? context}) async {
    if(isLoader){
      showLoadingDialog(context: context);
    }
    try {
      var res = await http.get(
          Uri.parse(
            "https://api.pexels.com/v1/search?query=mostpopular&page=1&per_page=120",
          ),
          headers: {
            'Authorization':
                '1GtjsQBaMIWyDTsCqUuBQGMA8h3MRVsDjfGmuk1jjL5tHfgBFejodPQM',
          });
      // debugPrint("Url is $res");
      imageList.addAll(jsonDecode(res.body)["photos"]);

      // debugPrint("data of list is $imageList");
      // debugPrint("length of list is ${imageList.length}");
      if(isLoader){
        hideLoadingDialog(context: context);
      }
    } catch (e) {
      if(isLoader){
        hideLoadingDialog(context: context);
      }
      // debugPrint("Error is $e");
    }
  }
}

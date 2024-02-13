import 'dart:convert';
import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:personWallpaperList/Src/splash/backAllImage.dart';
import 'package:personWallpaperList/widget/loader.dart';

class HomeController extends GetxController {
  RxString saveUrl = "".obs;
  RxList personWallpaperList = [].obs;
  RxList popularWallpaperList = [].obs;
  RxList favoriteList = [].obs;
  RxList categoriesData = [].obs;
  RxBool isShow = false.obs;
  RxList featuredWallpaperText = [
    {
      "name": "Nature in snow",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRRh3Xxky9F6DZsR6SC7JhWDwqAKVuwVnrs2g&usqp=CAU",
    },
    {
      "name": "Pastel Bliss",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQc92DKRewnAEEWOfnR9wq2085P_ulxGKhUFw&usqp=CAU",
    },
    {
      "name": "Neon Power",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBbXkMwbQt7mx6NtKKVlw_3D0XhPI8dQlolg&usqp=CAU",
    },
    {
      "name": "January Picks",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQqFDPm1qCPpR3x5s3D1AqQSEs9al0WBwzW0Q&usqp=CAU",
    },
    {
      "name": "New NFTs",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTS9XEMvKJk4zSXEwCXkJextGa3G_kLSBzeXA&usqp=CAU",
    },
    {
      "name": "New Years",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS6_LPY2ie6JGN04dgAzEQzbx8oVRbSNYeGFA&usqp=CAU",
    },
    {
      "name": "Try pAlnt now",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSFFFZ9zm_2Pg4pN1aDuqhHVA8-reyue0MOoA&usqp=CAU",
    },
    {
      "name": "SnowFlakes",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTxoW4ntzYKQuXnvgcK68qeo_s81QLEvU8mEw&usqp=CAU",
    },
    {
      "name": "WhatsApp",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQA92_YErWB1SjATdRKDowjUGNu4A2qduZDIQ&usqp=CAU",
    },
    {
      "name": "NFT Artists",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQo4AtB78IsFWTHmBEghpxo1pyNNtByx4xwEA&usqp=CAU",
    },
  ].obs;
  RxInt cateIndex = 0.obs;
  RxInt nextPage = 1.obs;

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  getAllPhotos({bool isLoader = false, BuildContext? context}) async {
    if (isLoader) {
      showLoadingDialog(context: context);
    }
    try {
      var res = await http.get(
        Uri.parse("https://api.pexels.com/v1/search?query=people&page=2"),
        headers: {
          'Authorization':
              '1GtjsQBaMIWyDTsCqUuBQGMA8h3MRVsDjfGmuk1jjL5tHfgBFejodPQM',
        },
      );
      // debugPrint("states code ---> ${res.statusCode}");
      personWallpaperList.addAll(jsonDecode(res.body)["photos"]);
      // debugPrint("List data is $personWallpaperList");
      // debugPrint("List data length ${personWallpaperList.length}");
      if (isLoader) {
        hideLoadingDialog(context: context);
      }
    } catch (e) {
      if (isLoader) {
        hideLoadingDialog(context: context);
      }
      // debugPrint("Error is $e");
    }
  }

  getAllPopular({bool isLoader = false, BuildContext? context}) async {
    if (isLoader) {
      showLoadingDialog(context: context);
    }
    try {
      var res = await http.get(
        Uri.parse("https://api.pexels.com/v1/search?query=popular&page=1"),
        headers: {
          'Authorization':
              '1GtjsQBaMIWyDTsCqUuBQGMA8h3MRVsDjfGmuk1jjL5tHfgBFejodPQM',
        },
      );
      // debugPrint("states code ---> ${res.statusCode}");
      popularWallpaperList.addAll(jsonDecode(res.body)["photos"]);
      // debugPrint("List data is $popularWallpaperList");
      // debugPrint("List data length ${popularWallpaperList.length}");
      if (isLoader) {
        hideLoadingDialog(context: context);
      }
    } catch (e) {
      if (isLoader) {
        hideLoadingDialog(context: context);
      }
      // debugPrint("Error is $e");
    }
  }

  getCategoryPhotos(
      {query, bool isLoader = false, BuildContext? context,page}) async {
    if (isLoader) {
      showLoadingDialog(context: context);
    }
    try {
      var res = await http.get(
        Uri.parse(
            "https://api.pexels.com/v1/search?query=$query&page=$page&per_page=120"),
        headers: {
          'Authorization':
              '1GtjsQBaMIWyDTsCqUuBQGMA8h3MRVsDjfGmuk1jjL5tHfgBFejodPQM',
        },
      );
      // debugPrint("states code ---> ${res.statusCode}");
      categoriesData.addAll(jsonDecode(res.body)["photos"]);
      // debugPrint("List data is $categoriesData");
      // debugPrint("List data length ${categoriesData.length}");

      if (isLoader) {
        hideLoadingDialog(context: context);
      }
      Get.to(BackAllImage());
    } catch (e) {
      if (isLoader) {
        hideLoadingDialog(context: context);
      }
      // debugPrint("Error is $e");
    }
  }

  commonText({text, color}) {
    return Text(
      text,
      style: TextStyle(
        color: color ? Colors.white : Colors.grey,
        fontSize: 20,
      ),
    );
  }

  imageSave({bool isLoader = false, BuildContext? context}) async {
    if (isLoader) {
      showLoadingDialog(context: context);
    }

    var status = await Permission.storage.request();
    var res = await Dio().get(
      saveUrl.value,
      options: Options(responseType: ResponseType.bytes),
    );
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList(res.data),
        quality: 60,
        name: "Yash",);

    Get.snackbar(
      "Image Download SuccessFully",
      "",
      colorText: Colors.white,
      snackPosition: SnackPosition.BOTTOM,
    );
    if (isLoader) {
      hideLoadingDialog(context: context);
    }
  }
}

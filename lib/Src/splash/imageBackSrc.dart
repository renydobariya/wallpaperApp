import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:personWallpaperList/controller/homeController.dart';
import 'package:share_plus/share_plus.dart';

class ImageBackSrc extends StatefulWidget {
  const ImageBackSrc({super.key});

  @override
  State<ImageBackSrc> createState() => _ImageBackSrcState();
}

class _ImageBackSrcState extends State<ImageBackSrc> {
  final imageSave = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 16, top: 32),
                child: InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: Get.height / 30),
          Container(
            height: Get.height / 1.5,
            width: Get.width / 1.2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            child: Image.network(
              imageSave.saveUrl.value,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(height: Get.height / 30),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: Row(
              children: [
                InkWell(
                  onTap: () async {
                    final uri = Uri.parse(imageSave.saveUrl.value);
                    final res = await http.get(uri);
                    final bytes = res.bodyBytes;
                    final temp = await getTemporaryDirectory();
                    final path = "${temp.path}/image.jpg";
                    File(path).writeAsBytesSync(bytes);
                    await Share.shareFiles([path]);
                  },
                  child: Container(
                    height: 60,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: const Icon(
                      Icons.share,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                const Spacer(),
                Container(
                  height: 60,
                  width: 120,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: InkWell(
                    onTap: () {
                      imageSave.favoriteList.contains(imageSave.saveUrl.value)
                          ? Get.snackbar(
                              "Already Add in Favorite",
                              "",
                              colorText: Colors.white,
                              duration: const Duration(seconds: 3),
                            )
                          : (
                              {
                                imageSave.favoriteList
                                    .add(imageSave.saveUrl.value)
                              },
                              Get.snackbar(
                                "",
                                "Add Favorite",
                                colorText: Colors.white,
                                duration: const Duration(seconds: 3),
                              )
                            );
                    },
                    child: Obx(
                      () => (imageSave.favoriteList
                              .contains(imageSave.saveUrl.value))
                          ? const Icon(
                              Icons.favorite,
                              size: 30,
                              color: Colors.red,
                            )
                          : const Icon(
                              Icons.favorite_border,
                              color: Colors.white,
                              size: 30,
                            ),
                    ),
                  ),
                ),
                const Spacer(),
                InkWell(
                  onTap: () {
                    imageSave.imageSave(
                      context: context,
                      isLoader: true,
                    );
                  },
                  child: Container(
                    height: 60,
                    width: 120,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(color: Colors.black, width: 2),
                    ),
                    child: const Icon(
                      Icons.download,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

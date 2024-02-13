import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personWallpaperList/controller/categoryController.dart';
import 'package:personWallpaperList/controller/homeController.dart';

import 'imageBackSrc.dart';

class BackAllImage extends StatefulWidget {
  const BackAllImage({super.key});

  @override
  State<BackAllImage> createState() => _BackAllImageState();
}

class _BackAllImageState extends State<BackAllImage> {
  @override
  void initState() {
    homeController.getCategoryPhotos();
    super.initState();
  }

  final homeController = Get.put(HomeController());
  final searchController = Get.put(CategoryController());

  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: InkWell(
          onTap: () {
            homeController.categoriesData.clear();
            searchController.searchController.value.clear();
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            size: 26,
            color: Colors.white,
          ),
        ),
      ),
      body: Obx(() {
        return ListView(
          children: [
            SizedBox(
              height: Get.height,
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  mainAxisExtent: 300,
                ),
                itemCount: homeController.categoriesData.length,
                itemBuilder: (context, i) {
                  return GestureDetector(
                    onTap: () {
                      homeController.saveUrl.value =
                      homeController.categoriesData[i]["src"]["large"];
                      Get.to(const ImageBackSrc());
                    },
                    child: Container(
                      // height: 200,
                      // width: 0,
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: CachedNetworkImageProvider(
                            "${homeController
                                .categoriesData[i]["src"]["large"]}",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  );
                },
              ),
            )
          ],
        );
      }),
      floatingActionButton: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 32),
            child: FloatingActionButton(
              onPressed: () {
                if (homeController.nextPage.value > 1) {
                  homeController.nextPage.value --;
                  homeController.getCategoryPhotos(
                    page: homeController.nextPage.value,
                    isLoader: true,
                    context: context,
                    query: searchController.searchController.value,
                  );
                }
              },
              // debugPrint("page number = ${homeController.nextPage.value}");                },
              child: const Icon(
                Icons.arrow_back_ios_rounded,
                size: 25,
                color: Colors.black,
              ),
            ),
          ),
          const Spacer(),
          FloatingActionButton(
            onPressed: () {
              homeController.getCategoryPhotos(
                page: homeController.nextPage.value,
                isLoader: true,
                context: context,
                query: searchController.searchController.value,
              );
              homeController.nextPage.value ++;
              // debugPrint("page number is ${homeController.nextPage.value}");
            },
            child: const Icon(
              Icons.navigate_next,
              color: Colors.black,
              size: 35,
            ),
          ),
        ],
      ),
    );
  }
}

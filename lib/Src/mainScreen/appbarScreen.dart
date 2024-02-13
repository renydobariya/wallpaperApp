import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personWallpaperList/Src/mainScreen/categoresScreen.dart';
import 'package:personWallpaperList/Src/mainScreen/homeScreen1.dart';
import 'package:personWallpaperList/Src/mainScreen/premium.dart';
import 'package:personWallpaperList/Src/splash/favoriteScreen.dart';
import 'package:personWallpaperList/controller/categoryController.dart';
import 'package:personWallpaperList/controller/homeController.dart';
import 'package:personWallpaperList/controller/premiumController.dart';
import 'package:personWallpaperList/controller/videoController.dart';

class AppMainScreen extends StatefulWidget {
  const AppMainScreen({super.key});

  @override
  State<AppMainScreen> createState() => _AppMainScreenState();
}

class _AppMainScreenState extends State<AppMainScreen> {
  final homeController = Get.put(HomeController());
  final premiumController = Get.put(PremiumController());
  final searchController = Get.put(CategoryController());
  final videoController1 = Get.put(VideoController1());

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      homeController.getAllPopular(context: context, isLoader: true);
    });
    Future.delayed(
        const Duration(
          microseconds: 100,
        ), () {
      homeController.getAllPhotos(context: context, isLoader: true);
    });
    Future.delayed(
        const Duration(
          microseconds: 200,
        ), () {
      homeController.getAllPhotos(context: context, isLoader: true);
    });
    Future.delayed(
        const Duration(
          microseconds: 300,
        ), () {
      premiumController.getAllImage(
        context: context,
        isLoader: true,
      );
    });
    Future.delayed(
        const Duration(
          microseconds: 400,
        ), () {
      videoController1.getAllVideo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: homeController.scaffoldKey,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        toolbarHeight: 100,
        backgroundColor: Colors.grey.shade700,
        title: Obx(
          () => homeController.isShow.value == true
              ? Row(
                  children: [
                    InkWell(
                      onTap: () {
                        homeController.isShow.value = false;
                        Get.back();
                      },
                      child: const Padding(
                        padding: EdgeInsets.only(right: 16),
                        child: Icon(
                          Icons.arrow_back,
                          color: Colors.black,
                          size: 32,
                        ),
                      ),
                    ),
                    Expanded(
                      child: TextField(
                        controller: searchController.searchController.value,
                        style: const TextStyle(
                          fontSize: 20,
                        ),
                        cursorColor: Colors.black,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: const BorderSide(
                              color: Colors.black,
                              width: 2,
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: const BorderSide(
                              width: 2,
                              color: Colors.white,
                            ),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          hintText: "Search",
                          hintStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                          suffixIcon: InkWell(
                            onTap: () async {
                              homeController.isShow.value = false;
                              homeController.categoriesData.clear();
                              await homeController.getCategoryPhotos(
                                query: searchController
                                    .searchController.value.text,
                                page: homeController.nextPage.value,
                                isLoader: true,
                                context: context,
                              );
                            },
                            child: const Icon(
                              Icons.send_outlined,
                              color: Colors.black,
                              size: 26,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )
              : Obx(
                  () {
                    return Column(
                      children: [
                        Row(
                          children: [
                            InkWell(
                              onTap: () {
                                homeController.scaffoldKey.currentState!
                                    .openDrawer();
                              },
                              child: const Icon(Icons.menu,
                                  size: 26, color: Colors.white),
                            ),
                            const Spacer(),
                            const Text(
                              "WallPapers",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 26,
                              ),
                            ),
                            const Spacer(),
                            InkWell(
                              onTap: () {
                                homeController.isShow.value = true;
                                debugPrint(
                                    "value is ${homeController.isShow.value}");
                              },
                              child: const Padding(
                                padding: EdgeInsets.only(right: 16),
                                child: Icon(Icons.search_rounded,
                                    color: Colors.white, size: 26),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 25),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                 homeController.cateIndex.value = 0;
                              },
                              child: homeController.commonText(
                                text: "Home",
                                color: homeController.cateIndex.value == 0,
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                 homeController.cateIndex.value = 1;
                              },
                              child: homeController.commonText(
                                text: "Categories",
                                color: homeController.cateIndex.value == 1,
                              ),
                            ),
                            const Spacer(),
                            GestureDetector(
                              onTap: () {
                                 homeController.cateIndex.value = 2;
                              },
                              child: homeController.commonText(
                                text: "Premium",
                                color: homeController.cateIndex.value == 2,
                              ),
                            ),
                          ],
                        ),
                      ],
                    );
                  },
                ),
        ),
      ),
      backgroundColor: Colors.black.withOpacity(0.3),
      body: PageView.builder(
        itemCount: 3,
        onPageChanged: (value) {
          homeController.cateIndex.value = value;
        },
        itemBuilder: (context, index) {
          return index == 0 || homeController.cateIndex.value ==0
              ? const HomeScreen1()
              : index == 1 || homeController.cateIndex.value ==1
                  ? const Categories()
                  : const PremiumScreen();
        },
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.purple,
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Container(
                        height: 80,
                        width: 80,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.black.withOpacity(0.6)),
                        child: const Icon(Icons.person_outline,
                            color: Colors.white, size: 60),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "ZEDGE",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26,
                            ),
                          ),
                          Container(
                            width: 120,
                            height: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(26),
                            ),
                            child: const Center(
                              child: Text(
                                "Log In",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 8, right: 24),
                          child: Icon(
                            Icons.person,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                        Text(
                          "My Zedge",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.home),
              title: const Text('Home'),
              onTap: () {
                Get.back();
              },
            ),
            ListTile(
              leading: const Icon(Icons.favorite),
              title: const Text('Favorite'),
              onTap: () {
                Get.to(const FavoriteScreen());
              },
            ),
            ListTile(
              leading: const Icon(Icons.video_collection),
              title: const Text('Video Wallpaper'),
              onTap: () {
                Get.to(const FavoriteScreen());
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personWallpaperList/Src/splash/imageBackSrc.dart';
import 'package:personWallpaperList/controller/homeController.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({super.key});

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.3),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.only(
              left: 24,
              top: 16,
            ),
            child: Text(
              "Featured",
              style: TextStyle(fontSize: 30, color: Colors.white),
            ),
          ),
          SizedBox(
            height: 150,
            child: Obx(() {
              return ListView.builder(
                itemCount: homeController.featuredWallpaperText.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: GestureDetector(
                      onTap: () {
                        homeController.getCategoryPhotos(
                          query: homeController.featuredWallpaperText[index]
                              ["name"],
                          context: context,
                          isLoader: true,
                        );
                      },
                      child: Container(
                        height: 100,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(
                            26,
                          ),
                          image: DecorationImage(
                            image: CachedNetworkImageProvider(
                              "${homeController.featuredWallpaperText[index]["image"]}",
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                "${homeController.featuredWallpaperText[index]["name"]}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          const Row(
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 16,
                  top: 16,
                ),
                child: Text(
                  "Popular Collections",
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ),
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.only(top: 16, right: 16),
                child: Text(
                  "SEE MORE",
                  style: TextStyle(fontSize: 20, color: Colors.purple,),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 230,
            child: Obx(() {
              return ListView.builder(
                itemCount: homeController.popularWallpaperList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 16, right: 4, top: 16),
                    child: GestureDetector(
                      onTap: () {
                        homeController.getCategoryPhotos(
                          query: homeController.popularWallpaperList[index]
                              ["photographer"],
                          isLoader: true,
                          context: context,
                        );
                      },
                      child: Container(
                        height: 100,
                        width: 100,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.circular(
                            16,
                          ),
                          border: Border.all(
                            color: Colors.grey,
                            width: 3,
                          ),
                          image: DecorationImage(
                              image: NetworkImage(
                                "${homeController.popularWallpaperList[index]["src"]["large"]}",
                              ),
                              onError: (exception, stackTrace) => const Icon(
                                    Icons.error_outline,
                                  ),
                              fit: BoxFit.cover),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 8),
                              child: Text(
                                "${homeController.popularWallpaperList[index]["photographer"]}",
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              );
            }),
          ),
          const Padding(
            padding: EdgeInsets.only(
              left: 24,
              top: 16,
            ),
            child: Text(
              "Popular",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Obx(() {
            return GridView.builder(
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              itemCount: homeController.personWallpaperList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisExtent: 200,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: () {
                    homeController.saveUrl.value =
                        homeController.personWallpaperList[i]["src"]["large"];
                    Get.to(const ImageBackSrc());
                  },
                  child: Container(
                    width: 150,
                    height: 150,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(26),
                    ),
                    child: CachedNetworkImage(
                      imageUrl:
                          "${homeController.personWallpaperList[i]["src"]["large"]}",
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Column(
                        children: [
                          CircularProgressIndicator(),
                        ],
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error_outline,
                      ),
                    ),
                  ),
                );
              },
            );
          }),
        ],
      ),
    );
  }
}

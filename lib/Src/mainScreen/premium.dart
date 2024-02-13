import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personWallpaperList/controller/homeController.dart';
import 'package:personWallpaperList/controller/premiumController.dart';

import '../splash/imageBackSrc.dart';

class PremiumScreen extends StatefulWidget {
  const PremiumScreen({super.key});

  @override
  State<PremiumScreen> createState() => _PremiumScreenState();
}

class _PremiumScreenState extends State<PremiumScreen> {
  final premiumController = Get.put(PremiumController());
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.3),
      body: Obx(() {
        return ListView(
          physics: const ScrollPhysics(),
          children: [
            GridView.builder(
              physics: const ScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                mainAxisSpacing: 8,
                crossAxisSpacing: 8,
                mainAxisExtent: 300,
              ),
              itemCount: premiumController.imageList.length,
              itemBuilder: (context, i) {
                return GestureDetector(
                  onTap: () {
                    homeController.saveUrl.value =
                    premiumController.imageList[i]["src"]["large"];
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
                          "${premiumController
                              .imageList[i]["src"]["large"]}",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        );
      }),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:personWallpaperList/controller/categoryController.dart';
import 'package:personWallpaperList/controller/homeController.dart';

class Categories extends StatefulWidget {
  const Categories({super.key});

  @override
  State<Categories> createState() => _CategoriesState();
}

class _CategoriesState extends State<Categories> {
  final categoryController = Get.put(CategoryController());
  final homeController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.3),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 16, left: 24),
            child: Text(
              "Popular Searches",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
          ),
          SizedBox(
            height: 130,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categoryController.categoriesWallpapers.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      homeController.getCategoryPhotos(
                        query: categoryController.categoriesWallpapers[index]
                            ["text"],
                        context: context,
                        isLoader: true,
                      );
                    },
                    child: Container(
                      width: 100,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(24),
                        image: DecorationImage(
                            image: NetworkImage(
                              "${categoryController.categoriesWallpapers[index]["image"]}",
                            ),
                            fit: BoxFit.cover),
                      ),
                      child: Center(
                        child: Text(
                          "${categoryController.categoriesWallpapers[index]["text"]}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(top: 16, left: 24),
            child: Text(
              "Categories",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
          ),
          SizedBox(
            height: Get.height / 1.8,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisExtent: 100, mainAxisSpacing: 10),
              itemCount: categoryController.categoriesWallpapers.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(left: 16, right: 8),
                  child: GestureDetector(
                    onTap: () {
                      homeController.getCategoryPhotos(
                        query: categoryController.categoriesWallpapers[index]
                            ["nameCategory"],
                        context: context,
                        isLoader: true,
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.transparent,
                          image: DecorationImage(
                            image: NetworkImage(
                              "${categoryController.categoriesWallpapers[index]["imageCategory"]}",
                            ),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.circular(26)),
                      child: Center(
                        child: Text(
                          "${categoryController.categoriesWallpapers[index]["nameCategory"]}",
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}

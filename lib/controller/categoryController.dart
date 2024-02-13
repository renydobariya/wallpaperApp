import 'package:get/get.dart';
import 'package:flutter/material.dart';

class CategoryController extends GetxController {
  RxList categoriesWallpapers = [
    {
      "text": "Mushroom Ms",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRQ-P9Z_NOfDerOINefOxuuohgNvVbgoL4LSA&usqp=CAU",
      "imageCategory":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTPNsXhWI5yCBUXDzuFM2QnLm3k25HuWiODjA&usqp=CAU",
      "nameCategory": "NFTs"
    },
    {
      "text": "Valentines Day",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTjyj5GTKtsJXy3rQIQ2Jq_Y3u18FZj5RUa2g&usqp=CAU",
      "imageCategory":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTe470S6onNO773lQgGivFk0kgZmHjKqNLCcg&usqp=CAU",
      "nameCategory": "Animals"
    },
    {
      "text": "Winter",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRZAgeMBTYmKFHujapv1QumXkfJSkUllB45uQ&usqp=CAU",
      "imageCategory":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRJLFHxbtxEcM_jB4U5zFKUMViTrtd1cohy1Q&usqp=CAU",
      "nameCategory": "Recent"
    },
    {
      "text": "Anime",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTbCctEPlVWzIUv1y6b2NXgLYUzmtSv5Q3jQQ&usqp=CAU",
      "imageCategory":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR0fMof44C1EmppocpXvyBVd2VabUlgKlFFNA&usqp=CAU",
      "nameCategory": "Trending"
    },
    {
      "text": "Stitch",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ9T4S_RSkcorqBl0jAEa7eJQfAkMK3AnJ9tQ&usqp=CAU",
      "imageCategory":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRUGnB-5S8ZPziBW1aeduI6Afc7M9w2iNG01g&usqp=CAU",
      "nameCategory": "Anime"
    },
    {
      "text": "Michigan Wolverines",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRx6siXRGUV1IyVuzChbqKeHetL77b-xZLQ2g&usqp=CAU",
      "imageCategory":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTBMgwl-fmceF02AMidY1rSjgxWKOZVDT4qIg&usqp=CAU",
      "nameCategory": "Bollywood"
    },
    {
      "text": "One Piece",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTaaqTG_gBR_PWrxLsbww__eRCMmxwWERSi3w&usqp=CAU",
      "imageCategory":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSrYBoM_lNGaUMeH5xH-O2cCcAM_YfCbVQtIw&usqp=CAU",
      "nameCategory": "Logos"
    },
    {
      "text": "Black",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTrAtA7fGvKen_UEFGt9FlCgXHmULu0_vo8NQ&usqp=CAU",
      "imageCategory":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT2WKh6KXSSAj8mqq-YyJ-a0BGUOUQIxOqSCQ&usqp=CAU",
      "nameCategory": "Cars & Vehicles"
    },
    {
      "text": "Ring Tones",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRb6vBmA3AhCe-hTorZ5PDa2TnzzHqIiwHuQQ&usqp=CAU",
      "imageCategory":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSHugnnEE6Cl7SsXBH7Y-zKwV2N4-7OJQDhRQ&usqp=CAU",
      "nameCategory": "Designs"
    },
    {
      "text": "Star Wars",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyL-LaOsBdTJDFB5uH48xbgZfztNJnJc8H9w&usqp=CAU",
      "imageCategory":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTfjSWa2mhZ05FYEIbp8Kydu7CYdSlAJS-dQ&usqp=CAU",
      "nameCategory": "Drawings"
    },
    {
      "text": "Romeo",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTqHD467e8uNGn10NuMH1SXf7ubPe8ULCwarA&usqp=CAU",
      "imageCategory":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQyzZcC9_imI3HGHjoPx4LuSGuHAJXU94FDUw&usqp=CAU",
      "nameCategory": "Entertaining"
    },
    {
      "text": "Anthology",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQKxQ6OMkDpIb8ZbCsUWrx10vV1HNv2WhBwSw&usqp=CAU",
      "imageCategory":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSjZX8pkINgMp6n0nASS201AYfSUJKBSbiWA&usqp=CAU",
      "nameCategory": "Funny"
    },
    {
      "text": "Scion",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQLwsh_5mG47-MqcWNEMNKQ9RuoMleuvD9t5g&usqp=CAU",
      "imageCategory":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRwSEE_DUCr_9P5vWFLIc6zHHFD1dAOfLO1HQ&usqp=CAU",
      "nameCategory": "Games"
    },
    {
      "text": "Zoffany",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQj5YCoQAw6HgemOaT5JINJ3WsRbQNyJsAMqw&usqp=CAU",
      "imageCategory":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRHgB6tdOSZ0TNrz6om3Mw7sNT7VKvwu4Ic4Q&usqp=CAU",
      "nameCategory": "Holidays"
    },
    {
      "text": "Farrow & Ball",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSkw38z5z9mDmBakXQVtFO8lVG_gKDiWK8_KQ&usqp=CAU",
      "imageCategory":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTTvEa9KkEVUOntKM6geJ55JB_-qvSJ0Mfdew&usqp=CAU",
      "nameCategory": "Love"
    },
    {
      "text": "Studio Ditte",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQNtgHghsTzQtEbNwwfAJFnD_RYwB7bQKswxw&usqp=CAU",
      "imageCategory":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSesM-Y8XVpJrz-yjfNVa5F5Onuu7H4Dl46tw&usqp=CAU",
      "nameCategory": "Music"
    },
    {
      "text": "Floral",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCjZtEkM4Pxtw94J023GhTwUHlHjDZG5kgVw&usqp=CAU",
      "imageCategory":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRepCoPVhIXI3rEUss3pxeNaHcqwHHgVHZTeQ&usqp=CAU",
      "nameCategory": "Nature"
    },
    {
      "text": "Retro",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgkcP94yvSx5lWgLbZ7sa7tL6lZ7ZhJQAYIw&usqp=CAU",
      "imageCategory":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRSCgHOIansTwH6hp2wtnE7FbICXoFftLAR9A&usqp=CAU",
      "nameCategory": "News & Politics"
    },
    {
      "text": "Geometric",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSKo2cTppvunH4ea_LoW2ozljjNtbLzsD-NiQ&usqp=CAU",
      "imageCategory":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQiva4E10itvClA6eBMaVSvWhvszbzI5i7o9A&usqp=CAU",
      "nameCategory": "Other"
    },
    {
      "text": "Tropical",
      "image":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRTODLIRkwRNBc41XH7amo9ViMd1DkTRI1ArQ&usqp=CAU",
      "imageCategory":
          "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ24InMbiwMiLH_1KT0Eglh2TuhZKxZ6lewrQ&usqp=CAU",
      "nameCategory": "Patterns"
    },
  ].obs;
  final searchController = TextEditingController().obs;
}

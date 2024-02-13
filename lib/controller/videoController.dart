import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

class VideoController1 extends GetxController {
  RxList videoList = [].obs;
  VideoPlayerController? playController;

  getAllVideo() async {
    try {
      var res = await http.get(
          Uri.parse(
              "https://api.pexels.com/videos/search?query=nature&per_page=10"),
          headers: {
            'Authorization':
                '1GtjsQBaMIWyDTsCqUuBQGMA8h3MRVsDjfGmuk1jjL5tHfgBFejodPQM',
          });
      for (var i = 0; i < jsonDecode(res.body)["videos"].length; i++) {
        videoList
            .add(jsonDecode(res.body)["videos"][i]["video_files"][4]["link"]);
      }
    } catch (e) {
      // debugPrint("error video $e");
    }
  }

  videoPlayer({link}) async {
    playController = VideoPlayerController.networkUrl(
      Uri.parse("$link"),
    );
    await playController!.initialize();
    playController!.setLooping(true);
    playController!.play();
    // playController!.pause();
  }
  videoPlay() {
    VideoPlayer(playController!);
  }
}

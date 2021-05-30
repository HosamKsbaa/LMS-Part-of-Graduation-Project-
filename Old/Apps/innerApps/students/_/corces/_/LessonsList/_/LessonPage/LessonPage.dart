import 'package:flutter/material.dart';
import 'package:x_bloc/x_bloc.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class LessonPage {
  HDM<LessonPage> data;

  LessonPage() {
    //todo remove the youtupe logo and stuff
    data = HDM<LessonPage>(this, _LessonPageWidget);

    youTupeSting =
        "https://www.youtube.com/watch?v=DnNMJyD7EBY&ab_channel=MrMohamedAbdelMaaboud;rel=0&amp;autohide=1&amp;showinfo=0&amp;wmode=transparent";
    controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(youTupeSting),
      flags: YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
        hideThumbnail: true,
        hideControls: false,
      ),
    );
  }
  String youTupeSting;
  YoutubePlayerController controller;
  void onEnterFullScreen() {}
}

Builder _LessonPageWidget(StateMain<LessonPage> s) {
  return Builder(builder: (context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الدروس"),
      ),
      // body: SingleChildScrollView(
      //   child: Column(
      //     children: [],
      //   ),
      // ),
      body: YoutubePlayerBuilder(
          player: YoutubePlayer(
            controller: s.h.controller,
          ),
          builder: (context, player) {
            return Column(
              children: [
                // some widgets
                player,
                //some other widgets
              ],
            );
          }),
    );
  });
}

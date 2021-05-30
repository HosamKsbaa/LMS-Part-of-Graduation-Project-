import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:x_bloc/x_bloc.dart';
import 'package:x_misters/App.Old.Moduels/Corces/Corces.dart';
import 'package:x_misters/Apps/innerApps/students/_/corces/_/LessonsList/_/LessonPage/LessonPage.dart';

class LessonUnit {
  HDM<LessonUnit> data;
  Lesson lesson;
  LessonUnit(Lesson lesson) {
    data = HDM<LessonUnit>(this, _LessonUnitWidget);
    this.lesson = lesson;
  }
}

Builder _LessonUnitWidget(StateMain<LessonUnit> s) {
  return Builder(builder: (context) {
    return Card(
      child: ListTile(
        onTap: () {
          Get.to(LessonPage().data.play());
        },
        title: Text(s.h.lesson.title),
        subtitle: Text("Last Update : 2020/9/${DateTime.now().day}"),
        leading: Icon(
          Icons.video_library,
          color: Colors.green,
        ),
        trailing: Icon(Icons.more_vert),
      ),
    );
  });
}

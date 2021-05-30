import 'package:flutter/material.dart';
import 'package:x_bloc/x_bloc.dart';
import 'package:x_misters/App.Old.Moduels/Corces/Corces.dart';
import 'package:x_misters/Apps/innerApps/students/_/corces/_/LessonsList/_____________/ListUnite.dart';

class LessonsList {
  Course course;
  HDM<LessonsList> data;

  LessonsList(Course course) {
    data = HDM<LessonsList>(this, _LessonsListWidget);
    this.course = course;
  }

  List<Widget> maping() {
    List<Widget> x = [];
    x = course.lesson.map((e) => LessonUnit(e).data.play()).toList();
    return x;
  }
}

Builder _LessonsListWidget(StateMain<LessonsList> s) {
  return Builder(builder: (context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("الدروس"),
      ),
      body: Container(
        child: ListView(
          children: s.h.maping(),
        ),
      ),
    );
  });
}

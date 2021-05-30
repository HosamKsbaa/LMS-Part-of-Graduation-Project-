import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:x_bloc/x_bloc.dart';
import 'package:x_misters/App.Old.Moduels/Corces/Corces.dart';
import 'package:x_misters/Apps/innerApps/students/_/corces/_/LessonsList/LessonsList.dart';

class CorcesUnite {
  HDM<CorcesUnite> data;
  Course course;
  CorcesUnite(Course course) {
    data = HDM<CorcesUnite>(this, _CorcesUniteWidget);
    this.course = course;
  }
}

Builder _CorcesUniteWidget(StateMain<CorcesUnite> s) {
  return Builder(builder: (context) {
    return Card(
      child: ListTile(
        onTap: () {
          Get.to(LessonsList(s.h.course).data.play());
        },
        title: Text(s.h.course.title),
        subtitle: Text("Last Update : 2020/9/${DateTime.now().day}"),
        leading: Icon(
          Icons.done_all,
          color: Colors.green,
        ),
        trailing: Icon(Icons.more_vert),
      ),
    );
  });
}

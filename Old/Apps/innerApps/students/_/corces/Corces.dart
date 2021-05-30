import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:x_bloc/x_bloc.dart';
import 'package:x_misters/App.Old.Moduels/Corces/Corces.dart';
import 'package:x_misters/Apps/innerApps/students/_/corces/_____________/CorcesUnit/CorcesUnite.dart';

class SelectCorcesPage {
  HDM<SelectCorcesPage> data;

  SelectCorcesPage() {
    data = HDM<SelectCorcesPage>(this, _CorcesWidget);
    temp();
  }
  List<Course> inlistedCorces;

  void temp() {
    //todo remove
    inlistedCorces = coursesList;
  }

  List<Widget> maping() {
    List<Widget> x = [];
    x = inlistedCorces.map((e) => CorcesUnite(e).data.play()).toList();
    return x;
  }
}

Builder _CorcesWidget(StateMain<SelectCorcesPage> s) {
  return Builder(builder: (context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("كورساتك"),
      ),
      body: Container(
        child: ListView(
          children: s.h.maping(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.defaultDialog(
              title: "Add a new Course ",
              actions: [
                RaisedButton(
                  color: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                    Get.snackbar("Error", "Not found", backgroundColor: Colors.white);
                  },
                  child: Icon(
                    Icons.add,
                    color: Colors.green,
                  ),
                )
              ],
              content: TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: ' Code ',
                ),
              ));
        },
        child: Icon(Icons.add),
      ),
    );
  });
}

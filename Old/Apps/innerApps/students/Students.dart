import 'package:flutter/material.dart';
import 'package:x_bloc/x_bloc.dart';
import 'package:x_misters/Apps/innerApps/students/_/test/test.dart';

import '_/corces/Corces.dart';

class Students {
  HDM<Students> data;
  SelectCorcesPage _corces = SelectCorcesPage();

  Students() {
    data = HDM<Students>(this, _bNBWidget);
    widgetOptions = <Widget>[
      _corces.data.play(),
      test().data.play(),
    ];
  }
  //region UI logic

  List<Widget> widgetOptions;

  int selectedIndex = 0;

  void onItemTapped(int index) {
    selectedIndex = index;
    data.update([0]);
  }

  List<BottomNavigationBarItem> items = const <BottomNavigationBarItem>[
    BottomNavigationBarItem(
      icon: Icon(Icons.school),
      title: Text("الكورسات"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.message),
      title: Text("رسائل"),
    ),
    BottomNavigationBarItem(
      icon: Icon(
        Icons.error,
        color: Colors.red,
      ),
      title: Text("do not enter "),
    ),
  ];
//endregion

}

Builder _bNBWidget(StateMain<Students> s) {
  return Builder(builder: (context) {
    return Scaffold(
      body: Center(
        child: s.h.widgetOptions.elementAt(s.h.selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: s.h.items,
        currentIndex: s.h.selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: s.h.onItemTapped,
      ),
    );
  });
}

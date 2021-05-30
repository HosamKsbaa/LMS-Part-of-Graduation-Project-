import 'package:flutter/material.dart';
import 'package:x_bloc/x_bloc.dart';

class Parents {
  HDM<Parents> data;

  Parents() {
    data = HDM<Parents>(this, _bNBWidget);
    widgetOptions = <Widget>[
      //_corces.data.play(),
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

Builder _bNBWidget(StateMain<Parents> s) {
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

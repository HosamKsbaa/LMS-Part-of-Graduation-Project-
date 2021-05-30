import 'package:flutter/material.dart';
import 'package:x_bloc/x_bloc.dart';

class Teachers {
  HDM<Teachers> data;
  Teachers() {
    data = HDM<Teachers>(this, _bNBWidget);
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
      icon: Icon(Icons.timer),
      title: Text("الكورسات"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.folder),
      title: Text("رسائل"),
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.data_usage),
      title: Text("Statisitcs "),
    ),
  ];
//endregion

}

Builder _bNBWidget(StateMain<Teachers> s) {
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

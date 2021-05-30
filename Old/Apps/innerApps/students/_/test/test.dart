import 'package:flutter/material.dart';
import 'package:x_bloc/x_bloc.dart';

class test {
  HDM<test> data;

  test() {
    data = HDM<test>(this, _testWidget);
  }

  int a = 0;

  void add() {
    a++;
    data.update([0]);
  }

  void addn() {
    a--;
    data.update([0]);
  }
}

Builder _testWidget(StateMain<test> s) {
  return Builder(builder: (context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Contacts")),
      ),
      body: Center(child: Text("There is no Contacts")),
    );
  });
}

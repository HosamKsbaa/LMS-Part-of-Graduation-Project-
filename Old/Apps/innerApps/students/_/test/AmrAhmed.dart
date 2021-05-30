import 'package:flutter/material.dart';
import 'package:x_bloc/x_bloc.dart';

class AmrAhmed {
  HDM<AmrAhmed> data;

  AmrAhmed() {
    data = HDM<AmrAhmed>(this, _AmrAhmedWidget);
  }
}

Builder _AmrAhmedWidget(StateMain<AmrAhmed> s) {
  return Builder(builder: (context) {
    return Container();
  });
}

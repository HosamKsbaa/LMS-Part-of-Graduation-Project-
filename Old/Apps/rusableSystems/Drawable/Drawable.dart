import 'package:flutter/material.dart';
import 'package:x_bloc/x_bloc.dart';

class Drawable {
  HDM<Drawable> data;

  Drawable() {
    data = HDM<Drawable>(this, _DrawableWidget);
  }
}

Builder _DrawableWidget(StateMain<Drawable> s) {
  return Builder(builder: (context) {
    return Container();
  });
}

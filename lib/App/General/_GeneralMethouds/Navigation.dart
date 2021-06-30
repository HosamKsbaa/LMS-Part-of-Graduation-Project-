import 'package:flutter/cupertino.dart';

void hDMNavigatorPush(BuildContext context, Widget play()) {
  Navigator.push(
    context,
    PageRouteBuilder(
        transitionDuration: Duration(milliseconds: 200),
        pageBuilder: (_, __, ___) => play(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          var begin = Offset(-1.0, 0.0);
          var end = Offset.zero;
          var curve = Curves.linear;

          var tween = Tween(begin: begin, end: end);
          var curvedAnimation = CurvedAnimation(
            parent: animation,
            curve: curve,
          );

          return SlideTransition(
            position: tween.animate(curvedAnimation),
            child: child,
          );
        }),
  );
}

void hDMNavigatorpop(BuildContext context, Widget play()) {
  Navigator.pushAndRemoveUntil(
      context,
      PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 200),
          pageBuilder: (_, __, ___) => play(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            var begin = Offset(-1.0, 0.0);
            var end = Offset.zero;
            var curve = Curves.linear;

            var tween = Tween(begin: begin, end: end);
            var curvedAnimation = CurvedAnimation(
              parent: animation,
              curve: curve,
            );

            return SlideTransition(
              position: tween.animate(curvedAnimation),
              child: child,
            );
          }),
      (_) => false);
}

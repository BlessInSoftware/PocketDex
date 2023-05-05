import 'package:flutter/material.dart';

class CreateAnimatedRoute {
  final Widget _page;

  CreateAnimatedRoute({required Widget page}) : _page = page;

  PageRouteBuilder fade() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => _page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const Cubic curve = Curves.ease;
        final Animatable<double> tween =
            Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));
        return FadeTransition(
          opacity: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  PageRouteBuilder rotate() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => _page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const Cubic curve = Curves.ease;
        final Animatable<double> tween =
            Tween(begin: 0.0, end: 1.0).chain(CurveTween(curve: curve));
        return RotationTransition(
          turns: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  PageRouteBuilder scale() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => _page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const double begin = 0.0;
        const double end = 1.0;
        const Cubic curve = Curves.ease;
        final Animatable<double> tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return ScaleTransition(
          scale: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  PageRouteBuilder slideVertically() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => _page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const Offset begin = Offset(0.0, 1.0);
        const Offset end = Offset.zero;
        const Cubic curve = Curves.ease;
        final Animatable<Offset> tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

  PageRouteBuilder slideHorizontally() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => _page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const Offset begin = Offset(1.0, 0.0);
        const Offset end = Offset.zero;
        const Cubic curve = Curves.ease;
        final Animatable<Offset> tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}

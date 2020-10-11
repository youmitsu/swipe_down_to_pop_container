import 'package:flutter/material.dart';

class SwipeDownToPopRoute extends PageRouteBuilder {
  final Widget widget;
  final bool opaque;
  final Function onTransitionCompleted;
  final Function onTransitionDismissed;

  SwipeDownToPopRoute({
    @required this.widget,
    this.opaque = false,
    this.onTransitionCompleted,
    this.onTransitionDismissed,
  }) : super(
            opaque: opaque,
            pageBuilder: (
              context,
              animation,
              secondaryAnimation,
            ) {
              animation.addStatusListener((status) {
                if (status == AnimationStatus.completed &&
                    onTransitionCompleted != null) {
                  onTransitionCompleted();
                } else if (status == AnimationStatus.dismissed &&
                    onTransitionDismissed != null) {
                  onTransitionDismissed();
                }
              });
              return widget;
            },
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity: animation,
                child: child,
              );
            });
}

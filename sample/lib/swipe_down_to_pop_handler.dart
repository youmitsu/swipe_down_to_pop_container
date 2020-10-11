import 'package:flutter/material.dart';

class SwipeDownToPopContainer extends StatefulWidget {
  final ScrollView scrollable;
  final SwipeDownToPopHandler handler;

  SwipeDownToPopContainer({
    @required this.scrollable,
    @required this.handler,
  });

  @override
  _SwipeDownToPopContainerState createState() =>
      _SwipeDownToPopContainerState();
}

class _SwipeDownToPopContainerState extends State<SwipeDownToPopContainer> {
  static const double defaultPageOpacity = 1.0;

  double backgroundPageOpacity = defaultPageOpacity;
  _ScrollMode _mode;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: Color(0xff0b0b0b).withOpacity(backgroundPageOpacity),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          color: Colors.transparent,
          child: NotificationListener<ScrollNotification>(
            child: NotificationListener(),
          ),
        ),
      ),
    );
  }

  _handleNotification() {}
}

enum _ScrollMode {
  // nullの場合は、初期状態、自動でスクロールしてしまっている、こちらで想定していない動作の場合
  start, // スクロールが始まっている
  setUp, // スクロールが手動である
  doing, // startの条件かつ、その後もスクロールが手動で継続されている
  end, // doingの条件かつ、手動でスクロールが終わっている
}

class DefaultSwipeDownToPopHandler with SwipeDownToPopHandler {
  @override
  bool handleNotification(ScrollNotification notification) {}
}

mixin SwipeDownToPopHandler {
  bool handleNotification(ScrollNotification notification);
}

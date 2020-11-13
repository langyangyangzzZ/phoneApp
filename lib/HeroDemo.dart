import 'package:flutter/material.dart';

class HeroPage extends StatefulWidget {
  @override
  _HeroPageState createState() => _HeroPageState();
}

class _HeroPageState extends State<HeroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text("Hero动画"),
      ),
      body: Container(
        child: Hero(
          tag: "JumpTag",
          child: Material(
            //必须加!!!!
            child: InkWell(
              onTap: () {
                Navigator.of(context).push(PageRouteBuilder(
                  pageBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation) {
                    return JumpPage();
                  },
                  //打开新的页面用的时间
                  transitionDuration: Duration(milliseconds: 1800),
                  //关闭页面用的时间
                  reverseTransitionDuration: Duration(milliseconds: 1800),
                  transitionsBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation,
                      Widget child) {
                    return FadeTransition(
                      opacity: new Tween(begin: 0.0, end: 1.0).animate(
                          new CurvedAnimation(
                              curve: Curves.bounceInOut, parent: animation)),
                      child: child,
                    );
                  },
                ));
              },
              child: Image.network(
                  "https://image.springup9.com/image/20200805/epcyoisqmm80000000.jpeg"),
            ),
          ),
        ),
        width: 200,
        height: 100,
      ),
    );
  }
}

class JumpPage extends StatefulWidget {
  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<JumpPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("过度动画"),
      ),
      body: Container(
          child: InkWell(
        child: Hero(
            tag: "JumpTag",
            child: Image.network(
              "https://image.springup9.com/image/20200805/epcyoisqmm80000000.jpeg",
              width: 400,
              height: 200,
            )),
        onTap: () {
          Navigator.pop(context);
        },
      )),
    );
  }
}

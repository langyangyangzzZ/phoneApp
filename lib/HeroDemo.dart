import 'package:flutter/cupertino.dart';
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
        color: Colors.transparent,

           child: Hero(
              tag: "JumpTag",
              //必须加!!!!
              child: Material(
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
                                  curve: Curves.bounceInOut,
                                  parent: animation)
                          ),
                          child: child,
                        );
                      },
                    ));
                  },
                  child: Row(
                    children: [Image.network(

                      "https://raw.githubusercontent.com/flutter/website/master/examples/_animation/hero_animation/images/flippers-alpha.png",
                      width: 200,
                      height: 100,
                    )],
                  ),
                ),
              ),
            ),
      ),
    );
  }
}

class JumpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("过度动画"),
      ),
      body: Container(
          color: Colors.transparent,
          child: Column(
        children: [
          Material(
            child: InkWell(
              child: Hero(
                  tag: "JumpTag",
                  child: Image.network(
                    "https://raw.githubusercontent.com/flutter/website/master/examples/_animation/hero_animation/images/flippers-alpha.png",
                    width: 400,
                    height: 200,
                  )),
              onTap: () {
                Navigator.of(context).pop(context);
              },
            ),
          ),
          Text(
            "今天是礼拜六,我在公司加班",
            style: TextStyle(fontSize: 30),
          ),
        ],
      )),
    );
  }
}

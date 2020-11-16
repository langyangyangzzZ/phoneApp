import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

class Radial_hero_animaiton_demo_page extends StatefulWidget {
  @override
  _Radial_hero_animaiton_demo_pageState createState() =>
      _Radial_hero_animaiton_demo_pageState();
}

class _Radial_hero_animaiton_demo_pageState
    extends State<Radial_hero_animaiton_demo_page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("径向Hero动画"),
      ),
      body: initRadialHeroBody(),
    );
  }

  /**
   *  body 布局
   */
  Widget initRadialHeroBody() {
    return Container(
        padding: EdgeInsets.all(30),
        alignment: Alignment.bottomLeft,
        child: Row(
          children: [
            Hero(
              createRectTween: (Rect begin, Rect end) {
                return MaterialRectCenterArcTween(begin: begin, end: end);
              },
              tag: "RadialHeroAnimation",
              child: ClipOval(
                  child: Container(
                    child: Material(
                      color: Colors.teal,
                      child: InkWell(
                        child: Image.network(
                          "https://raw.githubusercontent.com/flutter/website/master/examples/_animation/radial_hero_animation/images/chair-alpha.png",
                          width: 70,
                          height: 70,
                        ),
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              pageBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secondaryAnimation) {
                                return JumpHeroPage();
                              },
                              //打开新页面的时间
                              transitionDuration: Duration(seconds: 2),
                              //关闭页面的时间
                              reverseTransitionDuration: Duration(seconds: 1),
                              //打开页面的动画
                              transitionsBuilder: (BuildContext context,
                                  Animation<double> animation,
                                  Animation<double> secondaryAnimation,
                                  Widget child) {
                                return FadeTransition(
                                  opacity:
                                  new Tween<double>(begin: 0, end: 1).animate(
                                    CurvedAnimation(
                                      parent: animation,
                                      curve: Curves.linear,
                                    ),
                                  ),
                                  child: child,
                                );
                              },
                            ),
                          );
                        },
                      ),
                    ),
                  )),
            ),
          ],
        ));
  }
}

class JumpHeroPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("JumpHeroPage页面"),
        ),
        body: Center(
          //使用卡片布局
          child: Card(
            child: Column(
              //设置最小宽度
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 300,
                  height: 300,
                  child: Hero(
                    createRectTween: (Rect begin, Rect end) {
                      return MaterialRectCenterArcTween(begin: begin, end: end);
                    },
                    tag: "RadialHeroAnimation",
                    child: ClipOval(
                      child: Container(
                        alignment: Alignment.center,
                        child: ClipRect(
                          child: Container(
                              width: 2 * (300 / 2 / math.sqrt2),
                              height: 2 * (300 / 2 / math.sqrt2),
                              child: Material(
                                color: Colors.teal,
                                child: InkWell(
                                  child: Image.network(
                                      "https://raw.githubusercontent.com/flutter/website/master/examples/_animation/radial_hero_animation/images/chair-alpha.png"),
                                  onTap: () {
                                    Navigator.of(context).pop();
                                  },
                                ),
                              )),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

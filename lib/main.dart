import 'package:flutter/material.dart';
import 'package:flutter_app/HeroAnimation.dart';
import 'package:flutter_app/HeroDemo.dart';
import 'package:flutter_app/animation.dart';
import 'package:flutter_app/hero_practice.dart';
import 'package:flutter_app/image.dart';
import 'package:flutter_app/inkwell.dart';
import 'package:flutter_app/phone.dart';
import 'package:flutter_app/radial_hero_animation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark(),
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        "phonePage": (BuildContext context) => PhonePage(),
        "imagePage": (BuildContext context) => ImagePage(),
        "AnimaitonPage": (BuildContext context) => AnimationPage(),
        "InkWellPage": (BuildContext context) => InkWellPage(),
        "HeroPage": (BuildContext context) => HeroPage(),
        "RadialExpansionPage": (BuildContext context) => RadialExpansionDemo(),
        "HeroAnimationPage": (BuildContext context) => HeroAnimation(),
        "HerpPracticePage": (BuildContext context) => HerpPracticePage(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool isSwitch = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          // Here we take ththod, and use it to set our appbar title.
          title: Text("主界面"),
        ),
        body: Column(
          children: [
            SwitchListTile(
              value: isSwitch,
              title: Text(isSwitch ? "开启路由" : "关闭路由"),
              onChanged: (value) {
                setState(() {
                  print("SZJ:${isSwitch}+${value}");
                  isSwitch = value;
                });
              },
            ),
            initButton(PhonePage(), "phonePage", "Phone页面"),
            initButton(ImagePage(), "imagePage", "Image页面"),
            initButton(AnimationPage(), "AnimaitonPage", "Animation页面"),
            initButton(InkWellPage(), "InkWellPage", "InkWell页面"),
            initButton(HeroPage(), "HeroPage", "Hero动画页面"),
            initButton(RadialExpansionDemo(), "RadialExpansionPage", "径向Hero动画"),
            initButton(HeroAnimation(), "HeroAnimationPage", "Hero动画(慕课网)"),
            initButton(HerpPracticePage(), "HerpPracticePage", "Hero动画练习"),
          ],
        )
        // This trailing comma makes auto-formatting nicer for build methods.
        );
  }

   initButton(Widget widgetPage, String title, lable) => RaisedButton(
        onPressed: () {
          if (isSwitch) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => widgetPage));
          } else {
            Navigator.pushNamed(context, title);
          }
        },
        child: Text(lable),
      );
}

import 'package:flutter/material.dart';
import 'package:flutter_app/image.dart';
import 'package:flutter_app/phone.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: MyHomePage(),
      routes: <String, WidgetBuilder>{
        "phonePage": (BuildContext context) => PhonePage(),
        "imagePage": (BuildContext context) => ImagePage(),
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

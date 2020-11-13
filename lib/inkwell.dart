import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InkWellPage extends StatefulWidget {
  @override
  _InkWellPageState createState() => _InkWellPageState();
}

class _InkWellPageState extends State<InkWellPage> {
  bool _isLight = true; //判断是否是夜间模式 true白天 false夜间

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: new ThemeData(
          fontFamily: "MaoTi", //设置全局字体

          brightness:
              _isLight == true ? Brightness.light : Brightness.dark //判断 夜间/白天模式
          ),
      home: Scaffold(
        body: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: [
              Ink(
                decoration: new BoxDecoration(
                  color: Colors.yellow,
                  borderRadius: new BorderRadius.circular(25),
                ),

                  child:   InkWell(
                    //可以不加
                    radius: 300,
                    highlightColor: Colors.teal,
                    //设置高亮颜色
                    // splashColor: Colors.black,
                    //水波纹形状
                    borderRadius: new BorderRadius.circular(25),
                    //------√------
                    onTap: () {

                      print('--单击--');
                    },
                    child: Container(
                      // color: Colors.yellow,这里的颜色不能加!!!
                      width: 200,
                      height: 50,
                      alignment: Alignment.center,
                      child: Text("InkWell"),
                    ),
                  ),


              ),

               Material(
                child: Ink(
                  decoration: new BoxDecoration(
                    color: Colors.red,
                    borderRadius: new BorderRadius.all(new Radius.circular(25)),
                  ),
                  child: InkWell(
                    focusColor: Colors.tealAccent,//没什么用
                    hoverColor: Colors.amber,//没什么用
                    radius: 300,
                    //获取焦点颜色
                    // highlightColor: Colors.teal, //设置高亮颜色
                    splashColor: Colors.black,
                    //水波纹形状
                    borderRadius: new BorderRadius.circular(25),
                    //------√------
                    onTap: () {
                      print('--单击--');
                    },
                    onDoubleTap: (){
                      print('--双击--');
                    },
                    onLongPress: (){
                      print('--长按--');
                    },
                    child: Container(
                      width: 200,
                      height: 50,
                      alignment: Alignment.center,
                      child: Text("InkWell"),
                    ),
                  ),
                ),
              ),

              //=========================

                Padding(
                padding: EdgeInsets.only(top: 30),
                child: new Ink(
                  //设置背景
                  decoration: new BoxDecoration(
                    color: Colors.purple,
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(25.0)),
                  ),
                  child: new InkResponse(
                    borderRadius:
                        new BorderRadius.all(new Radius.circular(25.0)),

                    //点击控件高亮时显示的控件在控件上层,水波纹下层，如果高亮颜色显示的话,水波纹只有在高亮状态下显示
                    //highlightColor: Colors.yellowAccent,  //高亮颜色
                    //点击或者toch控件高亮的shape形状
                    highlightShape: BoxShape.rectangle,
                    //  ----√----


                 /*  InkResponse内部的radius这个需要注意的是，
                    我们需要半径大于控件的宽，如果radius过小，显示的水波纹就是一个很小的圆，
                   */

                    //水波纹的半径
                    radius: 300.0,
                    //水波纹的颜色
                    splashColor: Colors.black,
                    //true表示要剪裁水波纹响应的界面   false不剪裁  如果控件是圆角不剪裁的话水波纹是矩形
                    containedInkWell: true,
                    //  ----√----
                    //点击事件
                    onTap: () {
                      //  ----√----
                      print("click");
                    },
                    child: new Container(
                      //不能在InkResponse的child容器内部设置装饰器颜色，
                      // 否则会遮盖住水波纹颜色的，containedInkWell设置为false就能看到是否是遮盖了。
                      width: 200.0,
                      height: 50.0,
                      //设置child 居中
                      alignment: Alignment(0, 0),
                      child: Text(
                        "InkResponse",
                        style: TextStyle(color: Colors.white, fontSize: 16.0),
                      ),
                    ),
                  ),
                ),
              ),

              //==================================================

             /*   Text(
                "我是测试Text的",
                style: TextStyle(fontFamily: "MaoTi"),
              ),*/

            /*  Padding(
                padding: EdgeInsets.only(top: 20),
                child: Ink(
                  decoration: BoxDecoration(
                    borderRadius: new BorderRadius.circular(25),
                    border: Border.all(color: Colors.black, width: 2),
                  ),
                  child: InkResponse(
                    borderRadius: BorderRadius.circular(25),
                    splashColor: Colors.tealAccent,
                    radius: 300,
                    //  ----√----
                    containedInkWell: true,
                    //  ----√----
                    highlightShape: BoxShape.rectangle,
                    //  ----√----
                    child: Container(
                      width: 200,
                      height: 50,
                      alignment: Alignment.center,
                      child: Text(
                        "切换主题",
                        //通过TextStyle中的fontFamily属性设置字体
                        style: TextStyle(fontFamily: "iconfont"),
                      ),
                    ),
                    onTap: () {
                      setState(() {
                        _isLight == true ? _isLight = false : _isLight = true;
                      });
                    },
                  ),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}



import 'package:flutter/material.dart';

class HerpPracticePage extends StatefulWidget {
  @override
  _HerpPracticePageState createState() => _HerpPracticePageState();
}

class _HerpPracticePageState extends State<HerpPracticePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hero动画练习"),
      ),
      body: Container(
        color: Colors.transparent,
        //左右排列布局

            child: InkWell(
          onTap: () {
            //跳转页面
            Navigator.of(context).push(initPageRouteBuilder());
          },
          child: Row(
            //主轴方向开始对齐 在这里是左对齐
            mainAxisAlignment: MainAxisAlignment.start,
            //交叉轴上开始对齐 在这里是顶部对齐
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //左侧图片
              initLeftIcon(),
              //右侧文字
              initRightTxt(),
            ],
          ),
        )),
    );
  }

  /**
   * 左侧图片
   */
  Widget initLeftIcon() {
    return Container(
      child: Hero(
        tag: "HeroPractice",
        child: Image.network(
          "https://raw.githubusercontent.com/flutter/website/master/examples/_animation/hero_animation/images/flippers-alpha.png",
          width: 150,
          height: 80,
        ),
      ),
    );
  }

  /**
   * 右侧文字
   */
  Widget initRightTxt() {
    //建议使用Expanded包裹,这样防止上下布局Text文本溢出导致错误!
    return Expanded(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text("今天礼拜六"),
        Text("我在公司认真的学习flutter,正在学习Hero动画,有点难,不过我会克服的!!"),
      ],
    ));
  }

  /**
   * 透明动画
   */
  Widget initFadeTransition(Animation<double> animation, Widget child) {
    return FadeTransition(
      opacity: Tween(begin: 0.0, end: 1.0).animate(CurvedAnimation(
        parent: animation,
        curve: Curves.linear,
      )),
      child: child,
    );
  }

  /**
   * 初始化跳转页面参数
   */
  Route<Object> initPageRouteBuilder() {
    return PageRouteBuilder(
      pageBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation) {
        //设置跳转到的页面
        return JumpPage();
      },
      //打开新页面的时间
      transitionDuration: Duration(seconds: 2),
      //关闭页面的时间
      reverseTransitionDuration: Duration(seconds: 2),
      //跳转页面的动画
      transitionsBuilder: (BuildContext context, Animation<double> animation,
          Animation<double> secondaryAnimation, Widget child) {
        //跳转动画
        return initFadeTransition(animation, child);
      },
    );
  }
}

class JumpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("这是跳转页面"),
      ),
      body: initJumpPageBody(context),
    );
  }

  /**
   * JumpPage的Body布局
   */
  initJumpPageBody(BuildContext context) {
    return Container(
      child: Column(
        children: [
          //图片
          initJumpIcon(context),
          //文本
          initJumpTxt(context),
        ],
      ),
    );
  }

  /**
   * 初始化Jump图片布局
   */
  initJumpIcon(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).pop();
      },
      child: Hero(
        tag: "HeroPractice",
        child: Image.network(
          "https://raw.githubusercontent.com/flutter/website/master/examples/_animation/hero_animation/images/flippers-alpha.png",
          width: 300,
          height: 160,
        ),
      ),
    );
  }

  initJumpTxt(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Text(
        "我在公司认真的学习flutter,正在学习Hero动画,有点难,不过我会克服的!!",
      ),
    );
  }
}

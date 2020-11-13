import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  AnimationController _mAnimationController;
  Animation<double> _mAnimation;
  Animation<Color> _mAnimationColor;
  double _mAnimationValue;
  AnimationStatus _mAnimationStaus;

  @override
  void initState() {
    //初始刷Controller设置执行时间
    _mAnimationController = new AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    );
    //设置变化区间 并监听
    _mAnimation = new Tween<double>(begin: 0, end: 200)
        //执行曲线 类似于android中的插值器Interpolator 默认Curves.linear
        .chain(new CurveTween(curve: Curves.bounceIn))
        //添加动画控制器
        .animate(_mAnimationController);

    _mAnimationColor =
        new ColorTween(begin: Colors.amber, end: Colors.tealAccent)
            .animate(_mAnimationController);

    /*   _mAnimation.addListener(() {
            setState(() {
              print('_mAnimationValue:${_mAnimationValue}');
              _mAnimationValue = _mAnimation.value;
            });
          });
    _mAnimation.addStatusListener((status) {
            setState(() {
              print('status:${status}');
              _mAnimationStaus = status;
            });
          });*/
    /**
     * addStatusListener 用來监听动画当前状态
     *  dismissed  动画在开始处停止。
     *  forward,   动画从头到尾都在运行。
     *  reverse     动画正在向后运行，从头到尾。
     *  completed   动画在结尾处停止。
     */

    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    //资源回收
    _mAnimationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animaiton"),
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                //重置
                _mAnimationController.reset();
                //开始
                _mAnimationController.forward();
              },
              child: Text(
                "开始",
                style: TextStyle(fontSize: 25),
              ),
            ),
            Container(
              width: _mAnimationValue,
              height: _mAnimationValue,
              child: FlutterLogo(),
            ),

            //----------------AnimatedWidget Double start ------------------

            AnimationWidget(
              animaitonDouble: _mAnimation,
              isColor: false,
            ),
            //----------------AnimatedWidget Double stop ------------------


            AnimationWidget(
              animaitonColor: _mAnimationColor,
              isColor: true,
            ),



            //----------------AnimatedBuilder  start ------------------
           AnimatedBuilder(
              child: Container(
                color: Colors.yellow,
                width: 100,
                height: 100,
                child: FlutterLogo(),
              ),
              builder: (BuildContext context, Widget child) {
                return Container(
                  width: _mAnimation.value + 100,
                  height: _mAnimation.value + 100,
                  child: child,
                );
              },
              animation: _mAnimation,
            )
            //----------------AnimatedBuilder  stop ------------------
          ],
        ),
      ),
    );
  }
}

class AnimationWidget extends AnimatedWidget {

  //isColor true是Animation<Color>类型
  //        false 是Animation<double>类型
  bool isColor;

  AnimationWidget(
      {Key key,
      Animation<Color> animaitonColor,
      Animation<double> animaitonDouble,
      @required this.isColor})
      : super(key: key, listenable:isColor == true? animaitonColor :animaitonDouble);

  Animation<Color> _mAnimationColor;
  Animation<double> _mAnimationDouble;

  @override
  Widget build(BuildContext context) {
    //通过父类方法listenable来获取Animation<double>对象
    if (isColor) {
      _mAnimationColor = listenable;
    } else {
      _mAnimationDouble = listenable;
    }

    return isColor == true
        ? Container(
            width: 100,
            height: 100,
            color: _mAnimationColor.value,
            child: FlutterLogo(),
          )
        : Container(
            width: _mAnimationDouble.value,
            height: _mAnimationDouble.value,
            child: FlutterLogo(),
          );
  }
}

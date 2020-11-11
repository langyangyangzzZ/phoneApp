import 'package:flutter/material.dart';

class AnimationPage extends StatefulWidget {
  @override
  _AnimationPageState createState() => _AnimationPageState();
}

class _AnimationPageState extends State<AnimationPage>
    with SingleTickerProviderStateMixin {
  AnimationController _mAnimationController;
  Animation<Color> _mAnimation;
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
    // _mAnimation = new Tween<double>(begin: 0, end: 200)
    //     //执行曲线 类似于android中的插值器Interpolator 默认Curves.linear
    //     .chain(new CurveTween(curve: Curves.linear))
    //     //添加动画控制器
    //     .animate(_mAnimationController);

    _mAnimation = new ColorTween(begin: Colors.amber, end: Colors.tealAccent)
        .animate(_mAnimationController);

    /* ..addListener(() {
            setState(() {
              print('_mAnimationValue:${_mAnimationValue}');
              _mAnimationValue = _mAnimation.value;
            });
          })
          ..addStatusListener((status) {
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
    print('Colorbuild:${_mAnimation.value}');

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
              child: Text("开始"),
            ),
            AnimationWidget(animaiton: _mAnimation),

            AnimatedBuilder(
              child: Container(
                width: 100,
                height: 100,
                child: Text("123",style: TextStyle(color: _mAnimation.value),),
              ),
              builder: (BuildContext context, Widget child) {
                return Container(
                  width: 100,
                  height: 100,
                  color: _mAnimation.value,
                  child: child,
                );
              },
              animation: _mAnimation,
            )
          ],
        ),
      ),
    );
  }
}

class AnimationWidget extends AnimatedWidget {
  // ignore: missing_required_param
  AnimationWidget({Key key, Animation<Color> animaiton})
      : super(key: key, listenable: animaiton);

  @override
  Widget build(BuildContext context) {
    Animation<Color> _mAnimation = listenable;

    return Container(
      width: 100,
      height: 100,
      color: _mAnimation.value,
      child: FlutterLogo(),
    );
  }
}

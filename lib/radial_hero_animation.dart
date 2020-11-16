import 'dart:math' as math;

import 'package:flutter/material.dart';

//图片样式
class Photo extends StatelessWidget {
  Photo({Key key, this.photo, this.color, this.onTap}) : super(key: key);

  final String photo;
  final Color color;
  final VoidCallback onTap;

  Widget build(BuildContext context) {
    return Material(
      // Slightly opaque color appears where the image has transparency.
      //图片背景色
      color: Theme.of(context).primaryColor.withOpacity(0.25),
      child: InkWell(
          onTap: onTap,
          child: Image.network(
            photo,
            fit: BoxFit.contain,
          ) /*child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints size) {
            print('SZJ1114MinWidth:${size.minWidth}+ MinHeight${size.maxHeight}+MaxWidth${size.maxWidth}+maxHeight${size.maxHeight}');
            return Image.network(
              photo,
              fit: BoxFit.contain,
            );
          },
        ),*/
          ),
    );
  }
}

class RadialExpansion extends StatelessWidget {
  RadialExpansion({
    Key key,
    this.maxRadius,
    this.child,
  })  : //求大圆宽度 2的平方根 乘2  maxRadius = 132    math.sqrt2 =  1.4142135623730951
        clipRectSize = 2.0 * (maxRadius / math.sqrt2),
        super(key: key);

  final double maxRadius;
  final clipRectSize;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    print('SZJ1116clipRectSize:${clipRectSize}');
    return ClipOval(
        child: Container(
            alignment: Alignment.center,
            color: Colors.amber,
            child: SizedBox(
              width: clipRectSize,
              height: clipRectSize,
              child: ClipRect(
                child: child,
              ),
            ),
    ));
  }
}

class RadialExpansionDemo extends StatelessWidget {
  //小圆宽度
  static const double kMinRadius = 32.0;

  //大圆宽度
  static const double kMaxRadius = 128.0;
  static const opacityCurve =
      const Interval(0.0, 0.75, curve: Curves.fastOutSlowIn);

  static RectTween _createRectTween(Rect begin, Rect end) {
    return MaterialRectCenterArcTween(begin: begin, end: end);
  }

  static Widget _buildPage(
      BuildContext context, String imageName, String description) {
    return Container(
      //跳转页面底色
      color: Theme.of(context).canvasColor,
      child: Center(
        child: Card(
          elevation: 8.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: kMaxRadius * 2.0,
                height: kMaxRadius * 2.0,
                child: Hero(
                  createRectTween: _createRectTween,
                  tag: imageName,
                  child: RadialExpansion(
                    maxRadius: kMaxRadius,
                    child: Photo(
                      photo: imageName,
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                ),
              ),
              Text(
                description,
                style: TextStyle(fontWeight: FontWeight.bold),
                textScaleFactor: 3.0,
              ),
              const SizedBox(height: 16.0),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHero(
      BuildContext context, String imageName, String description) {
    return Container(
      //小圆宽度
      width: kMinRadius * 2.0,
      height: kMinRadius * 2.0,
      child: Hero(
        createRectTween: _createRectTween,
        tag: imageName,
        child: RadialExpansion(
          maxRadius: kMaxRadius,
          child: Photo(
            photo: imageName,
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder<void>(
                  pageBuilder: (BuildContext context,
                      Animation<double> animation,
                      Animation<double> secondaryAnimation) {
                    return AnimatedBuilder(
                        animation: animation,
                        builder: (BuildContext context, Widget child) {
                          return Opacity(
                            opacity: opacityCurve.transform(animation.value),
                            child: _buildPage(context, imageName, description),
                          );
                        });
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Radial Transition Demo'),
      ),
      body: Container(
        padding: const EdgeInsets.all(32.0),
        alignment: Alignment.bottomLeft,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildHero(
                context,
                'https://raw.githubusercontent.com/flutter/website/master/examples/_animation/radial_hero_animation/images/chair-alpha.png',
                'Chair'),
            _buildHero(
                context,
                'https://raw.githubusercontent.com/flutter/website/master/examples/_animation/radial_hero_animation/images/binoculars-alpha.png',
                'Binoculars'),
            _buildHero(
                context,
                'https://raw.githubusercontent.com/flutter/website/master/examples/_animation/radial_hero_animation/images/beachball-alpha.png',
                'Beach ball'),
          ],
        ),
      ),
    );
  }
}

import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class ImagePage extends StatefulWidget {
  @override
  _ImagePageState createState() => _ImagePageState();
}

class _ImagePageState extends State<ImagePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Image"),
        ),
        body: ListView(
          children: [
            Column(
              children: [
             CachedNetworkImage(

                      placeholder: (context, url) {
                        return CircularProgressIndicator(
                          backgroundColor: Colors.greenAccent,
                          valueColor: AlwaysStoppedAnimation(Colors.red),
                        );
                      },
                      imageUrl:
                      "https://image.springup9.com/image/20200805/epcyoisqmm80000000.jpeg",
                      //无网络下载图片使用默认图片
                      errorWidget: (context, url, android) {
                        print('CachedNetworkImage${url}');
                        return Icon(Icons.android);
                      }),


                //下载网络图片
                Image.network(
                  "https://www.devio.org/img/avatar.png",
                  width: 100,
                  height: 100,
                ),
                //设置资源图片
                Image.asset(
                  "images/panda.jpeg",
                  width: 150,
                  height: 150,
                ),
                //设置本地图片
                Image.file(
                  new File(
                      "/data/user/0/com.example.flutter_app/cache/image_picker5478558919946394496.jpg"),
                  width: 100,
                  height: 100,
                ),
                //下载网络图片到本地,使用透明属性kTransparentImage,从透明到不透明动画显示 不支持.jpg图片
                Container(
                  color: Colors.black,
                  child: FadeInImage.memoryNetwork(
                    width: 200,
                    height: 200,
                    fit: BoxFit.none,
                    alignment: Alignment.centerRight,
                    //从内存中加载图片
                    placeholder: kTransparentImage,
                    //依赖transparent_image: ^1.0.0
                    image: 'https://www.devio.org/img/avatar.png',
                  ),
                ),

                //下载网络图片到本地,使用本地的图片作为站位图 不支持.jpg图片
                FadeInImage.assetNetwork(
                  width: 140,
                  height: 100,
                  alignment: Alignment.bottomLeft,
                  fit: BoxFit.fill,
                  placeholder: 'images/panda.jpeg',
                  image: 'https://www.devio.org/img/avatar.png',
                ),
                //从网络下载图片缓存到本地 不支持.jpg图片 添加依赖cached_network_image: ^2.3.3
              ],
            ),
          ],
        ));
  }

}

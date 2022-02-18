import 'package:flutter/material.dart';

class MyLayout extends StatelessWidget {
  const MyLayout({Key? key}) : super(key: key);

  /// 你可以在外面定义一个Weight变量，
  static Widget left = Container(
    decoration: BoxDecoration(
      color: Colors.lightBlue[400]
    ),
    child: Column(
      children: const [
        Text("草莓冰淇淋"),
        Text("草莓冰淇淋，不仅带给人们唇齿之间最滑润的味觉享受，还能给都市白领、浪漫情侣带来时尚的冰酷体验，也能给孩子们带来童话般的温馨滋味，更能给追求健康长寿的中老年人带来全新的养生感受。"),
      ],
    ),
  );

  /// 你可以在外面定义一个返回Weight的方法
  static Widget add (String name) {
    return Text(name);
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        left,
        add("name")
      ],
    );
  }
}

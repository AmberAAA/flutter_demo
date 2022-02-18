import 'dart:ffi';

import 'package:flutter/material.dart';

class Strawberry extends StatelessWidget {
  const Strawberry({Key? key}) : super(key: key);

  /// 右边的图片
  Widget _rightImg() {
    return Image.asset("images/strawberry.jpg");
  }

  /// 生成评分的ICON [number] 0 -5 分
  Row _genStarts(int number) {
    List<Widget> lint = [];
    for (int i = 0; i < number; i++) {
      lint.add(const Icon(Icons.star, color: Colors.black));
    }
    for (int i = lint.length; i < 5; i++) {
      lint.add(const Icon(Icons.star, color: Colors.black45));
    }
    return Row(
      children: lint,
    );
  }

  /// 评分部分
  Widget _star() {
    return Row(
      children: [
        _genStarts(3),
        const Text(
          "170 Reviews",
          style: TextStyle(fontWeight: FontWeight.w600),
        )
      ],
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    );
  }

  Widget _leftContainer() {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Strawberry Pavlova",
              overflow: TextOverflow.visible,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
              )),
          const Text(
            "This beautiful dessert, a favourite recipe of Teeswater egg farmers Peter and Adriana Van Zeeland, is perfect for any occasion.",
            softWrap: false,
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            maxLines: 10,
          ),
          _star()
        ]);
  }

  Widget _infoItem(IconData icon, String title, String value) {
    return Column(children: [
      Icon(icon, color: Colors.lightGreen,),
      Text(title),
      Text(value),
    ]);
  }

  Widget _info() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
      _infoItem(Icons.menu_open, "PERP", "25 min"),
      _infoItem(Icons.lock_clock, "PERP", "25 min"),
      _infoItem(Icons.restaurant, "PERP", "25 min"),
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: _leftContainer(),
            flex: 2,
          ),
          Expanded(
            child: _rightImg(),
            flex: 1,
          )
        ],
      ),
      Container(
        margin: const EdgeInsets.fromLTRB(0, 8, 0, 0),
        child: _info(),
      )
    ],);
  }
}

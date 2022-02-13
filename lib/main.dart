import 'package:flutter/material.dart';
import 'package:hello_flutter/demo/handing_gestures.dart';
import 'package:hello_flutter/demo/shopping_list.dart';

void main() {
  runApp(const MaterialApp(
    title: "Material App",
    home: MyAppHome(),
  ));
}

class MyAppHome extends StatelessWidget {
  const MyAppHome({Key? key}) : super(key: key);

  void add() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const IconButton(
          icon: Icon(Icons.menu),
          onPressed: null,
          tooltip: "Hello World!",
        ),
        title: const Text("Index"),
        actions: const [IconButton(onPressed: null, icon: Icon(Icons.search))],
      ),
      body: Center(
        child: ShoppingListItem(
          product: const Product(name: "Amber"),
          inCart: true,
          onCartChange: (p, b) {
          },
        ),
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        tooltip: "Add",
        child: Icon(Icons.add),
      ),
    );
  }
}
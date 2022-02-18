import 'package:flutter/material.dart';
import 'package:hello_flutter/demo/handing_gestures.dart';
import 'package:hello_flutter/demo/shopping_list.dart';
import 'package:hello_flutter/demo/strawberry.dart';
import 'package:hello_flutter/demo/todo_list.dart';

void main() {
  runApp(MaterialApp(
    title: "Material App",
    initialRoute: '/',
    routes: {
      '/': (context) => const MyAppHome(),
      '/strawberry': (context) => const Strawberry(),
      '/todo': (context) => const TodoListPage(),
    },
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
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/strawberry");
                },
                child: const Text("布局DEMO")),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, "/todo");
                },
                child: const Text("TODO LIST"))
          ],
        ),
      ),
    );
  }
}

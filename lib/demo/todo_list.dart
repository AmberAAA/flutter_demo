import 'package:english_words/english_words.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class TodoListPage extends StatelessWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TODO LIST"),
      ),
      body: const TodoList(),
    );
  }
}

class Todo {
  Todo(this.name, this.isStar, this.isFinish);

  final String name;
  bool isStar;
  bool isFinish;
}

typedef TodoChange = void Function(Todo);

class TodoItemView extends StatelessWidget {
  const TodoItemView({required this.todo, required this.onChange, Key? key})
      : super(key: key);

  final Todo todo;

  final TodoChange onChange;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Checkbox(
                value: todo.isFinish,
                onChanged: (v) {
                  todo.isFinish = v!;
                  onChange(todo);
                }),
            Expanded(child: Text(todo.name)),
            IconButton(
                onPressed: () {
                  todo.isStar = !todo.isStar;
                  onChange(todo);
                },
                icon: todo.isStar
                    ? Icon(Icons.star,
                        color: Theme.of(context).colorScheme.secondary)
                    : const Icon(Icons.star_outline))
          ],
        ),
        Positioned(
          child: SizedBox(
            child: ElevatedButton(onPressed: () {}, child: const Text("删除")),
            width: 100,
          ),
          left: -100,
        ),
      ],
    );
  }
}

class TodoList extends StatefulWidget {
  const TodoList({Key? key}) : super(key: key);

  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  Todo todo = Todo("Todo", true, false);

  List<Todo> todos = genTodoList();

  static List<Todo> genTodoList() {
    List<Todo> list = [];
    var random = Random();
    for (int i = 0; i < 10; i++) {
      list.add(Todo(WordPair.random().asPascalCase, random.nextBool(),
          random.nextBool()));
    }
    return list;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: List.from(todos.map((element) {
        return TodoItemView(
            todo: element,
            onChange: (todo) {
              setState(() {
                element = todo;
              });
            });
      })),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_application_1/SettingsPage.dart';
import 'package:flutter_application_1/add_/add_page.dart';
import 'package:flutter_application_1/home/todo_tile.dart';
import 'package:flutter_application_1/todo.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Todo> _todoList = [
    Todo(
      id: 1,
      title: "Сделать домашнее задание",
      date: "20.01.2026",
      isDone: false,
    ),
    Todo(id: 2, title: "Купить телефон", date: "27.01.2026", isDone: true),
  ];

void _editTask(int index) async {
  final result = await Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => AddTodoPage(
        initialText: _todoList[index].title,
      ),
    ),
  );

  if (result != null && result.isNotEmpty) {
    setState(() {
      _todoList[index].title = result;
    });
  }
}

  void _navigateToAddTodoPage() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AddTodoPage()),
    );

    if (result != null && result.isNotEmpty) {
      setState(() {
        _todoList.add(
          Todo(
            id: _todoList.length + 1,
            title: result,
            date: "Сегодня",
            isDone: false,
          ),
        );
      });
    }
  }

  // 🔹 Переключение состояния задачи
  void toggleTask(int index, bool value) {
    setState(() {
      _todoList[index].isDone = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title:  Text("Мои задачи",
        style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
                ),
    actions: [
      IconButton(
        icon: const Icon(Icons.settings),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => const SettingsPage(),
            ),
          );
        },
      ),
    ],
  ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
            children: [
              const SizedBox(height: 10),
              Container(height: 1, color: Colors.black26),
              const SizedBox(height: 18),
              Expanded(
                child: ListView.separated(
                  itemCount: _todoList.length,
                  separatorBuilder: (_, __) => const SizedBox(height: 14),
                  itemBuilder: (context, index) {
                    final todoItem = _todoList[index];

                    return GestureDetector(
                      onTap: () {
                        _editTask(index);
                      },
                      child: TodoTile(
                        title: todoItem.title,
                        dateText: todoItem.date,
                        isDone: todoItem.isDone,
                        onChanged: (value) {
                          toggleTask(index, value);
                        },
                      ),
                    );
                  },
                ),
              ),

              const SizedBox(height: 14),

              SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton.icon(
                  onPressed: _navigateToAddTodoPage,
                  icon: const Icon(Icons.add),
                  label: const Text(
                    'Добавить задачу',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0A72FF),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

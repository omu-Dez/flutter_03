
import 'dart:async';

import 'package:flutter/material.dart';

class AddTodoPage extends StatefulWidget{
  const AddTodoPage({super.key});

  @override
  State<StatefulWidget> createState() => _AddTodoPage();
}

class _AddTodoPage extends State<AddTodoPage> {
  TextEditingController _textEditingController = TextEditingController();
  late Timer _timer;
  
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print("AddTodoPage - initState");
    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      final date = DateTime.now();
      print("${date.minute}:${date.second}");
    });
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    print("AddTodoPage - didChangeDependecies");
  }

  @override
  Widget build(BuildContext context) {
    print("AddTodoPage - build");
     return Scaffold(
      body: SafeArea(
        child: Padding(padding: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          children: [
            const SizedBox(height: 10),
              const Text(
                'Новая задача',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 10),
              Container(height: 1, color: Colors.black26),
              const SizedBox(height: 18),

                    TextField(
                      controller: _textEditingController,
                        decoration: InputDecoration(
            hintText: 'Введите текст',
            filled: true,
            fillColor: const Color(0xFFEDEDED), // серый фон
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.black,
                width: 1.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.black,
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(
                color: Colors.black,
                width: 2,
              ),
            ),
          ),
          ),
           const Spacer(),
           SizedBox(
                width: double.infinity,
                height: 60,
                child: ElevatedButton.icon(
                  onPressed: () {
                   () => ();
                  },
                  label: const Text(
                    'Сохранить',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF0A72FF),
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                ),
              ),
              const SizedBox(height: 16)
          ],
        ),
        ),
        ),
    );
  }

  @override
  void didUpdateWidget(covariant AddTodoPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
    print("AddTodoPage - didUpdateWidget");
  }

  @override
  void deactivate() {
    // TODO: implement deactivate
    super.deactivate();
    print("AddTodoPage - deactivate");
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    //Закрывать все фоновые задачи
    print("AddTodoPage - dispose");
    _timer.cancel();
    _textEditingController.dispose();
  }
}
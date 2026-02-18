import 'package:flutter/material.dart';
import 'package:flutter_application_1/Control/todo.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Todo> cards = [
    Todo(color: Colors.blue),
    Todo(color: Colors.red),
    Todo(color: Colors.blue),
    Todo(color: Colors.red),
  ];

  int? firstIndex;
  int mistakes = 0;
  String message = "";
  bool isChecking = false;

  void onTap(int index) async {
    if (mistakes >= 2) return;
    if (cards[index].isOpened || cards[index].isMatched) return;
    if (isChecking) return;

    setState(() {
      cards[index].isOpened = true;
    });

    if (firstIndex == null) {
      firstIndex = index;
      return;
    }

    int secondIndex = index;
    isChecking = true;

    if (cards[firstIndex!].color == cards[secondIndex].color) {
      setState(() {
        cards[firstIndex!].isMatched = true;
        cards[secondIndex].isMatched = true;
        message = "Успешно";
      });
    } else {
      mistakes++;

      if (mistakes >= 2) {
        setState(() {
          message = "У вас не осталось попыток";
        });
      } else {
        await Future.delayed(const Duration(seconds: 2));
        setState(() {
          cards[firstIndex!].isOpened = false;
          cards[secondIndex].isOpened = false;
          message = "";
        });
      }
    }

    firstIndex = null;
    isChecking = false;
  }

  Color getColor(int index) {
    if (!cards[index].isOpened && !cards[index].isMatched) {
      return Colors.white;
    }
    return cards[index].color;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Найдите пару")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Wrap(
            spacing: 20,
            runSpacing: 20,
            alignment: WrapAlignment.center,
            children: List.generate(4, (index) {
              return GestureDetector(
                onTap: () => onTap(index),
                child: Container(
                  width: 120,
                  height: 140,
                  decoration: BoxDecoration(
                    color: getColor(index),
                    border: Border.all(color: Colors.black26),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              );
            }),
          ),
          const SizedBox(height: 40),
          Text(
            message,
            style: TextStyle(
              fontSize: 18,
              color: message.contains("не осталось")
                  ? Colors.red
                  : Colors.green,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

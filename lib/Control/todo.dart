import 'package:flutter/material.dart';

class Todo {
  final Color color;
  bool isOpened;
  bool isMatched;

  Todo({
    required this.color,
    this.isOpened = false,
    this.isMatched = false,
  });
}
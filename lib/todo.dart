
class Todo {
  int id;
  String title;
  String date;
  bool isDone;

  Todo({required this.id,
    required this.title,
    required this.date,
    required this.isDone,});
}

class ColorRgb {
  final int r;
  final int g;
  final int b;
  final int alpha;

  const ColorRgb({required this.r, required this.b, required this.g, required this.alpha});
}
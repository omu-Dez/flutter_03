class Todo {
  int id;
  String title;
  String description;  
  String date;
  bool isDone;

  Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.date,
    required this.isDone,
  });

  Todo copyWith({
    int? id,
    String? title,
    String? description,
    String? date,
    bool? isDone,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
      date: date ?? this.date,
      isDone: isDone ?? this.isDone,
    );
  }
}
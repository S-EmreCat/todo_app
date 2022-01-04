class Todo {
  int? id;
  String? title;
  String? description;
  String? day;
  bool? isDone;
  Todo({
    required this.title,
    required this.description,
    required this.day,
    required this.isDone,
  });

  Todo.withId(
      {required this.id,
      required this.title,
      required this.description,
      required this.day,
      required this.isDone});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    if (isDone == null) {
      throw ("isDone is null");
    } else if (isDone == true) {
      map['isDone'] = 1;
    } else {
      map['isDone'] = 0;
    }
    return map;
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
        title: map['title'],
        description: map['description'],
        day: map['day'],
        isDone: map['isDone'] == 1);
  }
}

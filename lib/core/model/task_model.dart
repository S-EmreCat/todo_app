class Todo {
  int id;
  String title;
  String description;
  String day;
  bool isDone;
  String taskType;
  Todo({
    required this.id,
    required this.title,
    required this.description,
    required this.day,
    required this.isDone,
    required this.taskType,
  });

  Map<String, dynamic> toMap() {
    Map<String, dynamic> map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['description'] = description;
    map['day'] = day;
    map['isDone'] = isDone;
    map['taskType'] = taskType;
    return map;
  }

  factory Todo.fromMap(Map<String, dynamic> map) {
    return Todo(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      day: map['day'],
      isDone: map['isDone'],
      taskType: map['taskType'],
    );
  }
}

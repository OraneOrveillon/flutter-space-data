import 'package:http/http.dart';
import 'dart:convert';

import '../model/body_type.dart';
import '../model/gallery.dart';

void main() async {
  var response =
      await get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));
  final List<dynamic> bodyData = json.decode(response.body);

  var myToDosParsed = [];

  for (var toDo in bodyData) {
    ToDoModel task = ToDoModel.fromJson(toDo);
    myToDosParsed.add(task);
  }

  print(myToDosParsed.toString());
}

class ToDoModel {
  int userId;
  int id;
  String title;
  bool completed;

  ToDoModel(
      {required this.userId,
      required this.id,
      required this.title,
      required this.completed});

  factory ToDoModel.fromJson(Map<String, dynamic> data) {
    return ToDoModel(
        userId: data["userId"],
        id: data["id"],
        title: data["title"],
        completed: data["completed"]);
  }

  @override
  String toString() {
    return '[$userId, $id, $title, $completed]';
  }
}

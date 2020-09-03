import 'dart:convert';
import 'package:flutter/material.dart';
import '../models/todo.dart';
import 'package:http/http.dart' as http;

class TodoProvider with ChangeNotifier {

    TodoProvider() {
        this.fetchTasks();
    }

    List<Todo> _todos = []; //private variable

    List<Todo> get todos {
      return [..._todos];
    }

    fetchTasks() async {
        final url = "http://127.0.0.1:8000/apis/v1/?format=json";
        final response = await http.get(url);
        if (response.statusCode == 200) {
            var data = json.decode(response.body) as List;
            _todos = data.map<Todo>((myjson) => Todo.fromJson(myjson)).toList();
        }
    }
}
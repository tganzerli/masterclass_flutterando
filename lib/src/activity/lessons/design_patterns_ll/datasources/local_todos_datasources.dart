import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

const TODOS = 'TODOS';

class LocalTodosDatasource {
  Future<List> getAllTodos() async {
    final shared = await SharedPreferences.getInstance();
    final jasonString = shared.getString(TODOS);

    return jsonDecode(jasonString ?? '[]');
  }

  Future<void> saveTodos(dynamic json) async {
    final shared = await SharedPreferences.getInstance();
    shared.setString(TODOS, jsonEncode(json));
  }
}

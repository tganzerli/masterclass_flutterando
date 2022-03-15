import 'package:dio/dio.dart';

import '../models/todo_model.dart';

class RemouteTodosDatasource {
  final dio = Dio();
  String url =
      'https://oe3xchofgemgrii-appget.adb.us-ashburn-1.oraclecloudapps.com/ords/appget/todo/';
  Future<dynamic> getAllTodos() async {
    List data = [];
    bool next = true;
    String _url = url;

    while (next) {
      final response = await dio.get(_url);
      data.addAll(response.data['items']);
      next = false;
      for (var element in response.data['links']) {
        if (element['rel'] == 'next') {
          _url = element['href'];
          next = true;
        }
      }
    }
    return data;
  }

  void post(TodoModel todoModel) async {
    await dio.post(url, data: todoModel.toJson());
  }

  void put(TodoModel todoModel, int id) async {
    await dio.put('$url$id', data: todoModel.toJson());
  }
}

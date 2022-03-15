class TodoModel {
  final int id;
  final String title;
  final bool isChecked;
  TodoModel({
    required this.id,
    required this.title,
    required this.isChecked,
  });

  int _changeForInt(bool isChecked) {
    if (isChecked) {
      return 1;
    } else {
      return 0;
    }
  }

  factory TodoModel.fromJson(dynamic jason) {
    changeForBool(int item) {
      if (item == 0) {
        return false;
      } else {
        return true;
      }
    }

    return TodoModel(
        id: jason['todo_id'],
        title: jason['todo_title'],
        isChecked: changeForBool(jason['todo_ischecked']));
  }

  Map<String, dynamic> toJson() =>
      {'todo_title': title, 'todo_ischecked': _changeForInt(isChecked)};
}

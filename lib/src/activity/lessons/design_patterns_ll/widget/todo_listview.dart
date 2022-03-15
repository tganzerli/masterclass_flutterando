import 'package:flutter/material.dart';

import '../models/todo_model.dart';
import '../stores/todo_store.dart';
import 'custom_todo_box.dart';

class TodoListView extends StatefulWidget {
  final List<TodoModel> todoList;
  const TodoListView({
    Key? key,
    required this.todoList,
  }) : super(key: key);

  @override
  State<TodoListView> createState() => _TodoListViewState();
}

class _TodoListViewState extends State<TodoListView> {
  final GlobalKey<AnimatedListState> listKey = GlobalKey<AnimatedListState>();
  TodoStore todoStore = TodoStore();

  @override
  void initState() {
    todoStore.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.center,
        child: AnimatedList(
          key: listKey,
          initialItemCount: widget.todoList.length,
          itemBuilder: (context, index, animation) {
            TodoModel todoModel = widget.todoList[index];
            return slideCustomTodoBoxTodo(context, index, animation, todoModel);
          },
        ));
  }

  Widget slideCustomTodoBoxTodo(
      BuildContext context, int index, animation, TodoModel todoModel) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: const Offset(0, 0),
      ).animate(animation),
      child: GestureDetector(
        onTap: () {
          listKey.currentState!.removeItem(
              index,
              (_, animation) =>
                  slideCustomTodoBoxTodo(context, index, animation, todoModel),
              duration: const Duration(milliseconds: 500));
          todoStore.chengeItem(
              index, todoModel.id, todoModel.title, !todoModel.isChecked);
          setState(() {});
        },
        child: CustomTodoBox(
          title: todoModel.title,
          isChecked: todoModel.isChecked,
        ),
      ),
    );
  }
}

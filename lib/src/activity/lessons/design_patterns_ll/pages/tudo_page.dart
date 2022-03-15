import 'package:flutter/material.dart';
import 'package:masterclass_flutterando/src/theme/appbar.dart';

import '../models/todo_model.dart';
import '../services/hero_dialog_route.dart';
import '../stores/todo_store.dart';
import '../widget/custom_add_todo_card.dart';
import '../widget/custom_todo_box.dart';
import '../widget/custom_todo_button.dart';

class TodoPage extends StatefulWidget {
  const TodoPage({Key? key}) : super(key: key);

  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final GlobalKey<AnimatedListState> listKeyDo = GlobalKey<AnimatedListState>();
  final GlobalKey<AnimatedListState> listKeyDone =
      GlobalKey<AnimatedListState>();
  var controller = TextEditingController();
  TodoStore todoStore = TodoStore();

  @override
  void initState() {
    todoStore.getAllTodos().whenComplete(() {
      setState(() {});
    });
    todoStore.addListener(() {
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: 'Lista de To Do'),
      body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height - 48,
          alignment: Alignment.center,
          padding: const EdgeInsets.all(14),
          child: todoStore.getTodoAllList().isNotEmpty
              ? Column(
                  children: [
                    Row(
                      children: [
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: CustomTodoButton(
                            title: 'To Do',
                            selected: todoStore.getButtonTodoWasSelected(),
                            onTap: () => todoStore.chengeList(),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: CustomTodoButton(
                            title: 'Feitos',
                            selected: !todoStore.getButtonTodoWasSelected(),
                            onTap: () => todoStore.chengeList(),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                        Hero(
                          tag: 'addTodo',
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(HeroDialogRoute<void>(
                                  builder: (context) => Center(
                                        child: CustomAddTodoCard(
                                          controller: controller,
                                          onChanged: todoStore.setNewTodo,
                                          onTap: () {
                                            todoStore.addTodo();
                                            controller.clear();
                                            Navigator.of(context).pop();
                                          },
                                        ),
                                      )));
                            },
                            child: Container(
                              height: 45,
                              width: 45,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).cardColor,
                                  borderRadius: BorderRadius.circular(23)),
                              child: Icon(
                                Icons.add,
                                color: Theme.of(context).highlightColor,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Expanded(
                      child: AnimatedCrossFade(
                        duration: const Duration(milliseconds: 500),
                        firstChild: ListView.separated(
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: todoStore.getTodoLis().length,
                          itemBuilder: (context, index) {
                            TodoModel todoModel = todoStore.getTodoLis()[index];
                            return GestureDetector(
                              onTap: () {
                                todoStore.chengeItem(index, todoModel.id,
                                    todoModel.title, !todoModel.isChecked);
                                setState(() {});
                              },
                              child: CustomTodoBox(
                                title: todoModel.title,
                                isChecked: todoModel.isChecked,
                              ),
                            );
                          },
                        ),
                        secondChild: ListView.separated(
                          separatorBuilder: (context, index) => const Divider(),
                          itemCount: todoStore.getWasDoneLis().length,
                          itemBuilder: (context, index) {
                            TodoModel todoModel =
                                todoStore.getWasDoneLis()[index];
                            return GestureDetector(
                              onTap: () {
                                todoStore.chengeItem(index, todoModel.id,
                                    todoModel.title, !todoModel.isChecked);
                                setState(() {});
                              },
                              child: CustomTodoBox(
                                title: todoModel.title,
                                isChecked: todoModel.isChecked,
                              ),
                            );
                          },
                        ),
                        crossFadeState: todoStore.getButtonTodoWasSelected()
                            ? CrossFadeState.showFirst
                            : CrossFadeState.showSecond,
                      ),
                    ),
                  ],
                )
              : Align(
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                    backgroundColor: Theme.of(context).cardColor,
                  ),
                )),
    );
  }

  Widget slideCustomTodoBoxTodo(BuildContext context, int index, animation,
      TodoModel todoModel, listKey) {
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(-1, 0),
        end: const Offset(0, 0),
      ).animate(animation),
      child: GestureDetector(
        onTap: () {
          listKey.currentState!.removeItem(
              index,
              (_, animation) => slideCustomTodoBoxTodo(
                  context, index, animation, todoModel, listKey),
              duration: const Duration(milliseconds: 500));
          todoStore.chengeItem(
              index, todoModel.id, todoModel.title, !todoModel.isChecked);
        },
        child: CustomTodoBox(
          title: todoModel.title,
          isChecked: todoModel.isChecked,
        ),
      ),
    );
  }
}

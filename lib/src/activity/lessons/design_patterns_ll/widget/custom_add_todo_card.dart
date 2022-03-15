import 'package:flutter/material.dart';

import 'custom_todo_button.dart';
import 'custom_todo_text_field.dart';

class CustomAddTodoCard extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final Function() onTap;

  const CustomAddTodoCard({
    Key? key,
    this.controller,
    this.onChanged,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'addTodo',
      child: Padding(
        padding: const EdgeInsets.all(25),
        child: Material(
          borderRadius: BorderRadius.circular(24),
          color: Theme.of(context).cardColor,
          child: Container(
            width: double.infinity,
            height: 200,
            padding: const EdgeInsets.all(14),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Nova Tarefa',
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  const SizedBox(
                    height: 14,
                  ),
                  CustomTodoTextField(
                    controller: controller,
                    onChanged: onChanged,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 70),
                    child: CustomTodoButton(
                      title: 'Adiccionar',
                      onTap: onTap,
                      selected: true,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

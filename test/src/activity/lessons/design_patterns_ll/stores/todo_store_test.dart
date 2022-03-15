import 'package:flutter_test/flutter_test.dart';
import 'package:masterclass_flutterando/src/activity/lessons/design_patterns_ll/stores/todo_store.dart';

void main() {
  group('getAllTodos', () {
    test(
        'A lista TODO não pode retornar nenhum elemento como o item isChecked verdadeiro',
        () {
      TodoStore todoStore = TodoStore();
      bool result = true;
      for (var element in todoStore.getTodoLis()) {
        if (element.isChecked) {
          result = false;
        }
      }
      expect(result, true);
    });

    test(
        'A lista WASDONE não pode retornar nenhum elemento como o item isChecked Fallso',
        () {
      TodoStore todoStore = TodoStore();
      bool result = true;
      for (var element in todoStore.getWasDoneLis()) {
        if (!element.isChecked) {
          result = false;
        }
      }
      expect(result, true);
    });
  });
}

import '../lessons/design_patterns/page/exercise_1.dart';
import '../lessons/design_patterns/page/exercise_2.dart';

class LessonsModel {
  List<Map> lissons = [
    {
      'name': 'Design Patterns',
      'icon': 'images/desing.svg',
      'info':
          'Início da teoria de design patterns, com a aplicação da teoria e um validador e gerador de CPF',
    }
  ];

  List<Map> exercises = [
    {
      'lesson': 'Design Patterns',
      'title': 'Validador de CPF',
      'nameclass': const CpfValidatePage()
    },
    {
      'lesson': 'Design Patterns',
      'title': 'Gerador de CPF',
      'nameclass': const CpfGeneratorPage()
    },
  ];

  numberOfExercises(String lesson) {
    int number = 0;
    for (var element in exercises) {
      if (element['lesson'] == lesson) {
        number++;
      }
    }
    return number;
  }

  exercisesList(String lesson) {
    List<Map> list = [];
    for (var element in exercises) {
      if (element['lesson'] == lesson) {
        list.add(
          {
            'title': element['title'],
            'nameclass': element['nameclass'],
          },
        );
      }
    }
    return list;
  }
}

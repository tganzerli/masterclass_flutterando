import '../lessons/animation/exercise_1.dart';
import '../lessons/animation/exercise_3.dart';
import '../lessons/design_patterns/page/exercise_1.dart';
import '../lessons/design_patterns/page/exercise_2.dart';

class LessonsModel {
  final List<Map> lissons = [
    {
      'name': 'Animações',
      'icon': 'images/awesome_running.svg',
      'info':
          'Entendendo o funcianamento da API de animação do Flutter, através da criação de duas aniamaçoes utilizando tanto Animações implícitas como Animações Controladas',
    },
    {
      'name': 'Design Patterns',
      'icon': 'images/desing.svg',
      'info':
          'Início da teoria de design patterns, com a aplicação da teoria e um validador e gerador de CPF',
    },
  ];

  final List<Map> exercises = [
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
    {
      'lesson': 'Animações',
      'title': 'Animações implícitas Exe:1',
      'nameclass': const ImplicitAnimation1()
    },
    {
      'lesson': 'Animações',
      'title': 'Animações implícitas Exe:2',
      'nameclass': const ImplicitAnimation1()
    },
    {
      'lesson': 'Animações',
      'title': 'Animações Controladas Exe:1',
      'nameclass': const ControlledAnimation1()
    },
    {
      'lesson': 'Animações',
      'title': 'Animações Controladas Exe:2',
      'nameclass': const ControlledAnimation1()
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

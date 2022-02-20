import 'dart:math';

class CpfModel {
  final String cpf;
  CpfModel({
    this.cpf = '0',
  });

  num digitGenerator(List cpfList, int digitToCalc) {
    num digit = 0;
    int buff = 0;
    for (var i = digitToCalc; i >= 2; i--) {
      digit += cpfList[buff] * i;
      buff++;
    }
    digit = (digit * 10) % 11;
    return digit;
  }

  bool cpfValidator(String cpf) {
    cpf = cpf.replaceAll('.', '');
    cpf = cpf.replaceAll('-', '');
    cpf = cpf.replaceAll(' ', '');
    if (cpf.length != 11) {
      return false;
    }
    List cpfList = cpf.split('').map(int.parse).toList();
    return (digitGenerator(cpfList, 10) == cpfList[9]) &&
        (digitGenerator(cpfList, 11) == cpfList[10]) &&
        !(cpfList.every((element) => element == cpfList[0]));
  }

  String cpfGenerator() {
    List cpfList = [];
    for (var i = 0; i < 9; i++) {
      cpfList.add(Random().nextInt(10));
    }
    cpfList.add(digitGenerator(cpfList, 10));
    cpfList.add(digitGenerator(cpfList, 11));
    return "${cpfList[0]}${cpfList[1]}${cpfList[2]}.${cpfList[3]}${cpfList[4]}${cpfList[5]}.${cpfList[6]}${cpfList[7]}${cpfList[8]}-${cpfList[9]}${cpfList[10]}";
  }
}

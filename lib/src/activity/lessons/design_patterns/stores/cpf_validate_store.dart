import 'package:flutter/material.dart';

import '../model/cpf_model.dart';

class CpfValidateStore extends ChangeNotifier {
  final CpfModel cpfModel = CpfModel();
  List<Map> _cpfList = [];
  String _cpf = '';
  bool _wrongCPF = false;

  void setCpf(String text) {
    _cpf = text;
  }

  getCpfList() {
    return _cpfList;
  }

  getWrongCPF() {
    return _wrongCPF;
  }

  void cpfValidate() {
    _wrongCPF = false;
    String _text = _cpf;
    _text = _text.replaceAll('.', '');
    _text = _text.replaceAll('-', '');
    _text = _text.replaceAll(' ', '');

    if (_text.length != 11) {
      _wrongCPF = true;
    } else {
      _cpf = '';
      _cpfList.insert(0, cpfModel.cpfValidator(_text));
    }

    notifyListeners();
  }
}

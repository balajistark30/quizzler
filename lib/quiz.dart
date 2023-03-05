import 'question.dart';

class Quizs {
  int _sno = 0;
  List<Question> _qt = [
    Question('Flutter is not a language; it is an SDK.', true),
    Question(
        'It is very necessary to learn Dart language for building Flutter application.',
        true),
    Question(
        'When you build the Flutter app the first time, does it will take a longer time.',
        true),
    Question(
        'Release mode allows us to optimize the codes and generate them without any debug data in a fully optimized form.',
        true),
    Question('Flutter is a language; it is not an SDK.', false),
    Question(
        'A notable feature of the Dart platform is it doesn\'t support for hot reload.',
        false),
    Question(
        'It is very necessary to learn Dart language for building Flutter application.',
        true),
    Question('Flutter is a language; it is not an SDK.', false),
  ];
  void nextquestion() {
    if (_sno < _qt.length - 1) {
      _sno++;
    }
  }

  String Gettextno() {
    return _qt[_sno].questions;
  }

  bool Gettf() {
    return _qt[_sno].tf;
  }

  bool alertss() {
    if (_sno >= _qt.length - 1) {
      return true;
    } else {
      return false;
    }
  }

  void reset() {
    _sno = 0;
  }
}

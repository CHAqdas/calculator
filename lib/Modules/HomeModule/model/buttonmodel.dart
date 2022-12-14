import 'package:math_expressions/math_expressions.dart';

class model {
  String question = '';
  String answer = '';
  List<String> buttontext = [
    "c",
    "Del",
    "%",
    "/",
    "7",
    "8",
    "9",
    "x",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "0",
    "00",
    ".",
    "=",
  ];

  bool isoperator(String x) {
    if (x == "c" ||
        x == "Del" ||
        x == "%" ||
        x == "/" ||
        x == "x" ||
        x == "+" ||
        x == "-" ||
        x == "=") {
      return true;
    } else {
      return false;
    }
  }

  void equaltapped() {
    String userQuestion = question;
    userQuestion = userQuestion.replaceAll('x', '*');
    Parser p = Parser();
    Expression exp = p.parse(userQuestion);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    answer = eval.toString();
  }
}

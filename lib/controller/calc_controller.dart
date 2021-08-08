import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalcController extends GetxController {
  var inputNumber = ''.obs;
  var result = ''.obs;
  var isLastOperator = true;
  var isLastNumber = false;
  // var isOperatorExist = false;
  var isLastDot = false;
  var isDotExist = false;
  var isLastNegative = false;
  var isOpenBracket = false;
  var isLastBracket = false;

  var darkMode = false.obs;

  void buttonClick(String value) {
    if (value != '*' && value != '/' && value != '-' && value != '+') {
      inputNumber.value += value;
      isLastNumber = true;

      // isLastOperator.value = false;
      // print('number: ' + value);
    } else {
      if (isLastNumber) {
        inputNumber.value += value;
        isLastOperator = true;
        isLastNumber = false;
        isDotExist = false;
        isLastNegative = false;
      }

      // sebelum edit
      // if (isLastNumber && !isOperatorExist) {
      //   inputNumber.value += value;
      //   isLastOperator = true;
      //   isLastNumber = false;
      //   isOperatorExist = true;
      //   isDotExist = false;
      //   isLastNegative = false;
      // }
    }
  }

  void onClear() {
    inputNumber.value = '';
    result.value = '';
    isLastOperator = true;
    isLastNumber = false;
    isDotExist = false;
    // isOperatorExist = false;
  }

  void onDot() {
    if (inputNumber.value != '') {
      if (isLastNumber && !isDotExist) {
        inputNumber.value += '.';
      }
      isDotExist = true;
    }
  }

  void onResult() {
    if (inputNumber.value != '' && isLastNumber) {
      if (isOpenBracket) {
        inputNumber.value += ')';
      }
      Parser p = Parser();
      Expression exp = p.parse(inputNumber.value);

      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      result.value = doubleCheck(eval.toString());
      inputNumber.value = '';
      isLastOperator = true;
      isLastNumber = false;
      // isOperatorExist = false;
      isLastDot = false;
      isDotExist = false;
    }
  }

  String doubleCheck(String value) {
    if (value[value.length - 1] == '0' && value[value.length - 2] == '.') {
      value = value.substring(0, value.length - 2);
    }
    return value;
  }

  void onBackspace() {
    if (inputNumber.value.length != 0) {
      var lastDigit = inputNumber.value[inputNumber.value.length - 1];
      if (lastDigit == '/' ||
          lastDigit == '*' ||
          lastDigit == '-' ||
          lastDigit == '+') {
        isLastOperator = false;
        // isOperatorExist = false;
        isLastNumber = true;
      }

      inputNumber.value =
          inputNumber.substring(0, inputNumber.value.length - 1);

      if (inputNumber.value == '') {
        isLastOperator = true;
        isLastNumber = false;
        // isOperatorExist = false;
        isLastDot = false;
        isDotExist = false;
      } else {
        lastDigit = inputNumber.value[inputNumber.value.length - 1];
        if (lastDigit == '/' ||
            lastDigit == '*' ||
            lastDigit == '-' ||
            lastDigit == '+') {
          isLastOperator = true;
          isLastNumber = false;
          // isOperatorExist = true;
          isDotExist = false;
          isLastNegative = false;
        }
      }
    }
  }

  void negativeValue(String value) {
    value = '-';
    if (isLastOperator && !isLastNumber && !isLastNegative) {
      inputNumber.value += value;
      isLastNegative = true;
    }
  }

  void onBrackets() {
    // if (isLastNumber || isLastBracket) {
    //   inputNumber.value += 'x(';
    //   isOpenBracket = true;
    //   return 0;
    // }

    // if (isOpenBracket) {
    //   inputNumber.value += ')';
    //   isOpenBracket = false;
    //   isLastBracket = true;
    //   return 0;
    // }

    // inputNumber.value += '(';
    // isOpenBracket = true;
    // return 0;
  }
}

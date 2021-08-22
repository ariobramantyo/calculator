import 'package:get/get.dart';
import 'package:math_expressions/math_expressions.dart';

class CalcController extends GetxController {
  var inputNumber = ''.obs;
  var result = ''.obs;
  var isLastOperator = true;
  var isLastNumber = false;

  var isLastDot = false;
  var isDotExist = false;
  var isLastNegative = false;
  var isLastBracket = false;

  void buttonClick(String value) {
    if (value != '*' && value != '/' && value != '-' && value != '+') {
      inputNumber.value += value;
      isLastNumber = true;
    } else {
      if (isLastNumber) {
        inputNumber.value += value;
        isLastOperator = true;
        isLastNumber = false;
        isDotExist = false;
        isLastNegative = false;
      }
    }
  }

  void onClear() {
    inputNumber.value = '';
    result.value = '';
    isLastOperator = true;
    isLastNumber = false;
    isDotExist = false;
  }

  void onDot() {
    if (inputNumber.value != '') {
      if (isLastNumber && !isDotExist) {
        inputNumber.value += '.';
        isDotExist = true;
        isLastDot = true;
        isLastNumber = false;
      }
    }
  }

  void onResult() {
    if (inputNumber.value != '' && isLastNumber) {
      try {
        Parser p = Parser();
        Expression exp = p.parse(inputNumber.value);

        ContextModel cm = ContextModel();
        double eval = exp.evaluate(EvaluationType.REAL, cm);

        result.value = doubleCheck(eval.toString());

        inputNumber.value = '';
        isLastOperator = true;
        isLastNumber = false;
        isLastDot = false;
        isDotExist = false;
      } catch (e) {
        Get.defaultDialog(
            title: 'Invalid Input',
            middleText: 'Try adding the valid number format',
            textCancel: 'Close',
            barrierDismissible: false,
            onCancel: () {
              result.value = '';
              inputNumber.value = '';
              isLastOperator = true;
              isLastNumber = false;
              isLastDot = false;
              isDotExist = false;
              Get.back();
            });
      }
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
        isLastNumber = true;
      } else if (lastDigit == '.') {
        isLastDot = false;
        isDotExist = false;
      }

      inputNumber.value =
          inputNumber.substring(0, inputNumber.value.length - 1);

      if (inputNumber.value == '') {
        isLastOperator = true;
        isLastNumber = false;
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
          isDotExist = false;
          isLastNegative = false;
        } else if (lastDigit == '.') {
          isLastDot = true;
          isLastNumber = false;
        } else {
          isLastNumber = true;
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
}

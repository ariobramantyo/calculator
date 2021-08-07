import 'package:get/get.dart';

class CalcController extends GetxController {
  var inputNumber = ''.obs;
  var result = 'result'.obs;

  void buttonClick(String value) {
    inputNumber.value += value;
    result.value += value;
  }

  void onClear() {
    inputNumber.value = '';
    result.value = '';
  }
}

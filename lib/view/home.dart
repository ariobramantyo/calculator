import 'package:calculator/controller/calc_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  // const HomeScreen({Key? key}) : super(key: key);

  final caclC = Get.put(CalcController());

  Widget clickButtton(String text, {Color? backColor, Color? textColor}) {
    return Material(
      color: backColor ?? Colors.grey[850],
      borderRadius: BorderRadius.circular(30),
      child: InkWell(
        onTap: () {
          if (text == 'C') {
            caclC.onClear();
          } else {
            caclC.buttonClick(text);
          }
        },
        borderRadius: BorderRadius.circular(30),
        child: Container(
          width: Get.width * 0.2,
          height: Get.width * 0.2,
          child: Center(
            child: Text(
              text,
              style: TextStyle(
                  fontSize: 35,
                  color: textColor ?? Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black87,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              // input view
              height: Get.height / 3,
              width: double.infinity,
              padding: EdgeInsets.all(10),
              child: Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Container(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          caclC.result.value,
                          textAlign: TextAlign.end,
                          maxLines: 2,
                          style: TextStyle(color: Colors.white, fontSize: 45),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      alignment: Alignment.bottomRight,
                      child: ListView(
                        reverse: true,
                        padding: EdgeInsets.zero,
                        scrollDirection: Axis.horizontal,
                        children: [
                          Text(
                            caclC.inputNumber.value,
                            style: TextStyle(color: Colors.white, fontSize: 35),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Container(
                // button
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        clickButtton('C', textColor: Colors.red),
                        clickButtton('', textColor: Colors.green),
                        clickButtton('', textColor: Colors.green),
                        clickButtton('/', textColor: Colors.green)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        clickButtton('7'),
                        clickButtton('8'),
                        clickButtton('9'),
                        clickButtton('x', textColor: Colors.green)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        clickButtton('4'),
                        clickButtton('5'),
                        clickButtton('6'),
                        clickButtton('-', textColor: Colors.green)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        clickButtton('1'),
                        clickButtton('2'),
                        clickButtton('3'),
                        clickButtton('+', textColor: Colors.green)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        clickButtton(''),
                        clickButtton('0'),
                        clickButtton('.'),
                        clickButtton('=', backColor: Colors.green)
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
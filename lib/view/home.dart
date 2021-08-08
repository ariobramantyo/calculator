import 'package:calculator/controller/calc_controller.dart';
import 'package:calculator/controller/theme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  // const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final caclC = Get.put(CalcController());

  final themeC = Get.find<ThemesController>();

  Widget clickButtton(String text,
      {Color? backColor, Color? textColor, double? textSize}) {
    return Material(
      color: backColor ?? Get.theme.buttonColor,
      borderRadius: BorderRadius.circular(30),
      child: InkWell(
        onTap: () {
          if (text == '.') {
            caclC.onDot();
          } else if (text == 'AC') {
            caclC.onClear();
          } else if (text == 'C') {
            caclC.onBackspace();
          } else if (text == '=') {
            caclC.onResult();
          } else if (text == '( - )') {
            caclC.negativeValue(text);
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
                  fontSize: textSize ?? 35,
                  color: textColor ?? Get.theme.accentColor,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    print(
        'BUILD==============================================================');
    return Scaffold(
      backgroundColor: Get.theme.scaffoldBackgroundColor,
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
                          style: TextStyle(color: Colors.green, fontSize: 45),
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
                            style: TextStyle(
                                color: Get.theme.accentColor, fontSize: 35),
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
                        clickButtton('AC', textColor: Colors.red, textSize: 30),
                        clickButtton('C', textColor: Get.theme.primaryColor),
                        clickButtton('( - )',
                            textColor: Get.theme.primaryColor, textSize: 30),
                        clickButtton('/', textColor: Get.theme.primaryColor)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        clickButtton('7'),
                        clickButtton('8'),
                        clickButtton('9'),
                        clickButtton('*', textColor: Get.theme.primaryColor)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        clickButtton('4'),
                        clickButtton('5'),
                        clickButtton('6'),
                        clickButtton('-', textColor: Get.theme.primaryColor)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        clickButtton('1'),
                        clickButtton('2'),
                        clickButtton('3'),
                        clickButtton('+', textColor: Get.theme.primaryColor)
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Material(
                          color: Get.theme.buttonColor,
                          borderRadius: BorderRadius.circular(30),
                          child: InkWell(
                            onTap: () {
                              print(Get.isDarkMode);
                              themeC.changeTheme();
                              // caclC.inputNumber.value = '';
                              // caclC.result.value = '';
                              setState(() {});
                            },
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                              width: Get.width * 0.2,
                              height: Get.width * 0.2,
                              child: Center(
                                child: Icon(
                                  Get.isDarkMode
                                      ? Icons.dark_mode
                                      : Icons.light_mode,
                                  color: Get.isDarkMode
                                      ? Colors.white
                                      : Colors.black,
                                ),
                              ),
                            ),
                          ),
                        ),
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

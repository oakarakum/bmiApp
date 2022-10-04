// ignore_for_file: unnecessary_import, implementation_imports
// ignore_for_file: prefer_const_constructors
import 'package:bmiapp/second_screen.dart';
import 'package:bmiapp/widgets/bmicalc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
//import 'package:confetti/confetti.dart';

class first_screen extends StatefulWidget {
  const first_screen({super.key});

  @override
  State<first_screen> createState() => _first_screenState();
}

/* class LimitRangeTextInputFormatter extends TextInputFormatter {
  LimitRangeTextInputFormatter(this.min, this.max) : assert(min < max);

  final int min;
  final int max;

  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    var value = int.parse(newValue.text);
    if (value < min) {
      return TextEditingValue(text: min.toString());
    } else if (value > max) {
      return TextEditingValue(text: max.toString());
    } 
    return newValue;
  }
} */

class _first_screenState extends State<first_screen> {
  int gender_index = 0;
  double weight = 0;
  double height = 0;

  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>(); uzun yolu
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Form(
        key: _formKey,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              SizedBox(height: 100),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "Let's calculate \nyour current BMI",
                      style:
                          TextStyle(fontWeight: FontWeight.w500, fontSize: 40),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  "You can find out whether you are overweight, underweight or ideal weight.",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                ),
              ),
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  genderbutton("Female", Color.fromARGB(255, 223, 3, 76), 0),
                  genderbutton("Male", Colors.blue, 1),
                  genderbutton("Other", Colors.purple, 2),
                ],
              ),
              SizedBox(height: 25),
              TextFormField(
                inputFormatters: [
                  //LimitRangeTextInputFormatter(1, 120),
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(3),
                ],
                keyboardType:
                    TextInputType.number, //keyboarda sadece sayı yazılması için
                validator: (String? value) {
                  if (value!.isNotEmpty) {
                    return 'Please fill your age';
                  } else if (int.parse(value) < 1) {
                    return "Age cannot be lower than 1";
                  } else if (int.parse(value) > 120)
                    return "Age cannot be higher than 120";
                  else {
                    return null;
                  }
                },

                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    labelText: "Age",
                    labelStyle: TextStyle(color: Colors.black, fontSize: 16),
                    hintText: "Age",
                    hintStyle: TextStyle(
                        color: Color.fromARGB(255, 112, 109, 109),
                        fontSize: 16)),
              ),
              TextFormField(
                onChanged: (value) {
                  height = double.parse(value);
                },
                inputFormatters: [
                  //LimitRangeTextInputFormatter(50, 220),
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(3),
                ],
                validator: (String? height) {
                  if (height != null) {
                    height.isEmpty ? 'Please fill your height' : null;
                  } else if (int.parse(height) < 50) {
                    return "Height cannot be lower than 50";
                  } else if (int.parse(height) > 220)
                    return "Height cannot be higher than 220";
                  else {
                    return null;
                  }
                },
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                    labelText: "Height",
                    labelStyle: TextStyle(color: Colors.black, fontSize: 16),
                    suffixText: "cm",
                    suffixStyle:
                        TextStyle(color: Color.fromARGB(255, 112, 109, 109)),
                    hintText: "Height",
                    hintStyle: TextStyle(
                        color: Color.fromARGB(255, 112, 109, 109),
                        fontSize: 16)),
              ),
              TextFormField(
                onChanged: (value) {
                  weight = double.parse(value);
                },
                keyboardType: TextInputType.number,
                inputFormatters: [
                  //LimitRangeTextInputFormatter(3, 400),
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(3),
                ],
                validator: (String? value) {
                  if (value!.isEmpty) {
                    return 'Please fill your weight';
                  } else if (int.parse(value) < 3) {
                    return "Weight cannot be lower than 3";
                  } else if (int.parse(value) > 300)
                    return "Weight cannot be heavier than 300";
                  else {
                    return null;
                  }
                },
                decoration: InputDecoration(
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    labelText: "Weight",
                    labelStyle: TextStyle(color: Colors.black, fontSize: 16),
                    suffixText: "kg",
                    suffixStyle:
                        TextStyle(color: Color.fromARGB(255, 112, 109, 109)),
                    hintText: "Weight",
                    hintStyle: TextStyle(
                        color: Color.fromARGB(255, 112, 109, 109),
                        fontSize: 16)),
              ),
              SizedBox(height: 175),
              GestureDetector(
                onTap: () {
                  if (_formKey.currentState.validate()) {
                    return;
                  }
                  CalculateResult calculateResult =
                      CalculateResult(weight: weight, height: height);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => second_screen(
                              bmiC: calculateResult.bmi_calc(),
                              cond: calculateResult.condition(),
                              adv: calculateResult.advice(),
                              ftp: calculateResult.foto()))));
                },
                child: Container(
                  height: 50,
                  width: 350,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(100)),
                  child: Center(
                    child: Text(
                      "Calculate BMI",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void changeIndex(int index) {
    setState(() {
      gender_index = index;
    });
  }

  GestureDetector genderbutton(String value, Color color, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          changeIndex(index);
        });
      },
      child: Container(
        height: 55,
        width: 110,
        decoration: BoxDecoration(
            color: gender_index == index
                ? color
                : Colors
                    .white, //kısa if-else koy arka plan tıklandığında siyah rengi alması için
            border: Border.all(
                color: index == 0
                    ? Color.fromARGB(255, 203, 198, 198)
                    : Color.fromARGB(255, 182, 176, 176)),
            borderRadius: BorderRadius.circular(100)),
        child: Center(
          child: Text(
            value,
            style: TextStyle(
                color: gender_index == index ? Colors.white : Colors.black,
                fontSize:
                    15), //kısa if-else koy arka plan tıklandığında siyah rengi alması için
          ),
        ),
      ),
    );
  }
}

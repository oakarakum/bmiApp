// ignore_for_file: avoid_print

import 'dart:math';

import 'package:flutter/cupertino.dart';

class CalculateResult {
  CalculateResult({required this.height, required this.weight});
  final double weight;
  final double height;
  late double BMI;

  String bmi_calc() {
    BMI = weight / ((height * height) / 10000);
    return BMI.toStringAsFixed(2);
  }

  String condition() {
    if (BMI < 18.5) {
      return "You are underweight.";
    } else if (BMI >= 18.5 && BMI <= 24.9) {
      return "You are healthy.";
    } else if (BMI >= 25 && BMI <= 29.9) {
      return "You are overweight.";
    } else if (BMI >= 30 && BMI <= 39.9) {
      return "You are obese.";
    } else {
      return "You are morbidly obese.";
    }
  }

  String advice() {
    if (BMI < 18.5) {
      return "You are too skinny. Try to gain some weight.";
    } else if (BMI >= 18.5 && BMI <= 24.9) {
      return "Your weight is good. Keep up the good work.";
    } else if (BMI >= 25 && BMI <= 29.9) {
      return "You should lose some weight. Try to eat less.";
    } else if (BMI >= 30 && BMI <= 39.9) {
      return "You have to lose weight and exercise.";
    } else {
      return "You have to do a strict diet and an exercise.";
    }
  }

  Image foto() {
    if (BMI < 18.5) {
      return Image.network(
          "https://www.ameliyat.com/lib/images/veriler/hastaliklar/287527anoreksiya-hastaligi-ghksg7ksyottsi8vtjcf.webp");
    } else if (BMI >= 18.5 && BMI <= 24.9) {
      return Image.network(
          "https://magnethastanesi.com.tr/wp-content/uploads/2022/01/beslenme-ve-diyet-doktoru-1.jpg");
    } else if (BMI >= 25 && BMI <= 29.9) {
      return Image.network(
          "https://www.ameliyat.com/lib/images/veriler/hastaliklar/287527anoreksiya-hastaligi-ghksg7ksyottsi8vtjcf.webp");
    } else if (BMI >= 30 && BMI <= 39.9) {
      return Image.network(
          "https://fscomps.fotosearch.com/compc/CSP/CSP992/%C5%9Fi%C5%9Fman-adam-ile-l%C3%A2-notasi-g%C3%B6bek-haz%C4%B1r-g%C3%B6r%C3%BCnt%C3%BC__k14448570.jpg");
    } else {
      return Image.network(
          "https://dilaverajder.com/wp-content/uploads/2014/04/sisman.jpg");
    }
  }
}

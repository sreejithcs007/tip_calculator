import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tip_calculator/screens/resultpage.dart';

class HomeScreenController extends GetxController {
  var personCount = 1.obs;
  final TextEditingController personTextController = TextEditingController();
  final TextEditingController billAmountTextController =
      TextEditingController();
  final TextEditingController customTipPercentageTextController =
      TextEditingController();
  final selectedTip = 15.obs;
  Rx<double> tipAmount = 0.0.obs;
  Rx<double> totalAmount = 0.0.obs;
  Rx<double> perPersonAmount = 0.0.obs;

  void personCountIncrement() {
    personCount.value++;
    personTextController.text = personCount.value.toString();
  }

  void personCountDecrement(BuildContext context) {
    if (personCount.value != 1) {
      personCount.value--;
      personTextController.text = personCount.value.toString();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Minimum 1 person is required to split')),
      );
    }
  }

  void calculatePerPerson({
    required double billAmount,
    required double tipPercentage,
    required int peopleCount,
    required BuildContext context,
  }) {
    if (billAmount != 0) {
      tipAmount.value = billAmount * tipPercentage / 100;

      totalAmount.value = billAmount + tipAmount.value;

      perPersonAmount.value = totalAmount / peopleCount;

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ResultScreen()),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please Enter a valid Amount'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void resetData() {
    customTipPercentageTextController.text = '15';
    selectedTip.value = 15;
    personTextController.text = '1';
    personCount.value = 1;
    billAmountTextController.clear();
    tipAmount.value = 0;
    totalAmount.value = 0;
    perPersonAmount.value = 0;
  }

  @override
  void onInit() {
    customTipPercentageTextController.text = selectedTip.toString();
    personTextController.text = personCount.value.toString();
    super.onInit();
  }
}

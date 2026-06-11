import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  var personCount = 1.obs;
  final TextEditingController personTextController = TextEditingController();
  

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

  @override
  void onInit() {
    // TODO: implement onInit
    personTextController.text = personCount.value.toString();
    super.onInit();
  }
}

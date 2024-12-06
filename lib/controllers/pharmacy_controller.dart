import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:pharma/models/PharmacyModel.dart';
import 'package:pharma/res/app_url.dart';

class PharmacyController extends GetxController{
  var name = 'Melissa Peters'.obs;
  var email = 'melpeters@gmail.com'.obs;
  var password = '**********'.obs;
  var dateOfBirth = '23/05/1995'.obs;
  var mobile = '+1 123 456 789'.obs;
  var isPasswordVisible = false.obs;
  Rxn<Pharmacy> pharmacyDetails = Rxn<Pharmacy>();


  @override
  void onInit() {
    super.onInit();
    fetchpharmacy();
  }

  Future<void> fetchpharmacy() async {
    final url = Uri.parse(AppUrl.profile); // Replace with your API URL
    final body = json.encode({"chemistId": 1});
    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: body,
      );
      print('status is :${response.statusCode}');
      if (response.statusCode == 200) {

        final data = json.decode(response.body);
        if (data['success'] == true) {
          pharmacyDetails.value = Pharmacy.fromJson(data['data']);
        } else {
          Get.snackbar('Error', data['message']);
        }
      } else {
        Get.snackbar('Error', 'Failed to fetch details');
      }
    } catch (e) {
      Get.snackbar('Error', 'Something went wrong');
    }
  }

  void saveChanges() {
    // Logic to save changes (e.g., call an API)
    Get.snackbar("Success", "Changes saved successfully!",
        snackPosition: SnackPosition.BOTTOM);
  }
}
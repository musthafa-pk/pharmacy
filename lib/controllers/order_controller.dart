import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pharma/res/app_url.dart';

import '../models/OrderModel.dart';
import 'package:http/http.dart' as http;

class OrderController extends GetxController {
  var ordersToFulfill = <Order>[].obs;
  var orderCount = 0.obs;
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    fetchOrders(4);
  }

  Future<void> fetchOrders(int chemistId) async {
    isLoading.value = true;

    try {
      // API call to fetch orders
      final response = await http.post(
        Uri.parse(AppUrl.getorders), // Replace with your API URL
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({'chemistId': chemistId}),
      );
      print('response status code is :${response.statusCode}');
      print('response is :${response.body}');
      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = jsonDecode(response.body);

        if (responseBody['success'] == true) {
          // Parse the orders from the response
          final List<dynamic> ordersJson = responseBody['data'];
          final orders = ordersJson.map((order) => Order.fromJson(order)).toList();

          // Update observable lists
          ordersToFulfill.value = orders;
          orderCount.value = orders.length;
        } else {
          throw Exception(responseBody['message'] ?? 'Failed to fetch orders');
        }
      } else {
        throw Exception('Error: ${response.statusCode}');
      }
    } catch (e) {
      Get.snackbar(
        'Error',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  // void acceptOrder(int id) {
  //   int index = ordersToFulfill.indexWhere((order) => order.id == id);
  //   if (index != -1) {
  //     ordersToFulfill[index].status = "Accepted";
  //     ordersToFulfill.refresh();
  //   }
  // }

  // void rejectOrder(int id) {
  //   int index = ordersToFulfill.indexWhere((order) => order.id == id);
  //   if (index != -1) {
  //     ordersToFulfill[index].status = "Rejected";
  //     ordersToFulfill.refresh();
  //   }
  // }

  // void updateOrderStatus(int id, String newStatus) {
  //   int index = ordersToFulfill.indexWhere((order) => order.id == id);
  //   if (index != -1) {
  //     ordersToFulfill[index].status = newStatus;
  //     ordersToFulfill.refresh();
  //   }
  // }
}

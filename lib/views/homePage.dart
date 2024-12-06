import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:pharma/Constants/appColors.dart';
import 'package:pharma/views/indexPage.dart';
import 'package:pharma/views/past_orders/pastOrdersPage.dart';
import 'package:pharma/views/product_list/productListPage.dart';
import 'package:pharma/views/profile/profilePage.dart';
import 'package:pharma/views/order_fulfillment/orderFulfillment.dart';

import '../controllers/pharmacy_controller.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int currentIndex = 0;

  final List<Widget> pages = [
    Indexpage(),
    ProductListPage(), // Centered item
    PastOrdersPage(),
    ProfilePage(), // Top-right item
    OrderFulfillmentPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final PharmacyController pharmacyController = Get.put(PharmacyController());

    return WillPopScope(
      onWillPop: () async{
        final shouldExit = await _showExitConfirmationDialog(context);
        return shouldExit ?? false;
      },
      child: Scaffold(
        body: pages[currentIndex],
        bottomNavigationBar: Container(
          height: 80, // Increased height for labels
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.3),
                spreadRadius: 2,
                blurRadius: 5,
                offset: Offset(0, -2),
              ),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround, // Equal spacing
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 0;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.home,
                      color: currentIndex == 0 ? PRIMARY_COLOR : Colors.grey,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Home',
                      style: TextStyle(
                        color: currentIndex == 0 ? PRIMARY_COLOR : Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              // History Item
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 1;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset('assets/images/shop.png',
                    color: currentIndex == 1 ? PRIMARY_COLOR :Colors.grey,scale: 4.9,),
                    SizedBox(height: 5),
                    Text(
                      'Product',
                      style: TextStyle(
                        color: currentIndex == 1 ? PRIMARY_COLOR : Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              // Center Item
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 2;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.sync,
                      color: currentIndex == 2 ? PRIMARY_COLOR : Colors.grey,
                      size: 24,
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Past Orders',
                      style: TextStyle(
                        color: currentIndex == 2 ? PRIMARY_COLOR : Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    currentIndex = 3;
                  });
                },
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(onTap: (){
                      Get.to(() => ProfilePage());

                    },child: CircleAvatar(radius: 15,
                    backgroundColor: PRIMARY_COLOR,
                    child: Text('${pharmacyController.pharmacyDetails.value?.name[0].toUpperCase() ?? ''}',style: TextStyle(color: TextColorWhite),),)),
                    SizedBox(height: 5),
                    Text(
                      'Profile',
                      style: TextStyle(
                        color: currentIndex == 3 ? PRIMARY_COLOR : Colors.grey,
                        fontSize: 12,
                      ),
                    ),
                  ],
                ),
              ),
              // Shipping Item
              // GestureDetector(
              //   onTap: () {
              //     setState(() {
              //       currentIndex = 0;
              //     });
              //   },
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Icon(
              //         Icons.local_shipping,
              //         color: currentIndex == 0 ? Colors.red : Colors.grey,
              //       ),
              //       SizedBox(height: 5),
              //       Text(
              //         'Shipping',
              //         style: TextStyle(
              //           color: currentIndex == 0 ? Colors.red : Colors.grey,
              //           fontSize: 12,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
  Future<bool?> _showExitConfirmationDialog(BuildContext context) {
    return Get.defaultDialog(
      title: "Exit App",
      middleText: "Do you want to exit the app?",
      textCancel: "No",
      textConfirm: "Yes",
      onCancel: () => false,
      onConfirm: () => Get.back(result: true),
      buttonColor: PRIMARY_COLOR,
      cancelTextColor: PRIMARY_COLOR
    );
  }

}

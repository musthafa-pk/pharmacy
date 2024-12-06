import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:pharma/Constants/appColors.dart';
import 'package:pharma/controllers/order_controller.dart';
import 'package:pharma/controllers/product_controller.dart';
import 'package:pharma/views/notifications.dart';
import 'package:pharma/views/order_fulfillment/orderFulfillment.dart';
import 'package:pharma/views/product_list/productListPage.dart';

class Indexpage extends StatelessWidget {
  const Indexpage({super.key});

  @override
  Widget build(BuildContext contexst) {

    final productController = Get.find<ProductController>();
    final PageController pageController = PageController();
    final OrderController orderController = OrderController();

    final List<Map<String, String>> healthyTips = [
      {
        'title': 'Stay Hydrated!',
        'subtitle': 'Drink 8 Glasses of Water Daily 💧',
      },
      {
        'title': 'Move More, Sit Less!',
        'subtitle': 'Walk 10,000 Steps a Day 🚶‍♂️',
      },
      {
        'title': 'Snack Smart!',
        'subtitle': 'Choose Fruits Over Junk Food 🍎',
      },
      {
        'title': 'Breathe Easy!',
        'subtitle': 'Practice 5-Minute Daily Meditation 🧘‍♀️',
      },
      {
        'title': 'Boost Immunity!',
        'subtitle': 'Get Your 7-8 Hours of Sleep Tonight 🌙',
      },
      {
        'title': 'Cut the Sugar!',
        'subtitle': 'Your Body Will Thank You 🍬❌',
      },
    ];


    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(22.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Container(
                        decoration: BoxDecoration(
                          color: TextColorWhite,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: TextField(
                          decoration: InputDecoration(
                            prefixIcon: Icon(Icons.search),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.only(left: 10,top: 10),
                            hintText: 'Search...'
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10,),
                    InkWell(
                      onTap: (){
                        Get.to(() => NotificationsPage());

                      },
                        child: Icon(Icons.notifications_active,)),
                    SizedBox(width: 10,),
                    Icon(Icons.settings,)
                  ],
                ),
                SizedBox(height: 30,),
                // SizedBox(
                //   height: 160,
                //   child: PageView.builder(
                //     controller: productController.pageController,
                //     onPageChanged: (index) {
                //       productController.updatePage(index);
                //     },
                //     itemCount: healthyTips.length,
                //
                //     itemBuilder: (context, index) {
                //       final tip = healthyTips[index];
                //       return Stack(
                //         children: [
                //           Padding(
                //             padding: const EdgeInsets.only(right: 10.0),
                //             child: Container(
                //               width: 350,
                //               height: 150,
                //               decoration: BoxDecoration(
                //                 color: Colors.black, // Replace with PRIMARY_COLOR
                //                 borderRadius: BorderRadius.circular(15),
                //               ),
                //               child: Column(
                //                 crossAxisAlignment: CrossAxisAlignment.start,
                //                 children: [
                //                   Padding(
                //                     padding: const EdgeInsets.all(12.0),
                //                     child: SizedBox(
                //                       width: 200,
                //                       child: Column(
                //                         crossAxisAlignment: CrossAxisAlignment.start,
                //                         children: [
                //                           SizedBox(height: 10),
                //                           Text(
                //                             tip['title']!,
                //                             style: TextStyle(
                //                               fontWeight: FontWeight.bold,
                //                               color: Colors.white, // Replace with TextColorWhite
                //                               fontSize: 16,
                //                             ),
                //                           ),
                //                           SizedBox(height: 10),
                //                           Text(
                //                             tip['subtitle']!,
                //                             style: TextStyle(
                //                               fontWeight: FontWeight.normal,
                //                               color: Colors.white, // Replace with TextColorWhite
                //                               fontSize: 14,
                //                             ),
                //                           ),
                //                         ],
                //                       ),
                //                     ),
                //                   ),
                //                 ],
                //               ),
                //             ),
                //           ),
                //           Positioned(
                //             right: 10,
                //             child: Image.asset(
                //               'assets/images/doc.png',
                //               height: 150,
                //             ),
                //           ),
                //         ],
                //       );
                //     },
                //   ),
                // ),
                // const SizedBox(height: 10),
                // Dot Indicators
                // Obx(() {
                //   return Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: List.generate(healthyTips.length, (index) {
                //       return AnimatedContainer(
                //         duration: const Duration(milliseconds: 300),
                //         margin: const EdgeInsets.symmetric(horizontal: 5),
                //         height: 8,
                //         width: productController.currentPage.value == index ? 16 : 8,
                //         decoration: BoxDecoration(
                //           color: productController.currentPage.value == index
                //               ? Colors.blue
                //               : Colors.grey,
                //           borderRadius: BorderRadius.circular(4),
                //         ),
                //       );
                //     }),
                //   );
                // }),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Order\'s to Fulfill',style: TextStyle(fontWeight: FontWeight.bold),),
                      InkWell(
                        onTap: (){
                          Get.to(OrderFulfillmentPage());
                        },
                          child: Text('See all',style: TextStyle(fontWeight: FontWeight.bold)))
                    ],
                  ),
                ),
          // Obx(() {
          //   if (orderController.isLoading.value) {
          //     return Center(child: CircularProgressIndicator());
          //   }
          //
          //   if (orderController.ordersToFulfill.isEmpty) {
          //     return Center(child: Text('No orders found'));
          //   }
          //
          //   return ListView.builder(
          //     itemCount: orderController.ordersToFulfill.length,
          //     itemBuilder: (context, index) {
          //       final order = orderController.ordersToFulfill[index];
          //
          //       return Padding(
          //         padding: const EdgeInsets.all(8.0),
          //         child: Container(
          //           decoration: BoxDecoration(
          //             color: Colors.white,
          //             borderRadius: BorderRadius.circular(12),
          //             boxShadow: [
          //               BoxShadow(
          //                 color: Colors.grey.withOpacity(0.2),
          //                 spreadRadius: 2,
          //                 blurRadius: 5,
          //               ),
          //             ],
          //           ),
          //           child: Padding(
          //             padding: const EdgeInsets.all(12.0),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Text('Order No: #${order.id}', style: TextStyle(fontWeight: FontWeight.bold)),
          //                 Text('Date: ${order.createdDate.substring(0, 10)}'),
          //                 Text('Status: ${order.status}'),
          //                 Divider(),
          //                 Text('Products:', style: TextStyle(fontWeight: FontWeight.bold)),
          //                 ListView.builder(
          //                   shrinkWrap: true,
          //                   physics: NeverScrollableScrollPhysics(),
          //                   itemCount: order.productList.length,
          //                   itemBuilder: (context, productIndex) {
          //                     final product = order.productList[productIndex];
          //                     return Padding(
          //                       padding: const EdgeInsets.symmetric(vertical: 4.0),
          //                       child: Text(
          //                         '- Product ID: ${product.productId}, Qty: ${product.orderQty}, Amount: Rs. ${product.netAmount.toStringAsFixed(2)}',
          //                       ),
          //                     );
          //                   },
          //                 ),
          //                 Divider(),
          //                 Row(
          //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //                   children: [
          //                     ElevatedButton(
          //                       onPressed: () {
          //                         // Accept logic
          //                         Get.snackbar('Accepted', 'Order #${order.id} accepted');
          //                       },
          //                       child: Text('Accept'),
          //                       style: ElevatedButton.styleFrom(backgroundColor: PRIMARY_COLOR),
          //                     ),
          //                     ElevatedButton(
          //                       onPressed: () {
          //                         // Reject logic
          //                         Get.snackbar('Rejected', 'Order #${order.id} rejected');
          //                       },
          //                       child: Text('Reject'),
          //                       style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          //                     ),
          //                   ],
          //                 ),
          //               ],
          //             ),
          //           ),
          //         ),
          //       );
          //     },
          //   );
          // }),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Container(
                    decoration: BoxDecoration(
                        color: TextColorWhite,
                        borderRadius: BorderRadius.circular(12)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Order No:#0001'),
                          Text('Date   : 2024-11-01'),
                          Text('Total  : Rs 300.0'),
                          SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                width:100,
                                decoration:BoxDecoration(
                                    color: PRIMARY_COLOR,
                                    borderRadius: BorderRadius.circular(6)
                                ),
                                child: Center(child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Accept',style: TextStyle(
                                      color: TextColorWhite,fontWeight: FontWeight.bold
                                  ),),
                                )),
                              ),
          
                              Container(
                                width:100,
                                decoration:BoxDecoration(
                                    color: RedColor,
                                    borderRadius: BorderRadius.circular(6)
                                ),
                                child: Center(child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Reject',style: TextStyle(
                                      color: TextColorWhite,fontWeight: FontWeight.bold
                                  ),),
                                )),
                              ),
                            ],
                          ),
                          SizedBox(height: 10,),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Product\'s',style: TextStyle(fontWeight: FontWeight.bold),),
                      Text('See all',style: TextStyle(fontWeight: FontWeight.bold))
                    ],
                  ),
                ),
                SizedBox(height: 10,),
                SizedBox(
                  height: 230,
                  child: Obx(() {
                    return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: productController.products.length,
                      itemBuilder: (context, index) {
                        final product = productController.products[index];
                        return Padding(padding: EdgeInsets.only(right: 10),
                          child: Container(
                            width: 150,
                            height: 150,
                            decoration: BoxDecoration(
                                color: TextColorWhite,
                                borderRadius: BorderRadius.circular(12)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset('assets/images/medicine.png'),
                                Text(product.productName.toString()),
                                Text('Price: \$${product.netAmount}'),
                                IconButton(
                                  icon: Icon(Icons.edit),
                                  onPressed: () {
                                    Get.to(() => EditProductPage(product: product));
                                  },
                                ),
                              ],
                            ),
                          ),);
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

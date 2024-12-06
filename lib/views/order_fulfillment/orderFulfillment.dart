import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:pharma/views/profile/profilePage.dart';
import '../../Constants/appColors.dart';
import '../../controllers/order_controller.dart';

class OrderFulfillmentPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final orderController = Get.find<OrderController>();
    final expandedList = List.generate(orderController.ordersToFulfill.length, (index) => false.obs);

    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: (){
            Get.back();
          },
            child: Icon(Icons.arrow_back)),
          title: Text('Orders to Fulfill'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: (){
                Get.off(ProfilePage());
              },
              child: CircleAvatar(
                  child: Icon(Icons.person),
                ),
            ),
          ),
        ]
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: orderController.ordersToFulfill.length,
          itemBuilder: (context, index) {
            final order = orderController.ordersToFulfill[index];
            return Obx((){
              final isExpanded = expandedList[index];
              return  Padding(
                padding: const EdgeInsets.only(bottom: 10.0),
                child: GestureDetector(
                  onTap: (){
                    isExpanded.value = !isExpanded.value;
                  },
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Order No:',style: TextStyle(fontWeight: FontWeight.bold),),
                              Text('${order.id}',style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Date   :',style: TextStyle(fontWeight: FontWeight.bold),),
                              Text(
                                DateFormat('dd/MM/yyyy, hh:mm a').format(order.createdDate), // Example: "06/12/2024, 10:30 AM"
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Total:',style: TextStyle(fontWeight: FontWeight.bold),),
                              Container(
                                decoration: BoxDecoration(
                                  color: PRIMARY_COLOR,
                                  borderRadius: BorderRadius.circular(9)
                                ),
                                child:Center(child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Rs 300.0',style: TextStyle(
                                    color: TextColorWhite,
                                    fontWeight: FontWeight.bold
                                  ),),
                                )),
                              )
                            ],
                          ),
                          SizedBox(height: 10,),
                          if(isExpanded.value)
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Product\'s',style: TextStyle(fontWeight: FontWeight.bold),),
                                Padding(
                                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Expanded(
                                        flex: 1,
                                        child: Text(
                                          'No.',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 4,
                                        child: Text(
                                          'Product',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Text(
                                          'Quantity',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: order.productList.length,
                                  itemBuilder: (context,index) {
                                    return Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                                      child: Column(
                                        children: [
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
                                              // Index
                                              Expanded(
                                                flex: 1,
                                                child: Text(
                                                  '${index + 1}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(fontSize: 16),
                                                ),
                                              ),
                                              // Product Name
                                              Expanded(
                                                flex: 4,
                                                child: Text(
                                                  order.productList[index].productName,
                                                  style: TextStyle(fontSize: 16),
                                                ),
                                              ),
                                              // Quantity
                                              Expanded(
                                                flex: 2,
                                                child: Text(
                                                  '${order.productList[index].orderQty}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(fontSize: 16),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                ),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    Container(
                                      width:100,
                                      decoration:BoxDecoration(
                                          color: PRIMARY_COLOR,
                                          borderRadius: BorderRadius.circular(6)
                                      ),
                                      child: Center(child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Packed',style: TextStyle(
                                            color: TextColorWhite,fontWeight: FontWeight.bold
                                        ),),
                                      )),
                                    ),

                                    Container(
                                      width:150,
                                      decoration:BoxDecoration(
                                          color: PRIMARY_COLOR,
                                          borderRadius: BorderRadius.circular(6)
                                      ),
                                      child: Center(child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text('Ready to ship',style: TextStyle(
                                            color: TextColorWhite,fontWeight: FontWeight.bold
                                        ),),
                                      )),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          SizedBox(height: 10,),
                        ],
                      ),
                    ),
                  ),
                ),
              );
            });
          },
        );
      }),
    );
  }
}

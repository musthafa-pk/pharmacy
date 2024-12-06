import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Constants/appColors.dart';
import '../../controllers/product_controller.dart';
import '../../models/productModel.dart';

class ProductListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final productController = Get.find<ProductController>();

    return Scaffold(
      appBar: AppBar(title: Text('Product List')),
      body: Padding(
        padding: const EdgeInsets.all(22.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  flex: 2,
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
                SizedBox(width: 40,),
                Icon(Icons.filter_list_sharp,color: PRIMARY_COLOR,size: 35,)
              ],
            ),
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Products',style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('See all')
                ],
              ),
            ),
            SizedBox(height: 10,),

            Expanded(
              flex: 2,
              child: Obx(() {
                return ListView.builder(
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
                          Text(product.pharmacyName.toString()),
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
            SizedBox(height: 10,),
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Products',style: TextStyle(fontWeight: FontWeight.bold),),
                  Text('See all')
                ],
              ),
            ),
            SizedBox(height: 10,),
            Expanded(
              flex: 2,
              child: Obx(() {
                return ListView.builder(
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
                            Text(product.pharmacyName.toString()),
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
    );
  }
}

class EditProductPage extends StatelessWidget {
  final Product product;
  EditProductPage({required this.product});

  final TextEditingController nameController = TextEditingController();
  final TextEditingController priceController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    nameController.text = product.pharmacyName.toString();
    priceController.text = product.netAmount.toString();

    return Scaffold(
      appBar: AppBar(title: Text('Edit Product')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Product Name'),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Price'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Update logic
                Get.back();
              },
              child: Text('Save'),
            ),
          ],
        ),
      ),
    );
  }
}

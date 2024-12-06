import 'package:pharma/models/productModel.dart';


class Order {
  final int id;
  final int pharmacyId;
  final int salesId;
  final String status;
  final DateTime createdDate;
  final List<Product> productList;

  Order({
    required this.id,
    required this.pharmacyId,
    required this.salesId,
    required this.status,
    required this.createdDate,
    required this.productList,
  });

  factory Order.fromJson(Map<String, dynamic> json) {
    return Order(
      id: json['id'],
      pharmacyId: json['pharmacy_id'],
      salesId: json['sales_id'],
      status: json['status'],
      createdDate: json['created_date'],
      productList: (json['productlist'] as List)
          .map((product) => Product.fromJson(product))
          .toList(),
    );
  }
}
class Product {
  final int id;
  final int salesId;
  final int productId;
  final int orderQty;
  final double netAmount;
  final String? sellingPrice;
  final String? batchNo;
  final String? pharmacyName;
  final String createdDate;
  final String productName;

  Product({
    required this.id,
    required this.salesId,
    required this.productId,
    required this.orderQty,
    required this.netAmount,
    this.sellingPrice,
    this.batchNo,
    this.pharmacyName,
    required this.createdDate,
    required this.productName,
  });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      salesId: json['sales_id'],
      productId: json['product_id'],
      orderQty: json['order_qty'],
      netAmount: json['net_amount'].toDouble(),
      sellingPrice: json['selling_price'],
      batchNo: json['batch_no'],
      pharmacyName: json['pharmacy_name'],
      createdDate: json['created_date'],
      productName: json['productName'],
    );
  }
}

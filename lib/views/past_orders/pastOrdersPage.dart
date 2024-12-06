
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../../Constants/appColors.dart';

class PastOrdersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Simulated past orders data
    final List<Map<String, dynamic>> pastOrders = [
      {'id': 201, 'date': '2024-11-01', 'total': 150.0, 'status': 'Delivered'},
      {'id': 202, 'date': '2024-11-10', 'total': 300.0, 'status': 'Cancelled'},
      {'id': 203, 'date': '2024-11-15', 'total': 200.0, 'status': 'Delivered'},
      {'id': 201, 'date': '2024-11-01', 'total': 150.0, 'status': 'Delivered'},
      {'id': 202, 'date': '2024-11-10', 'total': 300.0, 'status': 'Cancelled'},
      {'id': 203, 'date': '2024-11-15', 'total': 200.0, 'status': 'Delivered'},
      {'id': 201, 'date': '2024-11-01', 'total': 150.0, 'status': 'Delivered'},
      {'id': 202, 'date': '2024-11-10', 'total': 300.0, 'status': 'Cancelled'},
      {'id': 203, 'date': '2024-11-15', 'total': 200.0, 'status': 'Delivered'},
      {'id': 201, 'date': '2024-11-01', 'total': 150.0, 'status': 'Delivered'},
      {'id': 202, 'date': '2024-11-10', 'total': 300.0, 'status': 'Cancelled'},
      {'id': 203, 'date': '2024-11-15', 'total': 200.0, 'status': 'Delivered'},
      {'id': 201, 'date': '2024-11-01', 'total': 150.0, 'status': 'Delivered'},
      {'id': 202, 'date': '2024-11-10', 'total': 300.0, 'status': 'Cancelled'},
      {'id': 203, 'date': '2024-11-15', 'total': 200.0, 'status': 'Delivered'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Past Orders'),
        leading: InkWell(
            onTap: (){
              Get.back();
            },
            child: Icon(Icons.arrow_back,color: TextColorWhite,)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                itemCount: pastOrders.length,
                itemBuilder: (context, index) {
                  final order = pastOrders[index];

                  // Extract data with type checks and null safety
                  final int orderId = order['id'] as int;
                  final String orderDate = order['date'] as String;
                  final double orderTotal = order['total'] as double;
                  final String orderStatus = order['status'] as String;

                  return Card(
                    margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: ListTile(
                        leading: CircleAvatar(
                          backgroundColor: orderStatus == 'Delivered' ? Colors
                              .green : Colors.red,
                          child: Icon(
                            orderStatus == 'Delivered' ? Icons.check : Icons
                                .cancel,
                            color: Colors.white,
                          ),
                        ),
                        title: Text('Order #$orderId'),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Date: $orderDate'),
                            Text('Total: ₹$orderTotal'),
                          ],
                        ),
                        trailing: Column(
                          children: [
                            Text(
                              orderStatus,
                              style: TextStyle(
                                color: orderStatus == 'Delivered'
                                    ? Colors.green
                                    : Colors.red,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            InkWell(onTap: (){
                              _showQrPopup(context);
                            },
                                child: Text('View QR')),
                          ],
                        )
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showQrPopup(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('QR Code'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: 200, // Provide a fixed width
                  height: 200, // Provide a fixed height
                  child: QrImageView(
                    data: '1234567890',
                    version: QrVersions.auto,
                    size: 200.0,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () {
                    // _printQrCode();
                  },
                  child: Text('Print'),
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  // Future<void> _printQrCode(String data) async {
  //   await Printing.layoutPdf(
  //     onLayout: (format) async {
  //       final pdf = pw.Document();
  //
  //       // Add a page with the QR code
  //       pdf.addPage(
  //         pw.Page(
  //           build: (pw.Context context) {
  //             return pw.Center(
  //               child: pw.Container(
  //                 width: 200,
  //                 height: 200,
  //                 child: pw.Image(
  //                   pw.MemoryImage(
  //                     generateQrCodeImage(data),
  //                   ),
  //                 ),
  //               ),
  //             );
  //           },
  //         ),
  //       );
  //
  //       return pdf.save();
  //     },
  //   );
  // }
}

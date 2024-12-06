import 'package:get/get.dart';
import '../controllers/auth_controller.dart';
import '../controllers/product_controller.dart';
import '../controllers/order_controller.dart';

class AppBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
    Get.put(ProductController());
    Get.put(OrderController());
  }
}

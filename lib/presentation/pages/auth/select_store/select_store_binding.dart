import 'package:get/get.dart';
import 'package:template/presentation/pages/auth/select_store/select_store_controller.dart';

class SelectStoreBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SelectStoreController>(() => SelectStoreController());
  }
}

import 'package:get/get.dart';
import 'package:getx/controllers/create_controller.dart';
import 'package:getx/controllers/home_controller.dart';
import 'package:getx/controllers/update_controller.dart';

class RootBinding implements Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => HomeController(), fenix: true);
    Get.lazyPut(() => CreateController(), fenix: true);
    Get.lazyPut(() => UpdateController(), fenix: true);
  }
}
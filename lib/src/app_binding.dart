import 'package:dog_test/src/screens/home_screen/home_controller.dart';
import 'package:get/get.dart';



class AppBinding extends Bindings {
  @override
  void dependencies() {

    Get.lazyPut(() => HomeScreenController());
  }
}
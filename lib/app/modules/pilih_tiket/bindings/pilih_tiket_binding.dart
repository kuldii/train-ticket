import 'package:get/get.dart';

import '../controllers/pilih_tiket_controller.dart';

class PilihTiketBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PilihTiketController>(
      () => PilihTiketController(),
    );
  }
}

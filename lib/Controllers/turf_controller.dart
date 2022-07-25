import 'package:get/get.dart';
import 'package:play_turf/API/services.dart';
import 'package:play_turf/Models/turf_model.dart';

class TurfController extends GetxController {
  late TurfDetails turfList;
  late TurfDetails turfListss;
  // late TurfList turfss;
  // late List list = [turfss.centername];

  var loading = true.obs;

  @override
  void onInit() {
    super.onInit();
    fetchTurf();
  }

  Future fetchTurf() async {
    TurfDetails turfs = await ApiServices().fetchTurfs();
    try {
      turfList = turfs;
      loading.value = false;
    } catch (e) {
      loading = true.obs;
    }
  }
}

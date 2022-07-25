import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:play_turf/API/api_constant.dart';
import 'package:play_turf/Models/booking_model.dart';
import 'package:play_turf/Models/savedkeys.dart';

class BookingController extends GetxController {
  Map userDetails = {};
  var bookingHistory = BookingDatas().obs;
   var isLoading = true.obs;

  @override
  void onInit() {
    super.onInit();
    userDetails = SharedPrefrenceModel.getString('userDetails');
    fetchBkngHistory();
  }

  Future fetchBkngHistory() async {
    String token = userDetails['token'];
    String id = userDetails['user']['_id'];
    Dio dio = Dio(BaseOptions(baseUrl: ApiUrl.baseUrl, headers: {"authToken": token}));
    final response = await dio.get(ApiUrl.bookingDatas + "/$id");
    BookingDatas bookingDatas = BookingDatas.fromJson(response.data);
    
    try {
      if (bookingDatas != null) {
        bookingHistory(bookingDatas);
        isLoading.value = false;
      } else {
        log("==========================onnula==============");
      }
      log(bookingHistory.value.turf!.length.toString());
    } catch (e) {
      Get.snackbar("Server Error", "$e");
      isLoading = true.obs;
    }
  }
}

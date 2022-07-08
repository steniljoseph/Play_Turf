import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:play_turf/api/api_constant.dart';
import 'package:play_turf/model/booking_model.dart';
import 'package:play_turf/model/savedkeys.dart';

class BookingController extends GetxController {
  Map userDetails = {};

  @override
  void onInit() {
    super.onInit();
    userDetails = SharedPrefrenceModel.getString('userDetails');
    fetchBookingDatas();
  }

  Future fetchBookingDatas() async {
    String token = userDetails['token'];
    String id = userDetails['user']['_id'];
    Dio dio = Dio(BaseOptions(baseUrl: ApiUrl.baseUrl, headers: {"authToken": token}));
    final response = await dio.get(ApiUrl.bookingDatas + "/$id");
    BookingDatas bookingDatas = BookingDatas.fromJson(response.data);
    return bookingDatas;
  }
}

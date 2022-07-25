import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:play_turf/API/api_constant.dart';
import 'package:play_turf/Controllers/favourite_controller.dart';
import 'package:play_turf/Models/favourite_model.dart';
import 'package:play_turf/Models/turf_model.dart';

class ApiServices {
  final FavouriteController fv = Get.put(FavouriteController());
  Dio dio = Dio(BaseOptions(baseUrl: ApiUrl.baseUrl));

  Future fetchTurfs() async {
    final response = await dio.get(ApiUrl.getTurfDetails);
    TurfDetails turfDetails = TurfDetails.fromJson(response.data);
    return turfDetails;
  }

  Future fetchFavorites() async {
    String token = fv.userDetails['token'];
    String id = fv.userDetails['user']['_id'];
    Dio dio = Dio(BaseOptions(headers: {"authToken": token}));
    final response = await dio.get(ApiUrl.getFavourites + "/$id");
    FavouriteData favouriteData = FavouriteData.fromJson(response.data);
    log('+++++++++++++++++++++++++++++++++++++');
    return favouriteData;
  }
}

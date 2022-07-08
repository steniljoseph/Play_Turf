import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';

import 'package:play_turf/model/favourite_model.dart';
import 'package:play_turf/model/savedkeys.dart';
import '../API Service/api_constant.dart';

class FavouriteController extends GetxController {
  Map userDetails = {};
  var isLoading = true.obs;
  var favList = <FavouriteData>[].obs;

  @override
  void onInit() {
    super.onInit();
    userDetails = SharedPrefrenceModel.getString('userDetails');
    fetchFavorites();
    // addFavourite();
  }

  Future<List<FavouriteData>> fetchFavorites() async {
    String token = userDetails['token'];
    String id = userDetails['user']['_id'];
    Dio dio = Dio(BaseOptions(baseUrl: ApiUrl.baseUrl, headers: {"authToken": token}));
    final response = await dio.get(ApiUrl.getFavourites + "/$id");
    // var jsonString = response.data;
    // return favouriteDataFromJson(jsonString);
    favList = FavouriteData.fromJson(response.data) as RxList<FavouriteData>;
    log(favList.string); 
    return favList;
  }

  Future addFavourite(String turfId) async {
    String token = userDetails['token'];
    String id = userDetails['user']['_id'];
    Dio dio = Dio(BaseOptions(baseUrl: ApiUrl.baseUrl, headers: {"authToken": token}));
    final Map data = {"userId": id, "turfId": turfId};
    final response = await dio.post(ApiUrl.addFavourite, data: jsonEncode(data));
    log(response.toString());
    return response;
    // AddFavouriteData addFavouriteData = AddFavouriteData.fromJson(response.data);
    // log(response.toString());
    // // log(addFavouriteData.turf[0].toString());
    // update();
    // return addFavouriteData;
  }
}

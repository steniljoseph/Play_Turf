import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:play_turf/api/api_constant.dart';
import 'package:play_turf/model/favourite_model.dart';
import 'package:play_turf/model/savedkeys.dart';

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
    List<FavouriteData> favouriteData =
        FavouriteData.fromJson(response.data) as List<FavouriteData>;
    return favouriteData;
  }

  Future addFavourite(String turfId) async {
    String token = userDetails['token'];
    String id = userDetails['user']['_id'];
    Dio dio = Dio(BaseOptions(baseUrl: ApiUrl.baseUrl, headers: {"authToken": token}));
    final Map<String, dynamic> data = {"userId": id, "turfId": turfId};
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

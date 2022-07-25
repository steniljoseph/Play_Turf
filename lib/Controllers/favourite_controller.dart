import 'dart:convert';
import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:play_turf/API/api_constant.dart';
import 'package:play_turf/Models/favourite_model.dart';
import 'package:play_turf/Models/savedkeys.dart';

class FavouriteController extends GetxController {
  Map userDetails = {};
  var isLoading = true.obs;
  var fav = FavouriteData(turf: []).obs;

  @override
  void onInit() {
    super.onInit();
    userDetails = SharedPrefrenceModel.getString('userDetails');
    fetchFavorites();
    // addFavourite();
  }

  // Future fetchFavorite() async {
  //   var fav = await ApiServices().fetchFavorites();

  // }

  Future fetchFavorites() async {
    String token = userDetails['token'];
    String id = userDetails['user']['_id'];
    Dio dio = Dio(BaseOptions(baseUrl: ApiUrl.baseUrl, headers: {"authToken": token}));
    final response = await dio.get(ApiUrl.getFavourites + "/$id");
    FavouriteData favouriteData = FavouriteData.fromJson(response.data);

    try {
      if (favouriteData != null) {
        fav(favouriteData);
        isLoading.value = false;
      } else {
        log("==========================onnula==============");
      }
      log(fav.value.turf!.length.toString());
    } catch (e) {
      Get.snackbar("Server Error", "$e");
      isLoading = true.obs;
    }

    // var jsonString = response.data;
    // return favouriteDataFromJson(jsonString);
    // favList = FavouriteData.fromJson(response.data) as RxList<FavouriteData>;
    // log(favList.toString());
    // return favList;
  }

  Future addFavourite(String turfId) async {
    String token = userDetails['token'];
    String id = userDetails['user']['_id'];
    Dio dio = Dio(BaseOptions(baseUrl: ApiUrl.baseUrl, headers: {"authToken": token}));
    final Map data = {"userId": id, "turfId": turfId};
    final response = await dio.post(ApiUrl.addFavourite, data: jsonEncode(data));

    return response;
    // AddFavouriteData addFavouriteData = AddFavouriteData.fromJson(response.data);
    // log(response.toString());
    // // log(addFavouriteData.turf[0].toString());
    // update();
    // return addFavouriteData;
  }
}

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:play_turf/API/api_constant.dart';
import 'package:play_turf/API/services.dart';
import 'package:play_turf/Models/banner.dart';
import 'package:play_turf/Models/offer_model.dart';
import 'package:play_turf/Models/savedkeys.dart';
import 'package:play_turf/Models/turf_model.dart';

class HomePageController extends GetxController {
  Dio dio = Dio(BaseOptions(baseUrl: ApiUrl.baseUrl));
  Map userDetails = {};
  RxInt bannerIndex = 0.obs;
  var offerIndex = 0.obs;
  late TurfDetails turfList;
  var loading = true.obs;

  @override
  void onInit() {
    super.onInit();
    userDetails = SharedPrefrenceModel.getString('userDetails');
    fetchBanner();
    fetchOffers();
    fetchTurfs();
  }

  void bannerChange(int currentIndex) {
    bannerIndex.value = currentIndex;
  }

  void offerChange(int currentIndex) {
    offerIndex.value = currentIndex;
  }

  Future<BannerDatas> fetchBanner() async {
    final response = await dio.get(ApiUrl.getBannerData);
    BannerDatas bannerDatas = BannerDatas.fromJson(response.data);
    return bannerDatas;
  }

  Future<OfferDatas> fetchOffers() async {
    final response = await dio.get(ApiUrl.getOfferData);
    OfferDatas offerDatas = OfferDatas.fromJson(response.data);
    return offerDatas;
  }

  Future fetchTurfs() async {
    var turfs = await ApiServices().fetchTurfs();
    try {
      turfList = turfs;
      loading.value = false;
    } catch (e) {
      // Get.snackbar("Server Error", "$e");
      loading = true.obs;
    }
  }

  // Future<TurfDetails> fetchTurfs() async {
  //   final response = await dio.get(ApiUrl.getTurfDetails);
  //   TurfDetails turfDetails = TurfDetails.fromJson(response.data);
  //   return turfDetails;
  // }
}

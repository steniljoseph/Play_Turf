import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:play_turf/api/api_constant.dart';
import 'package:play_turf/model/banner.dart';
import 'package:play_turf/model/offer_model.dart';
import 'package:play_turf/model/savedkeys.dart';
import 'package:play_turf/model/turf_model.dart';

class HomePageController extends GetxController {
  Dio dio = Dio(BaseOptions(baseUrl: ApiUrl.baseUrl));
  Map userDetails = {};
  RxInt bannerIndex = 0.obs;
  var offerIndex = 0.obs;

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

  // fetchBanner() async {
  //   try {
  //     final response = await Dio().get(ApiUrl.baseUrl + ApiUrl.getBannerData);
  //     if (response.statusCode == 200) {
  //       banner = response.data;
  //       log(banner.toString());

  //       bannerDetails.add(BannerDetails(
  //           message: banner['banner'][0]['description'].toString(),
  //           banner: banner['banner'][0]['bannerImage'].toString()));
  //       bannerDetails.add(BannerDetails(
  //           message: banner['banner'][1]['description'].toString(),
  //           banner: banner['banner'][1]['bannerImage'].toString()));
  //     } else {
  //       throw DioError;
  //     }
  //   } catch (e) {
  //     log(e.toString());
  //   }
  // }

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

  Future<TurfDetails> fetchTurfs() async {
    final response = await dio.get(ApiUrl.getTurfDetails);
    TurfDetails turfDetails = TurfDetails.fromJson(response.data);
    return turfDetails;
  }
}

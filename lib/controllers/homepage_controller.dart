import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:play_turf/api/api_constant.dart';
import 'package:play_turf/model/banner_model.dart';
import 'package:play_turf/model/offer_model.dart';
import 'package:play_turf/model/savedkeys.dart';

class HomePageController extends GetxController {
  late dynamic banner;
  late dynamic offer;
  late dynamic turf;
  List<BannerDetails> bannerDetails = [];
  List<OfferDetails> offerDetails = [];
  Map userDetails = {};
  var bannerIndex = 0.obs;
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

  fetchBanner() async {
    try {
      final response = await Dio().get(ApiUrl.baseUrl + ApiUrl.getBannerData);
      if (response.statusCode == 200) {
        banner = response.data;

        bannerDetails.add(BannerDetails(
            message: banner['banner'][0]['description'].toString(),
            banner: banner['banner'][0]['bannerImage'].toString()));
        bannerDetails.add(BannerDetails(
            message: banner['banner'][1]['description'].toString(),
            banner: banner['banner'][1]['bannerImage'].toString()));
      } else {
        throw DioError;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  fetchOffers() async {
    try {
      final response = await Dio().get(ApiUrl.baseUrl + ApiUrl.getOfferData);
      if (response.statusCode == 200) {
        offer = response.data;
        // log(offer);
        // offerDetails.add(OfferDetails(
        //   offerPercent: offer['offer'][0]['offerPercent'].toString(),
        //   centername: offer['offer'][0]['turfDetails'][0]['centername'].toString(),
        //   price: offer['offer'][0]['turfDetails'][0]['price'].toString(),
        //   image: offer['offer'][0]['turfDetails'][0]['turfPictures'][0],
        // ));
        // offerDetails.add(OfferDetails(
        //   offerPercent: offer['offer'][1]['offerPercent'].toString(),
        //   centername: offer['offer'][1]['turfDetails'][0]['centername'].toString(),
        //   price: offer['offer'][1]['turfDetails'][0]['price'].toString(),
        //   image: offer['offer'][1]['turfDetails'][0]['turfPictures'][0],
        // ));

        log('offers');
        print(offer['message']);
        print(offer['offer'][1]['turfDetails'][0]['turfPictures'][0]);
      } else {
        throw DioError;
      }
    } catch (e) {
      log(e.toString());
    }
  }

  fetchTurfs() async {
    try {
      final response = await Dio().get('https://sudheeshm.herokuapp.com/admin_panel/turfs');
      if (response.statusCode == 200) {
        turf = response.data;
        // log(offer);
        // offerDetails.add(OfferDetails(
        //   offerPercent: offer['offer'][0]['offerPercent'].toString(),
        //   centername: offer['offer'][0]['turfDetails'][0]['centername'].toString(),
        //   price: offer['offer'][0]['turfDetails'][0]['price'].toString(),
        //   image: offer['offer'][0]['turfDetails'][0]['turfPictures'][0],
        // ));
        // offerDetails.add(OfferDetails(
        //   offerPercent: offer['offer'][1]['offerPercent'].toString(),
        //   centername: offer['offer'][1]['turfDetails'][0]['centername'].toString(),
        //   price: offer['offer'][1]['turfDetails'][0]['price'].toString(),
        //   image: offer['offer'][1]['turfDetails'][0]['turfPictures'][0],
        // ));

        log('turfs');
        print(turf['message']);
        print(turf['turf'][1]['centername'].toString());
      } else {
        throw DioError;
      }
    } catch (e) {
      log(e.toString());
    }
  }
}

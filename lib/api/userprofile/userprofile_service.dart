import 'package:dio/dio.dart';
import 'package:play_turf/api/api_constant.dart';
import 'package:play_turf/model/user_login_response.dart';

class GetUserProfileServices {
  Future<List<User>?> getUserProfileDetails() async {
    Dio dio = Dio();
    try {
      Response response = await dio.get(
        ApiUrl.baseUrl + ApiUrl.getUserProfilePath,
      );
      if (response.statusCode == 200) {
        print('jjj');
        List<User> _model = userLoginResponseDataFromJson(response.data) as List<User>;
        return _model;
      }
    } catch (e) {
      print(e.toString());
    }
    print('hii');
    return null;
  }
}

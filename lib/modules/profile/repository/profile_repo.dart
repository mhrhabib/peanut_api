import 'package:peanut_api/api/base_client.dart';
import 'package:peanut_api/common/storage.dart';
import 'package:dio/dio.dart' as dio;
import 'package:peanut_api/modules/profile/model/profile_model.dart';
import 'package:peanut_api/utils/urls.dart';

class ProfileRepo {
  static Future<ProfileModel> getProfile() async {
    var data = {
      'login': storage.read(StoreKeys.emailId),
      'token': storage.read(StoreKeys.apiToken).toString(),
    };
    print(data);
    try {
      dio.Response response =
          await BaseClient.post(url: Urls.profile, payload: data);

      if (response.statusCode == 200) {
        print('profile>>>>>>>>>>>> ${response.data}');
        return ProfileModel.fromJson(response.data);
      }
      throw '${response.statusCode}+ ${response.statusMessage}';
    } catch (e) {
      rethrow;
    }
  }

  static Future getPhoneNumber() async {
    var data = {
      'login': storage.read(StoreKeys.emailId),
      'token': storage.read(StoreKeys.apiToken).toString(),
    };
    print(data);
    try {
      dio.Response response =
          await BaseClient.post(url: Urls.lastFourDigits, payload: data);

      if (response.statusCode == 200) {
        print('profile>>>>>>>>>>>> ${response.data}');
        return response.data;
      }
      throw '${response.statusCode}+ ${response.statusMessage}';
    } catch (e) {
      rethrow;
    }
  }
}

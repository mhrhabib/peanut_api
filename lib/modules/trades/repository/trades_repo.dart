import 'package:peanut_api/api/base_client.dart';
import 'package:peanut_api/common/storage.dart';
import 'package:dio/dio.dart' as dio;
import 'package:peanut_api/utils/urls.dart';

class TradesRepo {
  static Future getTrades() async {
    var data = {
      'login': storage.read(StoreKeys.emailId),
      'token': storage.read(StoreKeys.apiToken).toString(),
    };
    print(data);
    try {
      dio.Response response =
          await BaseClient.post(url: Urls.trades, payload: data);
      print(response.statusCode);
      if (response.statusCode == 200) {
        print(response.data);
        return response.data;
      }
    } catch (e) {
      rethrow;
    }
  }
}

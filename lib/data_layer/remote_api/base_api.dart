import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dog_app/core/utils/logg.dart';

abstract class IApiHandler {
  Future<dynamic> get(String path);
}

class ApiHandler extends IApiHandler {
  final Dio _dio = Dio();
  final AppLog appLog = AppLog('ApiHandler');
  @override
  Future get(String path) async {
    try {
      Response response = await _dio.get(path);

      if (response.statusCode == 200) {
        return response;
      } else if (response.statusCode == 401) {
        throw Exception("Unauthorized");
      } else if (response.statusCode == 500) {
        throw Exception("Server Error");
      } else {
        throw Exception("Something does wen't wrong");
      }
    } on SocketException catch (e) {
      appLog.error('', e.toString());
      throw Exception("No Internet Connection");
    } on FormatException catch (e) {
      appLog.error('', e.toString());
      throw Exception("Bad response format");
    } on DioError catch (e) {
      appLog.error('', e.toString());
      throw Exception(e);
    } catch (e) {
      appLog.error('', e.toString());
      throw Exception(e);
    }
  }
}

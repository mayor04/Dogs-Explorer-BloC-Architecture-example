import 'package:dio/dio.dart';
import 'package:dog_app/core/utils/logg.dart';
import 'package:dog_app/data_layer/remote_api/base_api.dart';

class DogApi {
  var log = AppLog('DogApi');
  final IApiHandler _apiHandler;

  DogApi(this._apiHandler);

  Future<List<dynamic>> getRadomDogImage(
      {required String breedName, String? subBreedName, int count = 1}) async {
    try {
      //TODO: put path in a constant string file
      var path = 'https://dog.ceo/api/breed/$breedName';
      if (subBreedName != null) {
        path += '/$subBreedName';
      }

      path += '/images/random/$count';

      var response = await _apiHandler.get(path);
      var responseMap = response.data;

      if (responseMap['status'] != 'success') {
        throw 'failed to retrieve image';
      }

      var image = responseMap['message'] as List;
      return image;
    } on DioError catch (e) {
      log.error('getRandomDogImage()', 'Dio Error $e');
      //TODO: check for connection errors

      throw 'Uknown Error occured';
    } catch (e) {
      log.error('getRandomDogImage()', e.toString());
      return [];
    }
  }
}

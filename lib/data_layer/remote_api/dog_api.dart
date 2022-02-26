import 'package:dio/browser_imp.dart';
import 'package:dio/dio.dart';
import 'package:dog_app/core/utils/logg.dart';

class DogApi {
  late Dio _dio;

  DogApi() {
    _dio = Dio();
  }

  Future<List<String>> getRadomDogImage(
      {required String breedName, String? subBreedName, int count = 1}) async {
    try {
      var path = '/$breedName';
      if (subBreedName != null) {
        path += '/$subBreedName';
      }

      path += '/image/random/$count';

      var response = await _dio.get(path);
      var responseMap = response.data;

      if (responseMap['status'] != 'success') {
        throw 'failed to retrieve image';
      }

      var image = responseMap['message'] as List<String>;
      return image;
    } on DioError catch (e) {
      logD('DogApi > getRandomDogImage()', 'Dio Error $e');
      //TODO: check for connection errors

      throw 'Uknown Error occured';
    } catch (e) {
      logD('DogApi > getRandomDogImage()', e);
      return [];
    }
  }
}

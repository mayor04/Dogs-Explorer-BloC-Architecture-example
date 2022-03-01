import 'package:dog_app/data_layer/local_data_source/local_breed_list.dart';
import 'package:dog_app/data_layer/models/breed_data_model.dart';
import 'package:dog_app/data_layer/remote_api/dog_api.dart';

class BreedRepository {
  late final LocalBreedList _localBreedList;
  late final DogApi _dogApi;

  String baseUrl = '';

  BreedRepository({
    required LocalBreedList localBreedList,
    required DogApi dogApi,
  }) {
    _localBreedList = localBreedList;
    _dogApi = dogApi;
  }

  Future<List<BreedDataModel>> listOfBreeds(
      {int start = 0, int limit = 20}) async {
    List<BreedDataModel> breedData = [];

    //Get the list locally
    var breedList = _localBreedList.getBreedList(start: start, limit: limit);

    for (var breed in breedList) {
      String breedName = breed['name'];

      //From the list get a matching random image for each breed
      List images = [];

      try {
        images = await _dogApi.getRadomDogImage(
          breedName: breedName,
        );
      } catch (e) {
        break;
      }

      if (images.isEmpty) {
        continue;
      }

      //in the loop add the image to the breed object
      var breedModel = BreedDataModel(
        name: breedName,
        imageUrl: images[0],
        subBreed: breed['subBreeds'].cast<String>() ?? [],
      );

      breedData.add(breedModel);
    }

    return breedData;
  }
}

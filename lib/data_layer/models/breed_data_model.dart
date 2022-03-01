class BreedDataModel {
  final String name;
  final String imageUrl;
  final List<String> subBreed;

  int get subBreedCount => subBreed.length;

  BreedDataModel({
    required this.name,
    required this.imageUrl,
    required this.subBreed,
  });

  factory BreedDataModel.fromJson(Map<String, dynamic> json) {
    return BreedDataModel(
      name: json['name'],
      imageUrl: json['imageUrl'],
      subBreed: json['subBreed'].cast<String>(),
    );
  }

  @override
  String toString() {
    return 'BreedDataodel{name: $name, imageUrl: $imageUrl, subBreed: $subBreed}';
  }
}

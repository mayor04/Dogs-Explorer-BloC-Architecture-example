class BreedDataodel {
  final String name;
  final String imageUrl;
  final List<String> subBreed;

  BreedDataodel({
    required this.name,
    required this.imageUrl,
    required this.subBreed,
  });

  factory BreedDataodel.fromJson(Map<String, dynamic> json) {
    return BreedDataodel(
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

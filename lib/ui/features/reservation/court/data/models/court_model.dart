import 'package:equatable/equatable.dart';

class CourtModel extends Equatable {
  const CourtModel({
    required this.id,
    required this.name,
    required this.stars,
    required this.description,
    required this.thumbnail,
    required this.photos,
  });

  const CourtModel.empty()
      : this(
          id: 0,
          name: '',
          thumbnail: '',
          stars: 0,
          description: '',
          photos: const [],
        );

  factory CourtModel.fromJson(Map<String, dynamic> json) {
    return CourtModel(
      id: json['id'] as int,
      name: json['name'] as String,
      thumbnail: json['thumbnail'] as String,
      stars: json['stars'] as double,
      description: json['description'] as String,
      photos: List<String>.from(
        (json['photos'] as List).map((x) => x),
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'thumbnail': thumbnail,
      'stars': stars,
      'description': description,
      'photos': List<String>.from(
        photos.map((x) => x),
      ),
    };
  }

  final int id;
  final String name;
  final double stars;
  final String description;
  final String thumbnail;
  final List<String> photos;

  @override
  List<Object> get props => [
        id,
        name,
        stars,
        description,
        thumbnail,
        photos,
      ];
}

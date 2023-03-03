class DoctorsModel {
  final String name;
  final String imageUrl;
  final String description;
  final String specialization;

  DoctorsModel({
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.specialization,
  });

  factory DoctorsModel.fromJson(Map<String, dynamic> json) {
    return DoctorsModel(
      name: json['name'],
      imageUrl: json['imageUrl'],
      description: json['description'],
      specialization: json['specialization'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'imageUrl': imageUrl,
      'description': description,
      'specialization': specialization,
    };
  }
}
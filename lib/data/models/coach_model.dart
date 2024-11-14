class CoachModel {
  String image;
  String name;
  String description;
  String level;
  String rate;
  String city;

  CoachModel({
    required this.image,
    required this.name,
    required this.description,
    required this.level,
    required this.rate,
    required this.city,
  });

  // Factory method to create a CoachModel instance from JSON data
  factory CoachModel.fromJson(Map<String, dynamic> json) {
    return CoachModel(
      image: json['image'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      level: json['level'] as String,
      rate: json['rate'] as String,
      city: json['city'] as String,
    );
  }

  // Method to convert a CoachModel instance to JSON
  Map<String, dynamic> toJson(CoachModel coach) {
    return {
      'image': image,
      'name': name,
      'description': description,
      'level': level,
      'rate': rate,
      'city': city,
    };
  }
}

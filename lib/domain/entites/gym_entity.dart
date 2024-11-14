class GymEntity {
  final int id;
  final String password;
  final String email;
  final int role;
  final DateTime createdAt;
  final DateTime updatedAt;
  final String phoneNumber;
  final String? description;
  final String name;
  final double latitude;
  final double longitude;
  final String checkinPrice;
  final String openTime;
  final String? closeTime;
  final String? address;
  final String city;
  final bool isBanned;
  final String? phone;
  final String? qrCode;
  final String? profilePicture;

  GymEntity({
    required this.id,
    required this.password,
    required this.email,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
    required this.phoneNumber,
    this.description,
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.checkinPrice,
    required this.openTime,
    this.closeTime,
    this.address,
    required this.city,
    required this.isBanned,
    this.phone,
    this.qrCode,
    this.profilePicture,
  });

  // Factory method to create a GymEntity instance from JSON data
  factory GymEntity.fromJson(Map<String, dynamic> json) {
    return GymEntity(
      id: json['id'],
      password: json['password'],
      email: json['email'],
      role: json['role'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
      phoneNumber: json['phone_number'],
      description: json['description'],
      name: json['name'],
      latitude: double.parse(json['latitude']),
      longitude: double.parse(json['longitude']),
      checkinPrice: json['checkinPrice'],
      openTime: json['open_time'],
      closeTime: json['close_time'],
      address: json['address'],
      city: json['city'],
      isBanned: json['isBanned'],
      phone: json['phone'],
      qrCode: json['qrCode'],
      profilePicture: json['profilePicture'],
    );
  }

  // Method to convert a GymEntity instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'password': password,
      'email': email,
      'role': role,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
      'phone_number': phoneNumber,
      'description': description,
      'name': name,
      'latitude': latitude.toString(),
      'longitude': longitude.toString(),
      'checkinPrice': checkinPrice,
      'open_time': openTime,
      'close_time': closeTime,
      'address': address,
      'city': city,
      'isBanned': isBanned,
      'phone': phone,
      'qrCode': qrCode,
      'profilePicture': profilePicture,
    };
  }
}

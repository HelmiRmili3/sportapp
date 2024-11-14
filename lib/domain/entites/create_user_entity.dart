// {
//   "email": "helmirmili@gmail.com",
//   "password": "user123",
//   "profilePicture": "",
//   "first_name": "Helmi",
//   "last_name": "Rmili",
//   "phone_number": "+21697878345"
// }

// models/user.dart
class CreateUser {
  String email;
  String password;
  String profilePicture;
  String firstName;
  String lastName;
  String phoneNumber;

  CreateUser({
    required this.email,
    required this.password,
    required this.profilePicture,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
  });

  // Factory constructor to create a User from JSON
  factory CreateUser.fromJson(Map<String, dynamic> json) {
    return CreateUser(
      email: json['email'] as String,
      password: json['password'] as String,
      profilePicture: json['profilePicture'] as String? ?? '',
      firstName: json['first_name'] as String,
      lastName: json['last_name'] as String,
      phoneNumber: json['phone_number'] as String,
    );
  }

  // Method to convert a User to JSON
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'profilePicture': profilePicture,
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
    };
  }
}

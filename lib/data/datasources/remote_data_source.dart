// remote_data_source.dart

import 'package:sportapp/domain/entites/create_user_entity.dart';
import 'package:sportapp/domain/entites/update_user_entity.dart';
import 'package:dartz/dartz.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../shared/errors/failure.dart';

abstract class RemoteDataSource {
  // http://localhost:4001/v1/auth/login
  final String baseUrl = 'http://10.0.2.2:4001/v1';

  final String jwtToken;
  RemoteDataSource(this.jwtToken);

  // Authentication methods
  Future<Either<Failure, Map<String, dynamic>>> login(
      String email, String password);

  Future<Either<String, Map<String, dynamic>>> logout(int userId);
  Future<Either<String, Map<String, dynamic>>> forgotPassword(String email);
  Future<Either<String, Map<String, dynamic>>> changePassword(
      int id, String oldPassword, String newPassword);
  Future<Either<String, Map<String, dynamic>>> getUserProfile();
  Future<Either<String, Map<String, dynamic>>> updateUserProfile(
      int id, UpdateUserEntity updateUserProfile);
  Future<Either<String, Map<String, dynamic>>> register(CreateUser newUser);
  Future<Either<String, Map<String, dynamic>>> getAllGyms();
  Future<Either<String, Map<String, dynamic>>> getGymById(String gymId);
  Future<Either<String, Map<String, dynamic>>> getAllCoaches();
  Future<Either<String, Map<String, dynamic>>> getCoachById(String coachId);
}

// remote_data_source_impl.dart

class RemoteDataSourceImpl extends RemoteDataSource {
  final http.Client client;

  RemoteDataSourceImpl({
    required this.client,
    required String jwtToken,
  }) : super(jwtToken);

  @override
  Future<Either<Failure, Map<String, dynamic>>> login(
      String email, String password) async {
    try {
      final response = await client.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body:
            jsonEncode(<String, String>{'email': email, 'password': password}),
      );
      print("=====================> ${response.body}");
      if (response.statusCode == 201) {
        return Right(json.decode(response.body));
      } else {
        return Left(Failure("Login failed: ${response.body}"));
      }
    } catch (e) {
      return Left(Failure("Login failed: $e"));
    }
  }

  @override
  Future<Either<String, Map<String, dynamic>>> logout(int userId) async {
    try {
      final response = await client.post(
        Uri.parse('$baseUrl/auth/logout'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $jwtToken',
        },
        body: jsonEncode(<String, int>{'userId': userId}),
      );
      if (response.statusCode == 200) {
        return Right(json.decode(response.body));
      } else {
        return Left('Logout failed: ${response.body}');
      }
    } catch (e) {
      return Left('Error: $e');
    }
  }

  @override
  Future<Either<String, Map<String, dynamic>>> forgotPassword(
      String email) async {
    try {
      final response = await client.post(
        Uri.parse('$baseUrl/auth/forgot-password'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(<String, String>{'email': email}),
      );
      if (response.statusCode == 200) {
        return Right(json.decode(response.body));
      } else {
        return Left('Failed to send password reset email: ${response.body}');
      }
    } catch (e) {
      return Left('Error: $e');
    }
  }

  @override
  Future<Either<String, Map<String, dynamic>>> changePassword(
      int id, String oldPassword, String newPassword) async {
    try {
      final response = await client.post(
        Uri.parse('$baseUrl/auth/changepassword?id=$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $jwtToken',
        },
        body: jsonEncode(<String, String>{
          'oldPassword': oldPassword,
          'newPassword': newPassword
        }),
      );
      if (response.statusCode == 200) {
        return Right(json.decode(response.body));
      } else {
        return Left('Failed to change password: ${response.body}');
      }
    } catch (e) {
      return Left('Error: $e');
    }
  }

  @override
  Future<Either<String, Map<String, dynamic>>> register(
      CreateUser newUser) async {
    try {
      final response = await client.post(
        Uri.parse('$baseUrl/auth/signup/user'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(newUser.toJson()),
      );
      if (response.statusCode == 200) {
        return Right(json.decode(response.body));
      } else {
        return Left('Failed to create account: ${response.body}');
      }
    } catch (e) {
      return Left('Error: $e');
    }
  }

  @override
  Future<Either<String, Map<String, dynamic>>> getUserProfile() async {
    try {
      final response = await client.get(
        Uri.parse('$baseUrl/user/profile'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $jwtToken',
        },
      );
      if (response.statusCode == 200) {
        return Right(json.decode(response.body));
      } else {
        return Left('Failed to retrieve user profile data: ${response.body}');
      }
    } catch (e) {
      return Left('Error: $e');
    }
  }

  @override
  Future<Either<String, Map<String, dynamic>>> updateUserProfile(
      int id, UpdateUserEntity updateUserProfile) async {
    try {
      final response = await client.put(
        Uri.parse('$baseUrl/user/?id=$id'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $jwtToken',
        },
        body: jsonEncode(updateUserProfile.toJson()),
      );
      if (response.statusCode == 200) {
        return Right(json.decode(response.body));
      } else {
        return Left('Failed to update user profile: ${response.body}');
      }
    } catch (e) {
      return Left('Error: $e');
    }
  }

  @override
  Future<Either<String, Map<String, dynamic>>> getAllGyms() async {
    try {
      final response = await client.get(
        Uri.parse('$baseUrl/gym/all'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $jwtToken',
        },
      );
      if (response.statusCode == 200) {
        return Right(json.decode(response.body));
      } else {
        return Left('Failed to retrieve gyms: ${response.body}');
      }
    } catch (e) {
      return Left('Error: $e');
    }
  }

  @override
  Future<Either<String, Map<String, dynamic>>> getGymById(String gymId) async {
    try {
      final response = await client.get(
        Uri.parse('$baseUrl/gym/$gymId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $jwtToken',
        },
      );
      if (response.statusCode == 200) {
        return Right(json.decode(response.body));
      } else {
        return Left('Failed to retrieve gym: ${response.body}');
      }
    } catch (e) {
      return Left('Error: $e');
    }
  }

  @override
  Future<Either<String, Map<String, dynamic>>> getAllCoaches() async {
    try {
      final response = await client.get(
        Uri.parse('$baseUrl/coach/all'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $jwtToken',
        },
      );
      if (response.statusCode == 200) {
        return Right(json.decode(response.body));
      } else {
        return Left('Failed to retrieve coaches: ${response.body}');
      }
    } catch (e) {
      return Left('Error: $e');
    }
  }

  @override
  Future<Either<String, Map<String, dynamic>>> getCoachById(
      String coachId) async {
    try {
      final response = await client.get(
        Uri.parse('$baseUrl/coach/$coachId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $jwtToken',
        },
      );
      if (response.statusCode == 200) {
        return Right(json.decode(response.body));
      } else {
        return Left('Failed to retrieve coach: ${response.body}');
      }
    } catch (e) {
      return Left('Error: $e');
    }
  }
}

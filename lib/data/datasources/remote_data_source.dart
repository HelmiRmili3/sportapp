// remote_data_source.dart

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sportapp/data/models/failure_response_model.dart';
import 'package:sportapp/data/models/login_response_model.dart';
import 'package:sportapp/data/models/update_user_response_model.dart';
import 'package:sportapp/domain/entites/update_user_entity.dart';
import 'package:dartz/dartz.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../core/app_urls.dart';
import '../models/coaches_response_model.dart';
import '../models/logout_response_model.dart';
import '../models/profile_response_model.dart';
import '../models/register_user_response_model.dart';
import '../models/user_register_request_model.dart';

abstract class RemoteDataSource {
  // http://localhost:4001/v1/auth/login
  final String baseUrl = AppUrls.apiUrl;

  RemoteDataSource();

  // Authentication methods
  // done
  Future<Either<FailureResponse, LoginResponse>> login(
      String email, String password);
  Future<Either<FailureResponse, LogoutResponse>> logout(String userId);
  Future<Either<FailureResponse, RegisterUserResponse>> register(
      UserRegisterRequestModel newUser);
  Future<Either<FailureResponse, UserProfileResponse>> getUserProfile();
  Future<Either<FailureResponse, UpdateUserResponse>> updateUserProfile(
      UpdateUserEntity updateUserProfile);
  // in progress
  Future<Either<FailureResponse, CoachesResponse>> getCoachById(String coachId);

  // not done yet

  Future<Either<String, Map<String, dynamic>>> forgotPassword(String email);
  Future<Either<String, Map<String, dynamic>>> changePassword(
      int id, String oldPassword, String newPassword);

  Future<Either<String, Map<String, dynamic>>> getAllGyms();
  Future<Either<String, Map<String, dynamic>>> getGymById(String gymId);
  Future<Either<FailureResponse, CoachesResponse>> getAllCoaches();
}

// remote_data_source_impl.dart
class RemoteDataSourceImpl extends RemoteDataSource {
  final http.Client client;
  final SharedPreferences prefs;
  RemoteDataSourceImpl({
    required this.client,
    required this.prefs,
  }) : super();

  @override
  Future<Either<FailureResponse, LoginResponse>> login(
      String email, String password) async {
    try {
      final response = await client.post(
        Uri.parse('$baseUrl/auth/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(
          <String, String>{'email': email, 'password': password},
        ),
      );

      if (response.statusCode == 201) {
        return Right(LoginResponse.fromJson(json.decode(response.body)));
      } else {
        return Left(FailureResponse.fromJson(json.decode(response.body)));
      }
    } catch (e) {
      return Left(
        FailureResponse(
          message: 'Login failed ',
          statusCode: 500,
          error: e.runtimeType.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<FailureResponse, LogoutResponse>> logout(String userId) async {
    try {
      String? jwtToken = prefs.getString('jwtToken');
      final response = await client.post(
        Uri.parse('$baseUrl/auth/logout'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $jwtToken',
        },
        body: jsonEncode(<String, String>{'userId': userId}),
      );

      if (response.statusCode == 201) {
        return Right(LogoutResponse.fromJson(json.decode(response.body)));
      } else {
        return Left(FailureResponse.fromJson(json.decode(response.body)));
      }
    } catch (e) {
      return Left(
        FailureResponse(
          message: 'Logout failed ',
          statusCode: 500,
          error: e.runtimeType.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<FailureResponse, RegisterUserResponse>> register(
      UserRegisterRequestModel newUser) async {
    try {
      debugPrint("================== newUser: ${newUser.toJson()}");

      final response = await client.post(
        Uri.parse('$baseUrl/auth/signup/user'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8'
        },
        body: jsonEncode(newUser.toJson()),
      );

      if (response.statusCode == 201) {
        return Right(RegisterUserResponse.fromJson(json.decode(response.body)));
      } else {
        return Left(FailureResponse.fromJson(json.decode(response.body)));
      }
    } catch (e) {
      debugPrint("================== error: $e");
      return Left(
        FailureResponse(
          message: 'Register failed: ${e.toString()}',
          statusCode: 500,
          error: e.runtimeType.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<FailureResponse, UserProfileResponse>> getUserProfile() async {
    try {
      String? jwtToken = prefs.getString('jwtToken');

      final response = await client.get(
        Uri.parse('$baseUrl/user/profile'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $jwtToken',
        },
      );
      if (response.statusCode == 200) {
        return Right(UserProfileResponse.fromJson(json.decode(response.body)));
      } else {
        return Left(FailureResponse.fromJson(json.decode(response.body)));
      }
    } catch (e, stackTrace) {
      debugPrint(
          "================== Fetch user profile data faild: $e, $stackTrace");
      return Left(
        FailureResponse(
          message: 'Fetch User Faild: ${e.toString()}',
          statusCode: 500,
          error: e.runtimeType.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<FailureResponse, UpdateUserResponse>> updateUserProfile(
      UpdateUserEntity updateUserProfile) async {
    try {
      // Retrieve JWT token and user object from SharedPreferences
      String? jwtToken = prefs.getString('jwtToken');
      debugPrint("JWT Token: $jwtToken");
      String userId = "dedc4ed7-470a-4848-adaa-ca055199b399";
      debugPrint("User ID: $userId");
      // Make the API call to update the user profile
      final response = await client.patch(
        Uri.parse('$baseUrl/user/$userId'), // Use userId instead of id
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $jwtToken',
        },
        body: jsonEncode(updateUserProfile.toJson()),
      );

      // Handle the API response
      if (response.statusCode == 200) {
        return Right(UpdateUserResponse.fromJson(json.decode(response.body)));
      } else {
        return Left(FailureResponse.fromJson(json.decode(response.body)));
      }
    } catch (e) {
      debugPrint("Update User Failed: $e");
      return Left(
        FailureResponse(
          message: 'Update User Failed: ${e.toString()}',
          statusCode: 500,
          error: e.runtimeType.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<FailureResponse, CoachesResponse>> getAllCoaches() async {
    try {
      String? jwtToken = prefs.getString('jwtToken');

      final response = await client.get(
        Uri.parse('$baseUrl/coach'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $jwtToken',
        },
      );
      if (response.statusCode == 200) {
        return Right(CoachesResponse.fromJson(json.decode(response.body)));
      } else {
        return Left(FailureResponse.fromJson(json.decode(response.body)));
      }
    } catch (e) {
      return Left(
        FailureResponse(
          message: 'Update User Failed: ${e.toString()}',
          statusCode: 500,
          error: e.runtimeType.toString(),
        ),
      );
    }
  }

  @override
  Future<Either<FailureResponse, CoachesResponse>> getCoachById(
      String coachId) async {
    try {
      String? jwtToken = prefs.getString('jwtToken');

      final response = await client.get(
        Uri.parse('$baseUrl/coach/$coachId'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'Bearer $jwtToken',
        },
      );
      if (response.statusCode == 200) {
        return Right(CoachesResponse.fromJson(json.decode(response.body)));
      } else {
        return Left(FailureResponse.fromJson(json.decode(response.body)));
      }
    } catch (e) {
      return Left(
        FailureResponse(
          message: 'Update User Failed: ${e.toString()}',
          statusCode: 500,
          error: e.runtimeType.toString(),
        ),
      );
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
      String? jwtToken = prefs.getString('jwtToken');

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
  Future<Either<String, Map<String, dynamic>>> getAllGyms() async {
    try {
      String? jwtToken = prefs.getString('jwtToken');

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
      String? jwtToken = prefs.getString('jwtToken');

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
}

// import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';

// class SharedPreferencesService {
//   Future<void> saveData(String key, dynamic value) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();

//     if (value is String) {
//       await prefs.setString(key, value);
//     } else if (value is int) {
//       await prefs.setInt(key, value);
//     } else if (value is bool) {
//       await prefs.setBool(key, value);
//     } else if (value is double) {
//       await prefs.setDouble(key, value);
//     } else if (value is List<String>) {
//       await prefs.setStringList(key, value);
//     } else if (value is Map<String, dynamic>) {
//       String jsonString = jsonEncode(value);
//       await prefs.setString(key, jsonString);
//     } else {
//       throw Exception("Unsupported data type");
//     }
//   }

//   Future<dynamic> readData(String key) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();

//     if (prefs.containsKey(key)) {
//       // Try to detect the correct type
//       var value = prefs.get(key);
//       if (value is String) {
//         // Try to parse JSON
//         try {
//           return jsonDecode(value);
//         } catch (e) {
//           return value; // Return as a normal string if not JSON
//         }
//       }
//       return value;
//     } else {
//       return null;
//     }
//   }

//   Future<void> updateData(String key, dynamic newValue) async {
//     await saveData(key, newValue);
//   }

//   Future<void> deleteData(String key) async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.remove(key);
//   }

//   Future<void> clearAllData() async {
//     final SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.clear();
//   }
// }

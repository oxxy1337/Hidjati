import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:school/objects/ApiResponce.dart';
import 'package:school/objects/User.dart';

class UserServices {
  static const api = 'https://calm-mountain-09462.herokuapp.com';

  static Future<ApiResponce<User>> getUser(String userId) {
    return http.get(api + "/admin/users/" + userId).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final user = User(
            username: jsonData['data']['username'],
            email: jsonData['data']['email'],
            password: jsonData['data']['password'],
            first_name: jsonData['data']['first_name'],
            middle_name: jsonData['data']['middle_name'],
            last_name: jsonData['data']['last_name'],
            gender: jsonData['data']['gender'],
            age: jsonData['data']['age']);
        return ApiResponce<User>(data: user);
      } else
        return ApiResponce<User>(
            error: true, error_msg: 'can\' t get the user');
    }).catchError((_) =>
        ApiResponce<User>(error: true, error_msg: 'something went wrong'));
  }

  static Future<ApiResponce<User>> loginUser(
      TextEditingController mail, TextEditingController pass) {
    final user = LoginUser(email: mail.text, password: pass.text);
    return http
        .post(api + "/user/mobilelogin", body: user.toJson())
        .then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final user = User(
            username: jsonData['data']['username'],
            email: jsonData['data']['email'],
            password: jsonData['data']['password'],
            first_name: jsonData['data']['first_name'],
            middle_name: jsonData['data']['middle_name'],
            last_name: jsonData['data']['last_name'],
            gender: jsonData['data']['gender'],
            age: jsonData['data']['age']);
        return ApiResponce<User>(data: user);
      } else
        return ApiResponce<User>(error: true, error_msg: 'can\'t login');
    }).catchError((_) =>
            ApiResponce<User>(error: true, error_msg: "something went wrong"));
  }

  static Future<ApiResponce<User>> registerUser(TextEditingController uname,
      TextEditingController mail, String gend, TextEditingController pass) {
    final user = RegisterUser(
        username: uname.text,
        email: mail.text,
        gender: gend,
        password: pass.text);
    return http.post(api + '/user/register', body: user.toJson()).then((data) {
      if (data.statusCode == 200) {
        final jsonData = json.decode(data.body);
        final user = User(
            username: jsonData['data']['username'],
            email: jsonData['data']['email'],
            password: jsonData['data']['password'],
            first_name: jsonData['data']['first_name'],
            middle_name: jsonData['data']['middle_name'],
            last_name: jsonData['data']['last_name'],
            gender: jsonData['data']['gender'],
            age: jsonData['data']['age']);
        return ApiResponce<User>(data: user);
      } else
        return ApiResponce<User>(error: true, error_msg: 'can\' t register');
    }).catchError((_) =>
        ApiResponce<User>(error: true, error_msg: 'something went wrong'));
  }
}

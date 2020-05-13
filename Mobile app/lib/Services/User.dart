import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Models/User.dart';
import '../Models/api_response.dart';
import 'package:http/http.dart' as http;

class UserServices {
  static final api = 'http://a44e9ef8.ngrok.io';

  static Future<api_response<User>> getUser(String userId) {
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
        return api_response<User>(data: user);
      } else
        return api_response<User>(
            error: true, error_msg: 'can\' t get the user');
    }).catchError((_) =>
        api_response<User>(error: true, error_msg: 'something went wrong'));
  }

  static Future<api_response<User>> LoginUser(
      TextEditingController mail, TextEditingController pass) {
    loginUser user = loginUser(email: mail.text, password: pass.text);
    return http
        .post(api + '/user/mobilelogin', body: user.toJson())
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
        return api_response<User>(data: user);
      } else
        return api_response<User>(error: true, error_msg: 'can\' t login');
    }).catchError((_) =>
            api_response<User>(error: true, error_msg: 'something went wrong'));
  }

  static Future<api_response<User>> RegisterUser(TextEditingController uname,
      TextEditingController mail, TextEditingController pass, String gend) {
    registerUser user = registerUser(
        email: mail.text,
        username: uname.text,
        password: pass.text,
        gender: gend);
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
        return api_response<User>(data: user);
      } else
        return api_response<User>(
            error: true, error_msg: 'can\' register the user');
    }).catchError((_) =>
        api_response<User>(error: true, error_msg: 'something went wrong'));
  }
}

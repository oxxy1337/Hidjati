//was just testing fetch user profil from api

import 'package:flutter/material.dart';
import 'package:school/Models/User.dart';
import 'package:school/Models/api_response.dart';
import 'package:school/Services/User.dart';

class Profile extends StatefulWidget {
  static final id = 'profileScreen';
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  api_response<User> _apiResponse;
  bool _isLoading = false;

  @override
  void initState() {
    _fetchUser();
    super.initState();
  }

  _fetchUser() async {
    setState(() {
      _isLoading = true;
    });

    // _apiResponse = await UserServices().getUser();

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _isLoading
        ? CircularProgressIndicator()
        : Scaffold(
            appBar: AppBar(
              title: Text('user Profile'),
            ),
            body: Container(
              child: Text(
                  _apiResponse.data != null ? _apiResponse.data.username : ''),
            ),
          );
  }
}

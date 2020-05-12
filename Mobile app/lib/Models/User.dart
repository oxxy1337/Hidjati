class User {
  String username, email, password, first_name, middle_name, last_name, gender;
  int age;

  User(
      {this.username,
      this.email,
      this.password,
      this.first_name,
      this.middle_name,
      this.last_name,
      this.gender,
      this.age});
}

class loginUser {
  String email, password;

  loginUser({this.email, this.password});

  Map<String, dynamic> toJson() {
    return {'email': email, 'password': password};
  }
}

class registerUser {
  String username, email, password, gender;

  registerUser({this.username, this.password, this.email, this.gender});

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'password': password,
      'gender': gender,
      'username': username
    };
  }
}

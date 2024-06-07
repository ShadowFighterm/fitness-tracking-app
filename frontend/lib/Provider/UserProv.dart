import 'dart:convert';
import 'package:db_final_project_fitness_app/Provider/AuthProv.dart';
import 'package:flutter/material.dart';
import 'package:db_final_project_fitness_app/config.dart';
import 'package:http/http.dart' as http;

class UserProvider extends ChangeNotifier {
  String _name = '';
  String _gender = '';
  int _age = 0;
  int _height = 0;
  double _weight = 0;
  String _activityLevel = '';
  String _goal = '';
  String _email = '';

  String get name => _name;
  String get gender => _gender;
  int get age => _age;
  int get height => _height;
  double get weight => _weight;
  String get activityLevel => _activityLevel;
  String get goal => _goal;
  String get email => _email;

  void setName(String name) {
    _name = name;
  }

  void setGender(String gender) {
    _gender = gender;
  }

  void setAge(int age) {
    _age = age;
  }

  void setHeight(int height) {
    _height = height;
  }

  void setWeight(double weight) {
    _weight = weight;
  }

  void setActivityLevel(String activityLevel) {
    _activityLevel = activityLevel;
  }

  void setGoal(String goal) {
    _goal = goal;
  }

  void setEmail(String email) {
    _email = email;
  }

  void LoadUserInfo(var jsonReponse) {
    setEmail(jsonReponse['email']);
    setName(jsonReponse['name']);
    setGender(jsonReponse['gender']);
    setAge(jsonReponse['age']);
    setHeight(jsonReponse['height']);
    if (jsonReponse['weight'] is int) {
      setWeight(jsonReponse['weight'].toDouble());
    } else {
      setWeight(jsonReponse['weight']);
    }
    setActivityLevel(jsonReponse['activity']);
    setGoal(jsonReponse['goal']);
  }

  // ignore: non_constant_identifier_names
  Future<String?> UpdateUserInfo(String email, String name, double weight,
      int height, int age, String goal) async {
    try {
      var reqBody = {
        "email": email,
        "name": name,
        "weight": weight,
        "height": height,
        "age": age,
        "goal": goal
      };
      var response = await http.post(
        Uri.parse(update),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(reqBody),
      );
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        print('Update successful');
        LoadUserInfo(jsonResponse);
        return "success";
      } else {
        print('Server error');
        return null;
      }
    } catch (e) {
      print('Error saving: $e');
      return null;
    }
  }
}

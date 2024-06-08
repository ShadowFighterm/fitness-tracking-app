import 'dart:convert';
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

  // date, calories,
  //                   running, cycling, swimming, walking, weightlifting, yoga, jumpingRope, aerobics

  List<String> _date = [];
  List<int> _calories = [];
  List<int> _running = [];
  List<int> _cycling = [];
  List<int> _swimming = [];
  List<int> _walking = [];
  List<int> _weightlifting = [];
  List<int> _yoga = [];
  List<int> _jumpingRope = [];
  List<int> _aerobics = [];

  String get name => _name;
  String get gender => _gender;
  int get age => _age;
  int get height => _height;
  double get weight => _weight;
  String get activityLevel => _activityLevel;
  String get goal => _goal;
  String get email => _email;

  List<String> get date => _date;
  List<int> get calories => _calories;
  List<int> get running => _running;
  List<int> get cycling => _cycling;
  List<int> get swimming => _swimming;
  List<int> get walking => _walking;
  List<int> get weightlifting => _weightlifting;
  List<int> get yoga => _yoga;
  List<int> get jumpingRope => _jumpingRope;
  List<int> get aerobics => _aerobics;

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

  // ----------------------------------------------------------------
  void setDate(List<String> date) {
    _date = date;
  }

  void setCalories(List<int> calories) {
    _calories = calories;
  }

  void setRunning(List<int> running) {
    _running = running;
  }

  void setCycling(List<int> cycling) {
    _cycling = cycling;
  }

  void setSwimming(List<int> swimming) {
    _swimming = swimming;
  }

  void setWalking(List<int> walking) {
    _walking = walking;
  }

  void setWeightlifting(List<int> weightlifting) {
    _weightlifting = weightlifting;
  }

  void setYoga(List<int> yoga) {
    _yoga = yoga;
  }

  void setJumpingRope(List<int> jumpingRope) {
    _jumpingRope = jumpingRope;
  }

  void setAerobics(List<int> aerobics) {
    _aerobics = aerobics;
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

  void LoadUserInfo_2(var jsonResponse) {
    setEmail(jsonResponse['email']);
    setName(jsonResponse['name']);
    setGender(jsonResponse['gender']);
    setAge(jsonResponse['age']);
    setHeight(jsonResponse['height']);
    if (jsonResponse['weight'] is int) {
      setWeight(jsonResponse['weight'].toDouble());
    } else {
      setWeight(jsonResponse['weight']);
    }
    setActivityLevel(jsonResponse['activity']);
    setGoal(jsonResponse['goal']);

    setRunning(jsonResponse['running']);
    setCycling(jsonResponse['cycling']);
    setSwimming(jsonResponse['swimming']);
    setWalking(jsonResponse['walking']);
    setWeightlifting(jsonResponse['weightlifting']);
    setYoga(List<int>.from(jsonResponse['yoga']));
    setJumpingRope(jsonResponse['jumpingRope']);
    setAerobics(jsonResponse['aerobics']);
  }

  Future<String?> UpdateUserInfo_2(
      String email,
      String name,
      double weight,
      int height,
      int age,
      String goal,
      int running,
      int cycling,
      int swimming,
      int walking,
      int weightlifting,
      int yoga,
      int jumpingRope,
      int aerobics) async {
    try {
      var reqBody = {
        "email": email,
        "name": name,
        "weight": weight,
        "height": height,
        "age": age,
        "goal": goal,
        "running": running,
        "cycling": cycling,
        "swimming": swimming,
        "walking": walking,
        "weightlifting": weightlifting,
        "yoga": yoga,
        "jumpingRope": jumpingRope,
        "aerobics": aerobics,
      };
      var response = await http.post(
        Uri.parse(update),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(reqBody),
      );
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        print('Update successful');
        LoadUserInfo_2(jsonResponse);
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

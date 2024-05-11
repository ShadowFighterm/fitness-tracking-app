import 'package:flutter/material.dart';


class UserProvider extends ChangeNotifier {
  String _gender = '';
  int _age = 0;
  int _height = 0; 
  int _weight = 0; 
  String _activityLevel = '';
  String _goal = '';

  String get gender => _gender;
  int get age => _age;
  int get height => _height;
  int get weight => _weight;
  String get activityLevel => _activityLevel;
  String get goal => _goal;

  void setGender(String gender) {
    _gender = gender;
    
  }

  void setAge(int age) {
    _age = age;
    
  }

  void setHeight(int height) {
    _height = height;
    
  }

  void setWeight(int weight) {
    _weight = weight;
    
  }

  void setActivityLevel(String activityLevel) {
    _activityLevel = activityLevel;
    
  }

  void setGoal(String goal) {
    _goal = goal;
    
  }
}
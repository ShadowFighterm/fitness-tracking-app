import 'package:flutter/material.dart';

class UserProvider extends ChangeNotifier {
  String _name = '';
  String _gender = '';
  int _age = 0;
  int _height = 0;
  double _weight = 0;
  String _activityLevel = '';
  String _goal = '';
  double _caloriesBurned = 0;
  Map<DateTime, Map<String, double>> _exerciseData = {};

  String get name => _name;
  String get gender => _gender;
  int get age => _age;
  int get height => _height;
  double get weight => _weight;
  String get activityLevel => _activityLevel;
  String get goal => _goal;
  double get caloriesBurned => _caloriesBurned;
  Map<DateTime, Map<String, double>> get exerciseData => _exerciseData;

  void setName(String name) {
    _name = name;
    notifyListeners();
  }

  void setGender(String gender) {
    _gender = gender;
    notifyListeners();
  }

  void setAge(int age) {
    _age = age;
    notifyListeners();
  }

  void setHeight(int height) {
    _height = height;
    notifyListeners();
  }

  void setWeight(double weight) {
    _weight = weight;
    notifyListeners();
  }

  void setActivityLevel(String activityLevel) {
    _activityLevel = activityLevel;
    notifyListeners();
  }

  void setGoal(String goal) {
    _goal = goal;
    notifyListeners();
  }

  void updateExerciseData(DateTime date, Map<String, double> data) {
    _exerciseData[date] = data;
    _updateCaloriesBurned(date);
    notifyListeners();
  }

  void _updateCaloriesBurned(DateTime date) {
    if (_exerciseData.containsKey(date)) {
      double totalCalories = 0;
      Map<String, double>? exercises = _exerciseData[date];
      exercises?.forEach((exercise, duration) {
        totalCalories += _calculateCalories(exercise, duration);
      });
      _caloriesBurned = totalCalories;
    } else {
      _caloriesBurned = 0;
    }
  }

  double _calculateCalories(String exercise, double duration) {
    const Map<String, double> caloriesPerMinute = {
      'running': 10.0,
      'cycling': 8.5,
      'swimming': 9.5,
      'walking': 3.8,
      'weightlifting': 6.0,
      'yoga': 3.0,
      'jumpingRope': 12.0,
      'aerobics': 7.0,
    };

    return caloriesPerMinute[exercise.toLowerCase()]! * duration;
  }
}

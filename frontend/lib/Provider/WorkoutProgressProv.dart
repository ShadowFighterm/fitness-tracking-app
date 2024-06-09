import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:db_final_project_fitness_app/config.dart';
import 'package:http/http.dart' as http;

class WorkoutProgressProv extends ChangeNotifier {
  int _caloriesBurnt = 0;
  int _heartRate = 0;
  int _steps = 0;
  int _time = 0;
  String _date = " ";

  int _running = 0;
  int _cycling = 0;
  int _swimming = 0;
  int _walking = 0;
  int _weightlifting = 0;
  int _yoga = 0;
  int _jumpingRope = 0;
  int _aerobics = 0;

  int get caloriesBurnt => _caloriesBurnt;
  int get heartRate => _heartRate;
  int get steps => _steps;
  int get time => _time;
  String get date => _date;

  int get running => _running;
  int get cycling => _cycling;
  int get swimming => _swimming;
  int get walking => _walking;
  int get weightlifting => _weightlifting;
  int get yoga => _yoga;
  int get jumpingRope => _jumpingRope;
  int get aerobics => _aerobics;

  void setCaloriesBurnt(int caloriesBurnt) {
    _caloriesBurnt = caloriesBurnt;
  }

  void setHeartRate(int heartRate) {
    _heartRate = heartRate;
  }

  void setSteps(int steps) {
    _steps = steps;
  }

  void setTime(int time) {
    _time = time;
  }

  void setDate(String date) {
    _date = date;
  }

  void setrunning(int value) {
    _running = value;
  }

  void setcycling(int value) {
    _cycling = value;
  }

  void setswimming(int value) {
    _swimming = value;
  }

  void setwalking(int value) {
    _walking = value;
  }

  void setweightlifting(int value) {
    _weightlifting = value;
  }

  void setyoga(int value) {
    _yoga = value;
  }

  void setjumpingRope(int value) {
    _jumpingRope = value;
  }

  void setaerobics(int value) {
    _aerobics = value;
  }

  void LoadWorkoutProgress(var jsonResponse) {
    setCaloriesBurnt(jsonResponse['caloriesBurnt']);
    setHeartRate(jsonResponse['heartRate']);
    setSteps(jsonResponse['steps']);
    setTime(jsonResponse['time']);
  }

  Future<String?> AddProgress(
    String email,
    String date,
    int caloriesBurnt,
    int steps,
    int time,
    int heartRate,
  ) async {
    try {
      var reqBody = {
        "email": email,
        "date": date,
        "caloriesBurnt": caloriesBurnt,
        "steps": steps,
        "time": time,
        "heartRate": heartRate
      };
      var response = await http.post(
        Uri.parse(addProgress),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(reqBody),
      );

      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        print('Progress added successfully');
        LoadWorkoutProgress(jsonResponse);
        return "success";
      } else {
        print('Server error');
        return null;
      }
    } catch (e) {
      print('Error adding: $e');
      return null;
    }
  }

  Future<String?> GetProgress(String email, String date) async {
    try {
      var reqBody = {"email": email, "date": date};
      var response = await http.post(
        Uri.parse(getProgress),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(reqBody),
      );
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        print('Got progress successfully');
        LoadWorkoutProgress(jsonResponse);
        return "success";
      } else {
        print('Server error');
        return null;
      }
    } catch (e) {
      print('Error getting: $e');
      return null;
    }
  }
}

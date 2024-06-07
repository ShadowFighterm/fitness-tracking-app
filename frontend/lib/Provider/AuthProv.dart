import 'dart:convert';
import 'package:db_final_project_fitness_app/static.dart';
import 'package:flutter/material.dart';
import 'package:db_final_project_fitness_app/Provider/UserProv.dart';
import 'package:http/http.dart' as http;

import '../config.dart';



class AuthProvider extends ChangeNotifier
{
  final UserProvider userProvider;
  AuthProvider(this.userProvider);
  
  static Future<String?> loginUser(String email, String password) async {
    try 
    {
      var reqBody = {"email": email, "password": password};

      var response = await http.post(
        Uri.parse(login),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(reqBody),
      );

      if (response.statusCode == 200)
      {
        var jsonResponse = jsonDecode(response.body);
        if (jsonResponse['message'] == 'User logged in successfully') {
          print('Login successful');
          userProv.LoadUserInfo(jsonResponse);
          return jsonResponse['token'];
        } else {
          print('Authentication failed: ${jsonResponse['message']}');
          return null;
        }
      } 
      else 
      {
        print('Server error: ${response.statusCode}');
        print('Server error: ${response.body}');
        return null;
      }
    } 
    catch (e) 
    {
      print('Error logging in: $e');
      return null;
    }
  }
  static Future<String?> registerUser(String name, String email, String password,
  int age, String gender, int height, double weight, String goal,
  String activity) async
  {
    try
    {
      var reqBody = {"name": name, "email": email, "password": password,
      "age": age, "gender": gender, "height": height, "weight": weight,
      "goal": goal, "activity": activity};

      var response = await http.post(
        Uri.parse(register),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(reqBody),
      );//.timeout(const Duration(seconds: 10));
      
      if(response.statusCode == 400 || response.statusCode == 200)
      {
        var jsonResponse = jsonDecode(response.body);
        if(jsonResponse['status'] == 'Success')
        {
          print('Registered successfully');
          return 'success';
        }
        else
        {
          print('User already exists!');
          return "exists";
        }
      }
      else
      {
        print(response.statusCode);
        print('Server error');
        return null;
      }
    }
    catch(e)
    {
      print("Error registered in: $e");
      return null;
    }
  }
  
}
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:db_final_project_fitness_app/config.dart';
import 'package:http/http.dart' as http;

class FriendProvider
{
  FriendProvider(String name, String email, int caloriesBurnt)
  {
    setName(name);
    setEmail(email);
    setCaloriesBurnt(caloriesBurnt);
  }
  String _name = '';
  String _email = '';
  int _caloriesBurnt = 0;

  String get name => _name;
  String get email => _email;
  int get caloriesBurnt => _caloriesBurnt;


  void setName(String name)
  {
    _name = name;
  }

  void setEmail(String email)
  {
    _email = email;
  }

  void setCaloriesBurnt(int caloriesBurnt) 
  {
    _caloriesBurnt = caloriesBurnt;  
  }
}

class SearchedUserProv
{
  SearchedUserProv(String name, String email)
  {
    setName(name);
    setEmail(email);
  }
  String _name = '';
  String _email = '';

  String get name => _name;
  String get email => _email;


  void setName(String name)
  {
    _name = name;
  }

  void setEmail(String email)
  {
    _email = email;
  }
}

class UserProvider extends ChangeNotifier 
{
  String _name = '';
  String _gender = '';
  int _age = 0;
  int _height = 0; 
  double _weight = 0; 
  String _activityLevel = '';
  String _goal = '';
  String _email = '';
  List<FriendProvider> _friends = [];
  List<SearchedUserProv> _searchList = [];

  String get name => _name;
  String get gender => _gender;
  int get age => _age;
  int get height => _height;
  double get weight => _weight;
  String get activityLevel => _activityLevel;
  String get goal => _goal;
  String get email => _email;
  List<FriendProvider> get friends => _friends;
  List<SearchedUserProv> get searchList => _searchList;


  void setName(String name)
  {
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

  void setEmail(String email)
  {
    _email = email;
  }

  void setFriends(List<FriendProvider> friends)
  {
    _friends = friends;
  }

  void setSearchList(List<SearchedUserProv> searchList)
  {
    _searchList = searchList;
  }

  void LoadUserInfo(var jsonReponse)
  {
    setEmail(jsonReponse['email']);
    setName(jsonReponse['name']);
    setGender(jsonReponse['gender']);
    setAge(jsonReponse['age']);
    setHeight(jsonReponse['height']);
    if(jsonReponse['weight'] is int)
    {
      setWeight(jsonReponse['weight'].toDouble());
    }
    else
    {
      setWeight(jsonReponse['weight']);
    }
    setActivityLevel(jsonReponse['activity']);
    setGoal(jsonReponse['goal']);
  } 
  // ignore: non_constant_identifier_names
  Future<String?> UpdateUserInfo(String email, String name, double weight, int height, int age, String goal) async
  {
    try
    {
      var reqBody = {"email": email, "name":name, "weight":weight, "height":height, "age":age, "goal":goal};
      var response = await http.post(
        Uri.parse(update),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(reqBody),
      );
      if(response.statusCode == 200)
      {
        var jsonResponse = jsonDecode(response.body);
        print('Update successful');
        LoadUserInfo(jsonResponse);
        return "success";
      }
      else
      {
        print('Server error');
        return null;
      }
    }
    catch(e)
    {
      print('Error saving: $e');
      return null;
    }
  }

  void LoadSearchList(var jsonResponse)
  {
    List<SearchedUserProv> temp = [];
    int size = jsonResponse['usersMail'].length;
    for(int i = 0 ; i < size; i++)
    {
      var name = jsonResponse['usersName'][i];
      var mail = jsonResponse['usersMail'][i];
      temp.add(SearchedUserProv(name,mail));
    }
    setSearchList(temp);
  }

  Future<String?> GetUsersWithName(String name) async
  {
    try
    {
      var reqBody = {"email": _email, "name":name};
      var response = await http.post(
        Uri.parse(getUsers),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(reqBody),
      );
      if(response.statusCode == 200)
      {
        var jsonResponse = jsonDecode(response.body);
        LoadSearchList(jsonResponse);
        print('Got users successfully');
        return "success";
      }
      else
      {
        print('Server error or no users found');
        return null;
      }
    }
    catch(e)
    {
      print('Error saving: $e');
      return null;
    }
  }
  
  void LoadFriends(var jsonResponse)
  {
    List<FriendProvider> temp = [];
    int size = jsonResponse['friendsMails'].length;
    for(int i = 0 ; i < size; i++)
    {
      var name = jsonResponse['friendsNames'][i];
      var mail = jsonResponse['friendsMails'][i];
      var caloriesBurnt = jsonResponse['friendsCal'][i];
      temp.add(FriendProvider(name,mail,caloriesBurnt));
    }
    setFriends(temp);
    print('size of friend is:' + temp.length.toString());
  }
  Future<String?> GetFriends() async
  {
    try
    {
      var reqBody = {"email": _email};
      var response = await http.post(
        Uri.parse(getFriends),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(reqBody),
      );
      if(response.statusCode == 200)
      {
        var jsonResponse = jsonDecode(response.body);
        LoadFriends(jsonResponse);
        print('Got friends successfully');
        return "success";
      }
      
      {
        print('Server error or no friend found');
        return null;
      }
    }
    catch(e)
    {
      print('Error saving: $e');
      return null;
    }
  }

  Future<String?> AddFriend(email) async
  {
    try
    {
      var reqBody = {"email": _email, "friendMail": email};
      var response = await http.post(
        Uri.parse(addFriend),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(reqBody),
      );
      if(response.statusCode == 200)
      {
        var jsonResponse = jsonDecode(response.body);
        LoadFriends(jsonResponse);
        print('Added friends successfully');
        return "success";
      }
      else
      {
        print('Server error or no friend found');
        return null;
      }
    }
    catch(e)
    {
      print('Error adding: $e');
      return null;
    }
  }

  Future<String?> RemoveFriend(email) async
  {
    try
    {
      var reqBody = {"email": _email, "friendMail": email};
      var response = await http.post(
        Uri.parse(removeFriend),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode(reqBody),
      );
      if(response.statusCode == 200)
      {
        var jsonResponse = jsonDecode(response.body);
        LoadFriends(jsonResponse);
        print('Remove friends successfully');
        return "success";
      }
      else
      {
        print('Server error');
        return null;
      }
    }
    catch(e)
    {
      print('Error remove: $e');
      return null;
    }
  }
  
}

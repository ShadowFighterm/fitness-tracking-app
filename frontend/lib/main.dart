import 'package:db_final_project_fitness_app/screens/MainScreens/Home.dart';
import 'package:db_final_project_fitness_app/screens/MainScreens/NavigationBar.dart';
import 'package:db_final_project_fitness_app/screens/MainScreens/Notification.dart';
import 'package:db_final_project_fitness_app/screens/MainScreens/SearchPage.dart';
import 'package:db_final_project_fitness_app/screens/MainScreens/WorkoutProgress.dart';
import 'package:db_final_project_fitness_app/screens/MainScreens/AddActivity.dart';
import 'package:db_final_project_fitness_app/screens/MainScreens/workoutCategories.dart';
import 'package:db_final_project_fitness_app/screens/ProfileScreen/Account.dart';
import 'package:db_final_project_fitness_app/screens/ProfileScreen/PrivacyPolicy.dart';
import 'package:db_final_project_fitness_app/screens/ProfileScreen/Profile.dart';
import 'package:db_final_project_fitness_app/screens/ProfileScreen/Settings.dart';
import 'package:db_final_project_fitness_app/screens/ProfileScreen/exercises.dart';
import 'package:db_final_project_fitness_app/screens/SignupLoginScreens/ForgotPassword.dart';
import 'package:db_final_project_fitness_app/screens/SignupLoginScreens/LoginSignUp.dart';
import 'package:db_final_project_fitness_app/screens/StartupScreen/Startup.dart';
import 'package:db_final_project_fitness_app/screens/UserInfoScreens/Activity.dart';
import 'package:db_final_project_fitness_app/screens/UserInfoScreens/Age.dart';
import 'package:db_final_project_fitness_app/screens/UserInfoScreens/Gender.dart';
import 'package:db_final_project_fitness_app/screens/UserInfoScreens/Goal.dart';
import 'package:db_final_project_fitness_app/screens/UserInfoScreens/Height.dart';
import 'package:db_final_project_fitness_app/screens/UserInfoScreens/Weight.dart';

import 'package:db_final_project_fitness_app/screens/MainScreens/leaderboard.dart';
import 'package:db_final_project_fitness_app/screens/MainScreens/managefriends.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const FitnessApp());
}

class FitnessApp extends StatelessWidget {
  const FitnessApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.black,
      routes: {
        '/startup': (context) => StartupScreen(),
        '/gender': (context) => GenderScreen(),
        '/age': (context) => AgeScreen(),
        '/height': (context) => HeightScreen(),
        '/weight': (context) => WeightScreen(),
        '/activity': (context) => ActivityScreen(),
        '/goal': (context) => GoalScreen(),
        '/ForgotPassword': (context) => ForgotPasswordScreen(),
        '/ForgotPassword': (context) => ForgotPasswordScreen(),
        '/login': (context) => SignUp(),
        '/home': (context) => HomePage(),
        '/notifications': (context) => NotificationPage(),
        '/WorkoutCategories': (context) => WorkoutCategories(),
        '/NavigationBar': (context) => HomepageNavbar(),
        '/manageFriends': (context) => ManageFriend(),
        '/leaderboard': (context) => LeaderBoardPage(),
        '/profile': (context) => ProfilePage(),
        '/PrivacyPolicy': (context) => PrivacyPolicyPage(),
        '/PrivacyPolicy': (context) => PrivacyPolicyPage(),
        '/settings': (context) => SettingsPage(),
        '/account': (context) => AccountInfoPage(),
        '/AddActivity': (context) => AddActivityPage(),
        '/workoutinput': (context) => const ExerciseInputPage(),
        '/searchPage': (context) => SearchPage(),
      },
      debugShowCheckedModeBanner: false,
      home: StartupScreen(),
    );
  }
}

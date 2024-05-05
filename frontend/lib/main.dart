import 'package:db_final_project_fitness_app/screens/AgeScreen/GoalScreen.dart';
import 'package:db_final_project_fitness_app/screens/TargetScreen/TargetScreen.dart';
import 'package:db_final_project_fitness_app/SignupLoginScreens/loginSignUp.dart';
import 'package:db_final_project_fitness_app/SignupLoginScreens/ForgotPassword.dart';
import 'package:db_final_project_fitness_app/screens/StartupScreen/StartupScreeb.dart';
import 'package:db_final_project_fitness_app/screens/profilePage/profilePage.dart';
import 'package:db_final_project_fitness_app/screens/AgeScreen/ActivityScreen.dart';
import 'package:db_final_project_fitness_app/screens/AgeScreen/WeightScreen.dart';
import 'package:flutter/material.dart';
import 'SignupLoginScreens/ForgotPassword.dart';
import 'screens/ProfilePage/PrivacyPolicy.dart';
import 'screens/ProfilePage/SettingsPage.dart';
import 'screens/ageScreen/ageScreen.dart';
import 'screens/genderScreen/genderScreen.dart';
import 'screens/AgeScreen/HeightScreen.dart';
import 'screens/profilePage/profilePage.dart';
void main() {
  runApp(const FitnessApp());
}

class FitnessApp extends StatelessWidget {
  const FitnessApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      color: Colors.black,
        routes: {
        '/startup': (context) => StartupScreen(),
        '/gender': (context) => GenderScreen(),
        '/age': (context) => AgeScreen(),
        '/height': (context) => HeightScreen(),
        '/weight': (context) => WeightScreen(),
        '/activity': (context) => ActivityScreen(),
        '/goal': (context) => GoalScreen(),
        '/forgotPassword': (context) => ForgotPasswordScreen(),
        '/login': (context) => SignUp(),
        '/profile': (context) => ProfilePage(),
        '/privacyPolicy': (context) => PrivacyPolicyPage(),
        '/settings': (context) => SettingsPage(),
        
      },
      debugShowCheckedModeBanner: false,
      home: ForgotPasswordScreen(),
    );
  }
}

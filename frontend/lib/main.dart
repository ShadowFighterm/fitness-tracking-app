import 'package:db_final_project_fitness_app/screens/TargetScreen/TargetScreen.dart';
import 'package:db_final_project_fitness_app/SignupLoginScreens/ForgotPassword.dart';
import 'package:db_final_project_fitness_app/screens/OnBoardingScreen/onBoardingScreen.dart';
import 'package:db_final_project_fitness_app/screens/ProfilePage/profilePage.dart';



import 'package:flutter/material.dart';

import 'SignupLoginScreens/ForgotPassword.dart';
import 'screens/ProfilePage/PrivacyPolicy.dart';
import 'screens/ProfilePage/SettingsPage.dart';

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
        '/onboarding': (context) => OnBoardingScreen(),
        '/gender': (context) => GenderPage(),
        '/age': (context) => AgePage(),
        '/height': (context) => HeightPage(),
        '/weight': (context) => WeightPage(),
        '/activity': (context) => ActivityLevelPage(),
        '/goal': (context) => GoalPage(),
        '/forgotPassword': (context) => ForgotPassword(),
        '/login': (context) => SignUp(),
        '/home': (context) => HomePage(),
        '/notifications': (context) => NotificationPage(),
        '/workoutCategories': (context) => WorkoutCategories(),
        '/bottomNavigationbar': (context) => HomepageNavbar(),
        '/profile': (context) => ProfilePage(),
        '/privacyPolicy': (context) => PrivacyPolicyPage(),
        '/settings': (context) => SettingsPage(),
        
      },
      debugShowCheckedModeBanner: false,
      home: ForgotPasswordScreen(),
    );
  }
}

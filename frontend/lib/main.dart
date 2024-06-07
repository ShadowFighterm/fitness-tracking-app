import 'package:db_final_project_fitness_app/screens/MainScreens/Home.dart';
import 'package:db_final_project_fitness_app/screens/MainScreens/NavigationBar.dart';
import 'package:db_final_project_fitness_app/screens/MainScreens/Notification.dart';
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
        '/startup': (context) => const StartupScreen(),
        '/gender': (context) => const GenderScreen(),
        '/age': (context) => const AgeScreen(),
        '/height': (context) => const HeightScreen(),
        '/weight': (context) => const WeightScreen(),
        '/activity': (context) => const ActivityScreen(),
        '/goal': (context) => const GoalScreen(),
        '/ForgotPassword': (context) => const ForgotPasswordScreen(),
        '/login': (context) => const SignUp(),
        '/home': (context) => const HomePage(),
        '/notifications': (context) => const NotificationPage(),
        '/WorkoutCategories': (context) => const WorkoutCategories(),
        '/NavigationBar': (context) => const HomepageNavbar(),
        '/profile': (context) => const ProfilePage(),
        '/PrivacyPolicy': (context) => PrivacyPolicyPage(),
        '/settings': (context) => const SettingsPage(),
        '/account': (context) => const AccountInfoPage(),
        '/workoutinput': (context) => const ExerciseInputPage(),
      },
      debugShowCheckedModeBanner: false,
      home: const StartupScreen(),
    );
  }
}

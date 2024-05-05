<<<<<<< HEAD
import 'package:db_final_project_fitness_app/screens/TargetScreen/TargetScreen.dart';
import 'package:db_final_project_fitness_app/SignupLoginScreens/ForgotPassword.dart';
import 'package:db_final_project_fitness_app/screens/OnBoardingScreen/onBoardingScreen.dart';
import 'package:db_final_project_fitness_app/screens/ProfilePage/profilePage.dart';



=======
import 'package:db_final_project_fitness_app/screens/AgeScreen/GoalScreen.dart';
import 'package:db_final_project_fitness_app/screens/TargetScreen/TargetScreen.dart';
import 'package:db_final_project_fitness_app/SignupLoginScreens/loginSignUp.dart';
import 'package:db_final_project_fitness_app/SignupLoginScreens/ForgotPassword.dart';
import 'package:db_final_project_fitness_app/screens/StartupScreen/StartupScreeb.dart';
import 'package:db_final_project_fitness_app/screens/profilePage/profilePage.dart';
import 'package:db_final_project_fitness_app/screens/AgeScreen/ActivityScreen.dart';
import 'package:db_final_project_fitness_app/screens/AgeScreen/WeightScreen.dart';
>>>>>>> fe8c5ced7d69f656121fa902ec2876254a6abeb3
import 'package:flutter/material.dart';
import 'SignupLoginScreens/ForgotPassword.dart';
import 'screens/ProfilePage/PrivacyPolicy.dart';
import 'screens/ProfilePage/SettingsPage.dart';
<<<<<<< HEAD

=======
import 'screens/ageScreen/ageScreen.dart';
import 'screens/genderScreen/genderScreen.dart';
import 'screens/AgeScreen/HeightScreen.dart';
>>>>>>> fe8c5ced7d69f656121fa902ec2876254a6abeb3
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

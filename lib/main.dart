import 'package:db_final_project_fitness_app/screens/StartupScreen/StartupScreeb.dart';
import 'package:flutter/material.dart';

void main()
{
  runApp(const FitnessApp());
}

class FitnessApp extends StatelessWidget
{
  const FitnessApp({super.key});
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp
    (color: Colors.black,
    debugShowCheckedModeBanner: false,
    home: StartupScreen(),
    );
  }
}
import 'dart:io';
import 'package:db_final_project_fitness_app/constants/Color.dart';
import 'package:flutter/material.dart';

class GoalInputPage extends StatefulWidget {
  const GoalInputPage({Key? key}) : super(key: key);

  @override
  _GoalInputPageState createState() => _GoalInputPageState();
}

class _GoalInputPageState extends State<GoalInputPage> {
  final TextEditingController runningController = TextEditingController();
  final TextEditingController cyclingController = TextEditingController();
  final TextEditingController swimmingController = TextEditingController();
  final TextEditingController walkingController = TextEditingController();
  final TextEditingController weightliftingController = TextEditingController();
  final TextEditingController yogaController = TextEditingController();
  final TextEditingController jumpingRopeController = TextEditingController();
  final TextEditingController aerobicsController = TextEditingController();

  void saveGoals() async {
    String goalData = '''
Running: ${runningController.text}
Cycling: ${cyclingController.text}
Swimming: ${swimmingController.text}
Walking: ${walkingController.text}
Weightlifting: ${weightliftingController.text}
Yoga: ${yogaController.text}
JumpingRope: ${jumpingRopeController.text}
Aerobics: ${aerobicsController.text}
''';

    try {
      final file = File('abdullah.txt');
      await file.writeAsString(goalData);
      Navigator.pushNamed(context, '/TodayWorkoutPlan');
    } catch (e) {
      print('Error saving goals: $e');
      // Handle error saving goals
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('Set Exercise Goals'),
        backgroundColor: mainColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            buildExerciseInputField('Running :', runningController),
            buildExerciseInputField('Cycling :', cyclingController),
            buildExerciseInputField('Swimming :', swimmingController),
            buildExerciseInputField('Walking :', walkingController),
            buildExerciseInputField('Weightlifting :', weightliftingController),
            buildExerciseInputField('Yoga :', yogaController),
            buildExerciseInputField('Jumping Rope :', jumpingRopeController),
            buildExerciseInputField('Aerobics :', aerobicsController),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: saveGoals,
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(mainColor),
              ),
              child: const Text('Save Goal',
                  style: TextStyle(color: Colors.black)),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildExerciseInputField(
      String label, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 18, color: Colors.white),
        ),
        TextFormField(
          controller: controller,
          keyboardType: TextInputType.number,
          style: const TextStyle(color: Colors.white),
          decoration: const InputDecoration(
            hintText: 'Enter minutes',
            hintStyle: TextStyle(color: Colors.grey),
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

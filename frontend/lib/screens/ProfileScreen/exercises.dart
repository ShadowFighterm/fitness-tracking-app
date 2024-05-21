import 'package:flutter/material.dart';
import 'package:db_final_project_fitness_app/constants/Color.dart';
import 'package:db_final_project_fitness_app/static.dart';

class ExerciseInputPage extends StatefulWidget {
  const ExerciseInputPage({Key? key}) : super(key: key);

  @override
  _ExerciseInputPageState createState() => _ExerciseInputPageState();
}

class _ExerciseInputPageState extends State<ExerciseInputPage> {
  DateTime currentDate = DateTime.now();

  final TextEditingController runningController = TextEditingController();
  final TextEditingController cyclingController = TextEditingController();
  final TextEditingController swimmingController = TextEditingController();
  final TextEditingController walkingController = TextEditingController();
  final TextEditingController weightliftingController = TextEditingController();
  final TextEditingController yogaController = TextEditingController();
  final TextEditingController jumpingRopeController = TextEditingController();
  final TextEditingController aerobicsController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: mainColor,
        title: const Text('Exercise Input'),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildExerciseInputField('Running (minutes):', runningController),
              buildExerciseInputField('Cycling (minutes):', cyclingController),
              buildExerciseInputField(
                  'Swimming (minutes):', swimmingController),
              buildExerciseInputField('Walking (minutes):', walkingController),
              buildExerciseInputField(
                  'Weightlifting (minutes):', weightliftingController),
              buildExerciseInputField('Yoga (minutes):', yogaController),
              buildExerciseInputField(
                  'Jumping Rope (minutes):', jumpingRopeController),
              buildExerciseInputField(
                  'Aerobics (minutes):', aerobicsController),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: saveExerciseData,
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(mainColor),
                ),
                child: const Text('Save Exercises',
                    style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
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
            border: InputBorder.none,
          ),
        ),
        const SizedBox(height: 20),
      ],
    );
  }

  void saveExerciseData() {
    setState(() {
      double running = double.tryParse(runningController.text) ?? 0.0;
      double cycling = double.tryParse(cyclingController.text) ?? 0.0;
      double swimming = double.tryParse(swimmingController.text) ?? 0.0;
      double walking = double.tryParse(walkingController.text) ?? 0.0;
      double weightlifting =
          double.tryParse(weightliftingController.text) ?? 0.0;
      double yoga = double.tryParse(yogaController.text) ?? 0.0;
      double jumpingRope = double.tryParse(jumpingRopeController.text) ?? 0.0;
      double aerobics = double.tryParse(aerobicsController.text) ?? 0.0;

      // Store the exercise data for the current date
      userProv.updateExerciseData(currentDate, {
        'running': running,
        'cycling': cycling,
        'swimming': swimming,
        'walking': walking,
        'weightlifting': weightlifting,
        'yoga': yoga,
        'jumpingRope': jumpingRope,
        'aerobics': aerobics,
      });
    });

    Navigator.pop(context); // Go back to the previous screen
  }
}

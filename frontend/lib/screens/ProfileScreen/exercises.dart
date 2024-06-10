// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:db_final_project_fitness_app/constants/Color.dart';
import 'package:db_final_project_fitness_app/static.dart';
import 'package:db_final_project_fitness_app/Provider/AuthProv.dart';

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

  void initState() {
    super.initState();
    // Set initial values to controllers
    runningController.text = workoutProgressProv.running.toString();
    cyclingController.text = workoutProgressProv.cycling.toString();
    swimmingController.text = workoutProgressProv.swimming.toString();
    walkingController.text = workoutProgressProv.walking.toString();
    weightliftingController.text = workoutProgressProv.weightlifting.toString();
    yogaController.text = workoutProgressProv.yoga.toString();
    jumpingRopeController.text = workoutProgressProv.jumpingRope.toString();
    aerobicsController.text = workoutProgressProv.jumpingRope.toString();
  }

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
              buildExerciseInputField('Running :', runningController),
              buildExerciseInputField('Cycling :', cyclingController),
              buildExerciseInputField('Swimming :', swimmingController),
              buildExerciseInputField('Walking :', walkingController),
              buildExerciseInputField(
                  'Weightlifting :', weightliftingController),
              buildExerciseInputField('Yoga :', yogaController),
              buildExerciseInputField('Jumping Rope :', jumpingRopeController),
              buildExerciseInputField('Aerobics :', aerobicsController),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  int running = int.parse(runningController.text.isEmpty
                      ? '0'
                      : runningController.text);
                  int cycling = int.parse(cyclingController.text.isEmpty
                      ? '0'
                      : cyclingController.text);
                  int swimming = int.parse(swimmingController.text.isEmpty
                      ? '0'
                      : swimmingController.text);
                  int walking = int.parse(walkingController.text.isEmpty
                      ? '0'
                      : walkingController.text);
                  int weightlifting = int.parse(
                      weightliftingController.text.isEmpty
                          ? '0'
                          : weightliftingController.text);
                  int yoga = int.parse(
                      yogaController.text.isEmpty ? '0' : yogaController.text);
                  int jumpingRope = int.parse(jumpingRopeController.text.isEmpty
                      ? '0'
                      : jumpingRopeController.text);
                  int aerobics = int.parse(aerobicsController.text.isEmpty
                      ? '0'
                      : aerobicsController.text);

                  workoutProgressProv.setrunning(running);
                  workoutProgressProv.setcycling(cycling);
                  workoutProgressProv.setaerobics(aerobics);
                  workoutProgressProv.setjumpingRope(jumpingRope);
                  workoutProgressProv.setswimming(swimming);
                  workoutProgressProv.setwalking(walking);
                  workoutProgressProv.setweightlifting(weightlifting);
                  workoutProgressProv.setyoga(yoga);

                  int total = running +
                      cycling +
                      swimming +
                      walking +
                      weightlifting +
                      yoga +
                      jumpingRope +
                      aerobics;
                  var res = await workoutProgressProv.AddProgress(
                      userProv.email,
                      DateTime.now().toString().substring(0, 10),
                      total * 100,
                      walking * 80,
                      total,
                      total * 10);

                  Navigator.pop(context);
                  Navigator.pushNamed(context, '/NavigationBar');
                  await workoutProgressProv.GetProgress(userProv.email,
                      DateTime.now().toString().substring(0, 10));
                },
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
}

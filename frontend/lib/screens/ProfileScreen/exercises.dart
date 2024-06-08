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
                  var res = await userProv.UpdateUserInfo_2(
                      userProv.email,
                      userProv.name,
                      userProv.weight,
                      userProv.height,
                      userProv.age,
                      userProv.goal,
                      int.parse(runningController.text.isEmpty? '0':runningController.text),
                      int.parse(cyclingController.text.isEmpty? '0':cyclingController.text),
                      int.parse(swimmingController.text.isEmpty? '0':swimmingController.text),
                      int.parse(walkingController.text.isEmpty? '0':walkingController.text),
                      int.parse(weightliftingController.text.isEmpty? '0':weightliftingController.text),
                      int.parse(yogaController.text.isEmpty? '0':yogaController.text),
                      int.parse(jumpingRopeController.text.isEmpty? '0':jumpingRopeController.text),
                      int.parse(aerobicsController.text.isEmpty? '0':aerobicsController.text),
                      );
                  setState(() {});
                  // You can add further logic here to save the changes permanently
                  if (res == "success") {
                    Navigator.pop(context);
                  }
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

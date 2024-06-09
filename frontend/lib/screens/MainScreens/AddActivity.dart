
import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:db_final_project_fitness_app/constants/Color.dart';
import 'package:db_final_project_fitness_app/static.dart';

class AddActivityPage extends StatefulWidget {
  @override
  _AddActivityPageState createState() => _AddActivityPageState();
}

class _AddActivityPageState extends State<AddActivityPage> {
  int caloriesBurnt = workoutProgressProv.caloriesBurnt;
  int steps = workoutProgressProv.steps;
  int time = workoutProgressProv.time;
  int heartRate = workoutProgressProv.heartRate;
  String date = workoutProgressProv.date;

  TextEditingController caloriesController = TextEditingController();
  TextEditingController stepsController = TextEditingController();
  TextEditingController heartRateController = TextEditingController();
  TextEditingController timeController = TextEditingController();

  @override
  void initState() {
    super.initState();
    caloriesController.text = caloriesBurnt.toString();
    stepsController.text = steps.toString();
    timeController.text = time.toString();
    heartRateController.text = heartRate.toString();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Add Activity'),
        foregroundColor: Colors.grey,
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Calories Burnt:',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              TextField(
                controller: caloriesController,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter calories burnt',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Steps:',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              TextField(
                controller: stepsController,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter steps',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Heart Rate:',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              TextField(
                controller: heartRateController,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter heart rate',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
              SizedBox(height: 16.0),
              Text(
                'Time (minutes):',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              TextField(
                controller: timeController,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter time in minutes',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
              SizedBox(height: 16.0),
              ElevatedButton(
                onPressed: () async
                {
                  var res = await workoutProgressProv.AddProgress(userProv.email, date, int.parse(caloriesController.text), int.parse(stepsController.text), int.parse(timeController.text), int.parse(heartRateController.text));
                  if(res == "success")
                  {
                    Navigator.pop(context);
                  }
                },
                child: Text('Save', style: TextStyle(color: Colors.black)),
                style: ElevatedButton.styleFrom(
                backgroundColor: mainColor, // Set the button color to mainColor
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

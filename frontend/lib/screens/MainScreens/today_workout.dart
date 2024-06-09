import 'package:db_final_project_fitness_app/constants/Color.dart';
import 'package:flutter/material.dart';

class WorkoutDetailsPage extends StatelessWidget {
  final List<Workout> workoutPlan = [
    Workout(
      day: 'Monday',
      runningMinutes: 30,
      cyclingMinutes: 0,
      swimmingMinutes: 45,
      walkingMinutes: 0,
      weightliftingMinutes: 60,
      yogaMinutes: 0,
      jumpingRopeMinutes: 0,
      aerobicsMinutes: 0,
    ),
    Workout(
      day: 'Tuesday',
      runningMinutes: 0,
      cyclingMinutes: 45,
      swimmingMinutes: 0,
      walkingMinutes: 30,
      weightliftingMinutes: 0,
      yogaMinutes: 60,
      jumpingRopeMinutes: 0,
      aerobicsMinutes: 0,
    ),
    Workout(
      day: 'Wednesday',
      runningMinutes: 45,
      cyclingMinutes: 0,
      swimmingMinutes: 0,
      walkingMinutes: 0,
      weightliftingMinutes: 30,
      yogaMinutes: 0,
      jumpingRopeMinutes: 0,
      aerobicsMinutes: 60,
    ),
    Workout(
      day: 'Thursday',
      runningMinutes: 0,
      cyclingMinutes: 0,
      swimmingMinutes: 30,
      walkingMinutes: 60,
      weightliftingMinutes: 0,
      yogaMinutes: 45,
      jumpingRopeMinutes: 0,
      aerobicsMinutes: 0,
    ),
    Workout(
      day: 'Friday',
      runningMinutes: 60,
      cyclingMinutes: 0,
      swimmingMinutes: 0,
      walkingMinutes: 0,
      weightliftingMinutes: 45,
      yogaMinutes: 0,
      jumpingRopeMinutes: 0,
      aerobicsMinutes: 30,
    ),
    Workout(
      day: 'Saturday',
      runningMinutes: 0,
      cyclingMinutes: 0,
      swimmingMinutes: 60,
      walkingMinutes: 0,
      weightliftingMinutes: 0,
      yogaMinutes: 30,
      jumpingRopeMinutes: 45,
      aerobicsMinutes: 0,
    ),
    Workout(
      day: 'Sunday',
      runningMinutes: 0,
      cyclingMinutes: 0,
      swimmingMinutes: 0,
      walkingMinutes: 45,
      weightliftingMinutes: 30,
      yogaMinutes: 0,
      jumpingRopeMinutes: 60,
      aerobicsMinutes: 0,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    int currentDayIndex = now.weekday; // Adjusting for zero-based index
    Workout currentDayWorkout = workoutPlan[currentDayIndex % 7];

    return Scaffold(
      backgroundColor: Color.fromRGBO(0, 0, 0, 0),
      appBar: AppBar(
        title: Text('Today\'s Workout Plan'),
        backgroundColor: mainColor, // Change color as needed
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Stay Fit, Stay Strong!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: mainColor,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                height: 200,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/StartupScreen/bg3.png'), // Add your image asset path here
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Today\'s Workout:',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: mainColor,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'Running:                     ${currentDayWorkout.runningMinutes} minutes',
                style: TextStyle(
                  fontSize: 18,
                  color: mainColor,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Cycling:                      ${currentDayWorkout.cyclingMinutes} minutes',
                style: TextStyle(
                  fontSize: 18,
                  color: mainColor,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Swimming:                ${currentDayWorkout.swimmingMinutes} minutes',
                style: TextStyle(
                  fontSize: 18,
                  color: mainColor,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Walking:                     ${currentDayWorkout.walkingMinutes} minutes',
                style: TextStyle(
                  fontSize: 18,
                  color: mainColor,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Weightlifting:             ${currentDayWorkout.weightliftingMinutes} minutes',
                style: TextStyle(
                  fontSize: 18,
                  color: mainColor,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Yoga:                          ${currentDayWorkout.yogaMinutes} minutes',
                style: TextStyle(
                  fontSize: 18,
                  color: mainColor,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Jumping Rope:         ${currentDayWorkout.jumpingRopeMinutes} minutes',
                style: TextStyle(
                  fontSize: 18,
                  color: mainColor,
                ),
              ),
              SizedBox(height: 5),
              Text(
                'Aerobics:                   ${currentDayWorkout.aerobicsMinutes} minutes',
                style: TextStyle(
                  fontSize: 18,
                  color: mainColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Workout {
  final String day;
  final int runningMinutes;
  final int cyclingMinutes;
  final int swimmingMinutes;
  final int walkingMinutes;
  final int weightliftingMinutes;
  final int yogaMinutes;
  final int jumpingRopeMinutes;
  final int aerobicsMinutes;

  Workout({
    required this.day,
    required this.runningMinutes,
    required this.cyclingMinutes,
    required this.swimmingMinutes,
    required this.walkingMinutes,
    required this.weightliftingMinutes,
    required this.yogaMinutes,
    required this.jumpingRopeMinutes,
    required this.aerobicsMinutes,
  });
}

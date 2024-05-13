import 'package:db_final_project_fitness_app/constants/Color.dart';
import 'package:db_final_project_fitness_app/static.dart';
import 'package:flutter/material.dart';

class ActivityScreen extends StatefulWidget {
  const ActivityScreen({super.key});

  @override
  State<ActivityScreen> createState() => _ActivityScreenState();
}

class _ActivityScreenState extends State<ActivityScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> levels = [
      'Rookie',
      'Beginner',
      'Intermediate',
      'Advanced',
      'Pro',
    ];

    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        padding: EdgeInsets.only(
          top: size.height * 0.02,
          left: size.width * 0.05,
          right: size.width * 0.05,
          bottom: size.height * 0.03,
        ),
        width: size.width,
        height: size.height,
        child: Column(
          children: [
            SizedBox(
              height: size.height * 0.11,
            ),
            Text(
              "SELECT YOUR ACTIVITY LEVEL",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: size.height * 0.03,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            Text(
              "Tell us what is your current activity level",
              style:
                  TextStyle(color: Colors.white, fontSize: size.height * 0.016),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            SizedBox(
              height: size.height * 0.45,
              child: RotatedBox(
                quarterTurns: 0,
                child: ListWheelScrollView(
                  physics: const FixedExtentScrollPhysics(),
                  controller: FixedExtentScrollController(initialItem: 3),
                  itemExtent: size.height * 0.090,
                  useMagnifier: true,
                  magnification: 1.3,
                  overAndUnderCenterOpacity: 0.4,
                  onSelectedItemChanged: (value) {
                    setState(() {});
                    print(value);
                    print(levels[value]);
                    userProv.setActivityLevel(levels[value]);
                  },
                  diameterRatio: 55,
                  children: levels.map((level) {
                    return Text(
                      level,
                      style: TextStyle(
                          fontSize: size.height * 0.040,
                          color: mainColor,
                          fontWeight: FontWeight.bold),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.06,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {Navigator.pushNamed(context, '/height');},
                  child: Container(
                    margin: EdgeInsets.only(
                      top: size.height * 0.02,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,
                    ),
                    height: size.height * 0.07,
                    child: Center(
                      child: Text(
                        "Back",
                        style: TextStyle(
                          color: mainColor,
                          fontSize: size.width * 0.05,
                        ),
                      ),
                    ),
                  ),
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {Navigator.pushNamed(context, '/goal');},
                  child: Container(
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    margin: EdgeInsets.only(
                      top: size.height * 0.02,
                    ),
                    padding: EdgeInsets.symmetric(
                      horizontal: size.width * 0.05,
                    ),
                    height: size.height * 0.07,
                    child: Center(
                      child: Text(
                        "Next",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: size.width * 0.05,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

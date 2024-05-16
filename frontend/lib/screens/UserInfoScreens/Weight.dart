import 'package:db_final_project_fitness_app/constants/Color.dart';
import 'package:db_final_project_fitness_app/static.dart';
import 'package:flutter/material.dart';

class WeightScreen extends StatefulWidget {
  const WeightScreen({super.key});

  @override
  State<WeightScreen> createState() => _WeightScreenState();
}

class _WeightScreenState extends State<WeightScreen> {
  double weight = 12.75;
  @override
  Widget build(BuildContext context) {
    List<String> weights = [];
    for (int i = 1; i < 250; i++) {
      weights.add("v");
    }
    var init = 50;
    var size = MediaQuery.of(context).size;
    userProv.setWeight((init + 1)/ 4);
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
              "SELECT YOUR WEIGHT IN KILOGRAMS",
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
              "You can change your weight information \n after weight lose",
              style:
                  TextStyle(color: Colors.white, fontSize: size.height * 0.016),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            Text('$weight kg',
                style: TextStyle(
                  color: mainColor,
                  fontSize: size.height * 0.04,
                  fontWeight: FontWeight.bold,
                )),
            SizedBox(
              height: size.height * 0.05,
            ),
            SizedBox(
              height: size.height * 0.35,
              child: RotatedBox(
                quarterTurns: 1,
                child: ListWheelScrollView(
                  physics: const FixedExtentScrollPhysics(),
                  controller: FixedExtentScrollController(initialItem: init),
                  itemExtent: size.height * 0.090,
                  useMagnifier: true,
                  magnification: 1.3,
                  overAndUnderCenterOpacity: 0.3,
                  onSelectedItemChanged: (value) {
                    setState(() {
                      weight = ((value + 1) / 4);
                    });
                    double w = ((value + 1) / 4);
                    print(w);
                    userProv.setWeight(w);
                  },
                  diameterRatio: 55,
                  children: weights.map((level) {
                    return Text(
                      level,
                      style: TextStyle(
                          fontSize: size.height * 0.080,
                          color: mainColor,
                          fontWeight: FontWeight.bold),
                    );
                  }).toList(),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.03,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {Navigator.pushNamed(context, '/age');},
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
                  onTap: () {Navigator.pushNamed(context, '/height');},
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

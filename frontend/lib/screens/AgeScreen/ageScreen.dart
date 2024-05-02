import 'package:db_final_project_fitness_app/constants.dart';
import 'package:flutter/material.dart';

class AgeScreen extends StatefulWidget {
  const AgeScreen({super.key});

  @override
  State<AgeScreen> createState() => _AgeScreenState();
}

class _AgeScreenState extends State<AgeScreen> {
  @override
  Widget build(BuildContext context) {
    List<String> ages = [];
    for (int i = 1; i < 150; i++) {
      ages.add(i.toString());
    }

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
              "HOW OLD ARE YOU ?",
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
              "This will help us to know much \n more about you.",
              style:
                  TextStyle(color: Colors.white, fontSize: size.height * 0.016),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            SizedBox(
              height: size.height * 0.46,
              child: ListWheelScrollView(
                physics: const FixedExtentScrollPhysics(),
                controller: FixedExtentScrollController(initialItem: 30),
                itemExtent: 50,
                useMagnifier: true,
                magnification: 1.3,
                overAndUnderCenterOpacity: 0.2,
                onSelectedItemChanged: (value) {
                  print(value);
                },
                diameterRatio: 1.3,
                children: List.generate(
                    120,
                    (index) => Text(
                          (index + 5).toString(),
                          style: TextStyle(
                              color: mainColor,
                              fontSize: size.height * 0.05,
                              fontWeight: FontWeight.bold),
                        )),
              ),
            ),
            SizedBox(
              height: size.height * 0.07,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {},
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
                  onTap: () {},
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

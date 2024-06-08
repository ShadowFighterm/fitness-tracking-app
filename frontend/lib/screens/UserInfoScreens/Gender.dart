
import 'package:db_final_project_fitness_app/constants/Color.dart';
import 'package:db_final_project_fitness_app/static.dart';
import 'package:flutter/material.dart';

class GenderScreen extends StatefulWidget {
  const GenderScreen({super.key});

  @override
  State<GenderScreen> createState() => _GenderScreenState();
}

class _GenderScreenState extends State<GenderScreen> {
  bool ismale = true;
  bool isfemale = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    userProv.setGender("male");
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
              "TELL US ABOUT YOUR \n GENDER!",
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
              "This will help us to know much \n more about you",
              style:
                  TextStyle(color: Colors.white, fontSize: size.height * 0.016),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  ismale = true;
                  isfemale = false;
                });
                print("pressed male");
                userProv.setGender("male");
              },
              child: Container(
                padding: EdgeInsets.all(size.width * 0.06),
                decoration: BoxDecoration(
                  color: ismale ? mainColor : Colors.grey,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Icon(Icons.male,
                          size: size.width * 0.2,
                          color: ismale ? Colors.black : Colors.white),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        "Male",
                        style: TextStyle(
                            color: ismale ? Colors.black : Colors.white,
                            fontSize: size.height * 0.02,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.05,
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  ismale = false;
                  isfemale = true;
                });
                print("pressed female");
                userProv.setGender("female");
              },
              child: Container(
                padding: EdgeInsets.all(size.width * 0.06),
                decoration: BoxDecoration(
                  color: isfemale ? mainColor : Colors.grey,
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Icon(Icons.female,
                          size: size.width * 0.2,
                          color: isfemale ? Colors.black : Colors.white),
                      SizedBox(
                        height: size.height * 0.01,
                      ),
                      Text(
                        "Female",
                        style: TextStyle(
                            color: isfemale ? Colors.black : Colors.white,
                            fontSize: size.height * 0.02,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.08,
            ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {Navigator.pop(context);},
                  child: Container(
                    margin: EdgeInsets.only(
                      top: size.height * 0.001,
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
                  onTap: () {
                    Navigator.pushNamed(context, '/age');
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: mainColor,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    margin: EdgeInsets.only(
                      top: size.height * 0.001,
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

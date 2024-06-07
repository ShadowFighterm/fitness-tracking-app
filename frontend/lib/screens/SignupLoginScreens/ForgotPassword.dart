import 'package:db_final_project_fitness_app/constants/Color.dart';
import 'package:flutter/material.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  bool ismale = true;
  bool isfemale = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Color.fromARGB(255, 142, 107, 107),
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
              height: size.height * 0.2,
            ),
            Text(
              "FORGOT PASSWORD ?",
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
              "Enter your email address below or \n login with another account.",
              style:
                  TextStyle(color: Colors.white, fontSize: size.height * 0.016),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: size.height * 0.06,
            ),
            TextFormField(
              cursorColor: Colors.cyan,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                hintText: 'Email',
                hintStyle: TextStyle(
                  color: Colors.white,
                  fontSize: size.width * 0.05,
                ),
                fillColor: Colors.white,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: Colors.grey.shade800,
                  ),
                ),
                focusedBorder: const UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.14,
            ),
            GestureDetector(
              onTap: () {},
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.circular(30),
                ),
                margin: EdgeInsets.only(
                  top: size.height * 0.02,
                ),
                padding: EdgeInsets.symmetric(
                  horizontal: size.width * 0.05,
                ),
                height: size.height * 0.07,
                width: size.width * 0.8,
                child: Center(
                  child: Text(
                    "Try another way",
                    style: TextStyle(
                        color: mainColor,
                        fontSize: size.width * 0.05,
                        decoration: TextDecoration.underline,
                        decorationThickness: 2.0,
                        decorationColor: mainColor),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
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
                width: size.width * 0.8,
                child: Center(
                  child: Text(
                    "Enter",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: size.width * 0.05,
                    ),
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
              ],
            )
          ],
        ),
      ),
    );
  }
}

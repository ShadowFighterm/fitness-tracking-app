

import 'package:db_final_project_fitness_app/constants/Color.dart';import 'package:db_final_project_fitness_app/static.dart';
import 'package:flutter/material.dart';

class AccountInfoPage extends StatefulWidget {
  const AccountInfoPage({Key? key}) : super(key: key);

  @override
  _AccountInfoPageState createState() => _AccountInfoPageState();
}

class _AccountInfoPageState extends State<AccountInfoPage> {
  String name = userProv.name; // Sample initial values
  double weight = userProv.weight;
  int height = userProv.height;
  int age = userProv.age;
  String goal = userProv.goal;

  TextEditingController nameController = TextEditingController();
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController goalController = TextEditingController();

  @override
  void UpdateUserInfo(String email, String name, double weight, int height, int age, String goal) async 
  {

  }
  void initState() {
    super.initState();
    // Set initial values to controllers
    nameController.text = name;
    weightController.text = weight.toString();
    heightController.text = height.toString();
    ageController.text = age.toString();
    goalController.text = goal;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('Account Information'),
      ),
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name:',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              TextFormField(
                controller: nameController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter your name',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Weight (kg):',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              TextFormField(
                controller: weightController,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter your weight',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Height (cm):',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              TextFormField(
                controller: heightController,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter your height',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Age:',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              TextFormField(
                controller: ageController,
                keyboardType: TextInputType.number,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter your age',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Goal:',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              TextFormField(
                controller: goalController,
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  hintText: 'Enter your goal',
                  hintStyle: TextStyle(color: Colors.grey),
                  border: InputBorder.none,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async 
                {
                  // Save the changes
                  var res = await userProv.UpdateUserInfo(userProv.email, nameController.text, double.parse(weightController.text), int.parse(heightController.text), int.parse(ageController.text), goalController.text);
                  setState(() {
                    name = userProv.name;
                    weight = userProv.weight;
                    height = userProv.height;
                    age = userProv.age;
                    goal = userProv.goal;
                  });
                  // You can add further logic here to save the changes permanently
                  if(res == "success")
                  {
                    Navigator.pop(context);
                    Navigator.pop(context);
                    Navigator.pushNamed(context, '/NavigationBar');
                  } // Go back to the previous screen
                },
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(mainColor),
                ),
                child: Text('Save Changes', style: TextStyle(color: Colors.black)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

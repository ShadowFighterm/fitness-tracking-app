import 'package:db_final_project_fitness_app/constants/Color.dart';
import 'package:db_final_project_fitness_app/Provider/AuthProv.dart';
import 'package:db_final_project_fitness_app/static.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isNotValidate = false;

  void loginUser() async {
    if (_emailController.text.isNotEmpty &&
        _passwordController.text.isNotEmpty) {
      var token = await AuthProvider.loginUser(
          _emailController.text, _passwordController.text);
      if (token != null) {
        print('Login successful');
        await workoutProgressProv.GetProgress(
            userProv.email, DateTime.now().toString().substring(0, 10));
        await userProv.GetFriends();
        await userProv.GetNotifications();
        Navigator.pop(context);
        Navigator.pushNamed(context, '/NavigationBar');
      } else {
        print('Login failed');
      }
    } else {
      setState(() {
        _isNotValidate = true;
      });
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/StartupScreen/bg2.png'),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: size.height * 0.09),
              Text(
                "Fitco. Fitness App",
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: mainColor,
                ),
              ),
              SizedBox(height: size.height * 0.04),
              Text(
                "Login",
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: size.height * 0.05),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    TextField(
                      controller: _emailController,
                      style: TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black54,
                        hintText: "Email",
                        hintStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.white70,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                            color: Colors.white30,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                            color: mainColor,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 20,
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.03),
                    TextField(
                      controller: _passwordController,
                      obscureText: true,
                      style: TextStyle(color: Colors.white),
                      cursorColor: Colors.white,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.black54,
                        hintText: "Password",
                        hintStyle: TextStyle(
                          fontSize: 18,
                          color: Colors.white70,
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                            color: Colors.white30,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(25),
                          borderSide: BorderSide(
                            color: mainColor,
                          ),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 20,
                        ),
                      ),
                    ),
                    SizedBox(height: size.height * 0.09),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(context, '/ForgotPassword');
                          },
                          child: const Text(
                            "Forgot Password?",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: mainColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: size.height * 0.07,
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: TextButton(
                          onPressed: () {
                            // Add Google sign-in logic
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/Images/google.png',
                                color: Colors.white,
                                height: size.height * 0.05,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Google',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: size.width * 0.05),
                    Expanded(
                      child: Container(
                        height: size.height * 0.07,
                        decoration: BoxDecoration(
                          color: Colors.grey[800],
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: TextButton(
                          onPressed: () {
                            // Add Apple sign-in logic
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/Images/apple.png',
                                color: Colors.white,
                                height: size.height * 0.05,
                              ),
                              SizedBox(width: 10),
                              Text(
                                'Apple',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: size.height * 0.03),
              Container(
                height: size.height * 0.07,
                width: size.width * 0.8,
                decoration: BoxDecoration(
                  color: mainColor,
                  borderRadius: BorderRadius.circular(25),
                ),
                child: TextButton(
                  onPressed: () {
                    loginUser();
                  },
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Login",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(width: 10),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.03),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/startup');
                },
                child: const Text(
                  "Having No Account?",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: mainColor,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.05),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:db_final_project_fitness_app/constants/Color.dart';
import 'package:db_final_project_fitness_app/static.dart';
import 'package:flutter/material.dart';
import 'package:db_final_project_fitness_app/Provider/AuthProv.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  late PageController _pageController;
  bool isLoginSelected = true;
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  bool _isNotValidate = false;

  void registerUser() async {
    if (_nameController.text.isNotEmpty && _emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
      userProv.setName(_nameController.text);
      userProv.setEmail(_emailController.text);
      var res = await AuthProvider.registerUser(
        userProv.name,
        _emailController.text,
        _passwordController.text,
        userProv.age,
        userProv.gender,
        userProv.height,
        userProv.weight,
        userProv.goal,
        userProv.activityLevel,
      );
      if (res == "success") {
        _pageController.animateToPage(
          0,
          duration: const Duration(milliseconds: 5),
          curve: Curves.easeInOut,
        );
      }
    } else {
      setState(() {
        _isNotValidate = true;
      });
    }
  }

  void loginUser() async {
    if (_emailController.text.isNotEmpty && _passwordController.text.isNotEmpty) {
      var token = await AuthProvider.loginUser(_emailController.text, _passwordController.text);
      if (token != null) {
        print('Login successful');
        await workoutProgressProv.GetProgress(userProv.email, DateTime.now().toString().substring(0,10));
        await userProv.GetFriends();
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
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Image.asset(
              isLoginSelected ? 'assets/StartupScreen/bg2.png' : 'assets/StartupScreen/bg.png',
              height: size.height * 0.65,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Positioned(
            top: 45,
            left: 20,
            right: 20,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    _pageController.animateToPage(
                      0,
                      duration: const Duration(milliseconds: 5),
                      curve: Curves.easeInOut,
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: isLoginSelected ? mainColor : Colors.white,
                    textStyle: TextStyle(
                      shadows: isLoginSelected
                          ? const [
                              Shadow(
                                blurRadius: 10.0,
                                color: Colors.black,
                                offset: Offset(5.0, 5.0),
                              ),
                            ]
                          : null,
                    ),
                  ),
                  child: Text(
                    "Login",
                    style: TextStyle(
                      fontSize: isLoginSelected ? 22 : 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                TextButton(
                  onPressed: () {
                    _pageController.animateToPage(
                      1,
                      duration: const Duration(milliseconds: 5),
                      curve: Curves.easeInOut,
                    );
                  },
                  style: TextButton.styleFrom(
                    foregroundColor: isLoginSelected ? Colors.white : mainColor,
                    textStyle: TextStyle(
                      shadows: isLoginSelected
                          ? null
                          : const [
                              Shadow(
                                blurRadius: 10.0,
                                color: Colors.black,
                                offset: Offset(5.0, 5.0),
                              ),
                            ],
                    ),
                  ),
                  child: Text(
                    "Sign up",
                    style: TextStyle(
                      fontSize: isLoginSelected ? 20 : 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const Expanded(child: SizedBox.shrink()),
                // CircleAvatar
                isLoginSelected
                    ? const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage('assets/Images/profile.jpg'),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
          Positioned(
            top: size.height * 0.40,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                isLoginSelected ? "Welcome back, \nUser".toUpperCase() : "Hello rookies".toUpperCase(),
                style: TextStyle(
                  fontSize: size.width * 0.095,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Positioned(
            top: size.height * (isLoginSelected ? 0.62 : 0.52),
            left: 0,
            right: 0,
            child: SizedBox(
              height: size.height * 0.5,
              child: PageView(
                controller: _pageController,
                onPageChanged: (index) {
                  setState(() {
                    isLoginSelected = index == 0;
                  });
                },
                children: [
                  // Login Page
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        TextField(
                          controller: _emailController,
                          style: TextStyle(color: Colors.grey), // Set typed text color to grey
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[500],
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade800,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          style: TextStyle(color: Colors.grey), // Set typed text color to grey
                          cursorColor: Colors.grey,
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[500],
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade800,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () {
                                Navigator.pushNamed(context, '/ForgotPassword');
                              },
                              child: const Text(
                                "Forgot Password ?",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: mainColor,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.025),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: size.height * 0.07,
                              width: size.height * 0.07,
                              decoration: BoxDecoration(
                                color: Colors.grey[800],
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  // Add Google sign-in logic
                                },
                                child: Image.asset(
                                  'assets/Images/google.png',
                                  color: Colors.white,
                                  height: size.height * 0.05,
                                ),
                              ),
                            ),
                            SizedBox(width: size.width * 0.05),
                            Container(
                              height: size.height * 0.07,
                              width: size.height * 0.07,
                              decoration: BoxDecoration(
                                color: Colors.grey[800],
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  // Add Apple sign-in logic
                                },
                                child: Image.asset(
                                  'assets/Images/apple.png',
                                  color: Colors.white,
                                  height: size.height * 0.05,
                                ),
                              ),
                            ),
                            const Expanded(child: SizedBox.shrink()),
                            Container(
                              height: size.height * 0.06,
                              width: size.width * 0.3,
                              decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  // _login();
                                  loginUser();
                                },
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Login",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.04),
                      ],
                    ),
                  ),

                  // Sign-up Page
                  // Name

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        TextField(
                          controller: _nameController,
                          style: TextStyle(color: Colors.grey), // Set typed text color to grey
                          decoration: InputDecoration(
                            hintText: "Name",
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[500],
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade800,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        TextField(
                          controller: _emailController,
                          style: TextStyle(color: Colors.grey), // Set typed text color to grey
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[500],
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade800,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        TextField(
                          controller: _passwordController,
                          obscureText: true,
                          style: TextStyle(color: Colors.grey), // Set typed text color to grey
                          decoration: InputDecoration(
                            hintText: "Password",
                            hintStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[500],
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade800,
                              ),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey.shade300,
                              ),
                            ),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: size.height * 0.07,
                              width: size.height * 0.07,
                              decoration: BoxDecoration(
                                color: Colors.grey[800],
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  // Add Google sign-up logic
                                },
                                child: Image.asset(
                                  'assets/Images/google.png',
                                  color: Colors.white,
                                  height: size.height * 0.05,
                                ),
                              ),
                            ),
                            SizedBox(width: size.width * 0.05),
                            Container(
                              height: size.height * 0.07,
                              width: size.height * 0.07,
                              decoration: BoxDecoration(
                                color: Colors.grey[800],
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  // Add Apple sign-up logic
                                },
                                child: Image.asset(
                                  'assets/Images/apple.png',
                                  color: Colors.white,
                                  height: size.height * 0.05,
                                ),
                              ),
                            ),
                            const Expanded(child: SizedBox.shrink()),
                            Container(
                              height: size.height * 0.06,
                              width: size.width * 0.3,
                              decoration: BoxDecoration(
                                color: mainColor,
                                borderRadius: BorderRadius.circular(25),
                              ),
                              child: TextButton(
                                onPressed: () {
                                  registerUser();
                                  print(userProv.name);
                                  print(userProv.gender);
                                  print(userProv.age);
                                  print(userProv.height);
                                  print(userProv.weight);
                                  print(userProv.activityLevel);
                                  print(userProv.goal);
                                },
                                child: const Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Sign up",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black,
                                      ),
                                    ),
                                    SizedBox(width: 5),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.black,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: size.height * 0.055),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}

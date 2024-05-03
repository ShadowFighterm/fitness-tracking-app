import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class StartupScreen extends StatefulWidget {
  const StartupScreen({super.key});

  @override
  State<StartupScreen> createState() => _StartupScreenState();
}

class _StartupScreenState extends State<StartupScreen> {
  PageController controller = PageController();
  bool lastPage = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: [
            PageView(
                controller: controller,
                onPageChanged: (index) {
                  setState(() {
                    lastPage = index == 2;
                  });
                },
                children: [
                  _PageIndicator(
                      text: 'Meet your coach,\nstart your journey',
                      ImageAsset: 'assets/StartupScreen/bg2.png'),
                  _PageIndicator(
                      text: 'Create a workout plan\nto stay fit',
                      ImageAsset: 'assets/StartupScreen/bg1.png'),
                  _PageIndicator(
                      text: 'Action is the key\nto all success',
                      ImageAsset: 'assets/StartupScreen/bg3.png'),
                ]),
            lastPage
                ? const SizedBox.shrink()
                : Positioned(
                    top: size.height * 0.05,
                    right: size.width * 0.05,
                    child: TextButton(
                      onPressed: () {
                        controller.animateToPage(2,
                            duration: const Duration(
                              milliseconds: 300,
                            ),
                            curve: Curves.easeIn);
                      },
                      child: const Text(
                        'Skip',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )),
            lastPage
                ? Positioned(
                    left: size.width * 0.22,
                    right: size.width * 0.17,
                    bottom: size.height * 0.09,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 20),
                      width: size.width * 0.5,
                      decoration: BoxDecoration(
                          color: Color.fromARGB(255, 141, 211, 144),
                          borderRadius: BorderRadius.circular(30)),
                      child: Row(
                        children: [
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/gender');
                            },
                            child: const Text(
                              'Get Started',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          const Icon(
                            Icons.arrow_forward_ios,
                            color: Colors.black,
                          )
                        ],
                      ),
                    ))
                : const SizedBox.shrink(),
            Positioned(
                bottom: size.height * 0.01,
                left: size.width * 0.44,
                child: SmoothPageIndicator(
                    controller: controller,
                    count: 3,
                    effect: const ExpandingDotsEffect(
                        dotHeight: 10,
                        dotWidth: 10,
                        dotColor: Colors.grey,
                        activeDotColor: Color.fromARGB(255, 149, 214, 151))))
          ],
        ));
  }

  Widget _PageIndicator({required String ImageAsset, required String text}) {
    var size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Image.asset(
          ImageAsset,
          height: size.height * 0.6,
          width: size.width,
          fit: BoxFit.cover,
        ),
        Positioned(
            bottom: 0,
            child: Container(
                height: size.height * 0.6,
                width: size.width,
                child: Center(
                    child: Text(
                  text.toUpperCase(),
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ))))
      ],
    );
  }
}

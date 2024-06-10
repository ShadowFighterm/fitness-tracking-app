import 'package:db_final_project_fitness_app/static.dart';
import 'package:flutter/material.dart';
import 'package:db_final_project_fitness_app/constants/Color.dart';
import 'package:db_final_project_fitness_app/screens/MainScreens/Home.dart';
import 'package:db_final_project_fitness_app/screens/MainScreens/Notification.dart';
import 'package:db_final_project_fitness_app/screens/ProfileScreen/Profile.dart';
import 'package:db_final_project_fitness_app/screens/MainScreens/WorkoutProgress.dart';
import 'package:db_final_project_fitness_app/screens/MainScreens/CommunityPage.dart'; // Import the Community page

class HomepageNavbar extends StatefulWidget {
  const HomepageNavbar({super.key});

  @override
  State<HomepageNavbar> createState() => _HomepageNavbarState();
}

class _HomepageNavbarState extends State<HomepageNavbar> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    workoutProgress(),
    NotificationPage(),
    ProfilePage(),
    CommunityPage(), // Add the Community page
  ];

  void _onItemTapped(int index)async {
    if(_selectedIndex == 1)
    {
      await workoutProgressProv.GetProgress(userProv.email, DateTime.now().toString().substring(0,10));
    }
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
            canvasColor: Colors.black,
          ),
          child: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.poll),
                label: 'Progress',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications_active_sharp),
                label: 'Notifications',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.person),
                label: 'Profile',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.group),
                label: 'Community',
              ),
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: mainColor,
            unselectedItemColor: Colors.grey,
            onTap: _onItemTapped,
          ),
        ),
      ),
    );
  }
}
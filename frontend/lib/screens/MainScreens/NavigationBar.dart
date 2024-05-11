import 'package:flutter/material.dart';
import 'package:db_final_project_fitness_app/constants/Color.dart'; 
import 'package:db_final_project_fitness_app/screens/MainScreens/Home.dart';
import 'package:db_final_project_fitness_app/screens/MainScreens/Notification.dart';
import 'package:db_final_project_fitness_app/screens/ProfileScreen/Profile.dart';
import 'package:db_final_project_fitness_app/screens/MainScreens/WorkoutProgress.dart';

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
  ];

    void _onItemTapped(int index) {
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
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: mainColor,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
        ),
      ),),
    );
  }
}
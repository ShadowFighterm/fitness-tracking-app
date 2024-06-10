import 'package:flutter/material.dart';
import 'package:db_final_project_fitness_app/screens/MainScreens/managefriends.dart';
import 'package:db_final_project_fitness_app/screens/MainScreens/leaderboard.dart';
import 'package:db_final_project_fitness_app/constants/Color.dart';

class CommunityPage extends StatefulWidget {
  @override
  _CommunityPageState createState() => _CommunityPageState();
}

class _CommunityPageState extends State<CommunityPage> {
  int _selectedIndex = 0;

  static List<Widget> _pages = <Widget>[
    LeaderBoardPage(),
    ManageFriend(),
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
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(
                  child: _pages[_selectedIndex],
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.leaderboard),
              label: 'Leaderboard',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group),
              label: 'Friends',
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: mainColor,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.black,
          onTap: _onItemTapped,
        ),
      ),
    );
  }
}

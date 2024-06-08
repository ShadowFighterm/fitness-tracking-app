import 'package:flutter/material.dart';

class Friend {
  final String name;
  final int streak;
  final int burnedCalories;
  final String imagePath;

  Friend({
    required this.name,
    required this.streak,
    required this.burnedCalories,
    required this.imagePath,
  });
}

class ManageFriend extends StatefulWidget {
  @override
  _ManageFriendState createState() => _ManageFriendState();
}

class _ManageFriendState extends State<ManageFriend> {
  List<Friend> friends = [
    Friend(name: 'Friend 1', streak: 5, burnedCalories: 300, imagePath: 'assets/profile.jpg'),
    Friend(name: 'Friend 2', streak: 10, burnedCalories: 500, imagePath: 'assets/profile.jpg'),
    Friend(name: 'Friend 3', streak: 3, burnedCalories: 200, imagePath: 'assets/profile.jpg'),
    Friend(name: 'Friend 4', streak: 7, burnedCalories: 400, imagePath: 'assets/profile.jpg'),
    Friend(name: 'Friend 5', streak: 15, burnedCalories: 600, imagePath: 'assets/profile.jpg'),
  ];

  TextEditingController _controller = TextEditingController();

  void removeFriend(int index) {
    setState(() {
      friends.removeAt(index);
    });
  }

  void addFriend(String name) {
    setState(() {
      friends.add(Friend(name: name, streak: 0, burnedCalories: 0, imagePath: 'assets/default_friend.jpg'));
      _controller.clear(); // Clear the text field after adding friend
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF1c1c1e), // Background color #1c1c1e
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Text(
                      "Friend Community",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: _controller,
                          decoration: InputDecoration(
                            hintText: 'Enter friend name',
                            fillColor: Colors.white,
                            filled: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide.none,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      ElevatedButton(
                        onPressed: () {
                          if (_controller.text.isNotEmpty) {
                            addFriend(_controller.text);
                          }
                        },
                        child: Text('Add Friend'),
                        style: ButtonStyle(
                          backgroundColor: WidgetStateProperty.all<Color>(Colors.green),
                          foregroundColor: WidgetStateProperty.all<Color>(Colors.black),
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: friends.asMap().entries.map((entry) {
                    final int index = entry.key;
                    final Friend friend = entry.value;
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFF2c2c2e), // Friend box color #2c2c2e
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 10),
                          CircleAvatar(
                            radius: 30,
                            backgroundImage: AssetImage(friend.imagePath),
                          ),
                          SizedBox(width: 10),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                friend.name,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              SizedBox(height: 5),
                              Text(
                                "Streak: ${friend.streak}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "Burned Calories: ${friend.burnedCalories}",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          IconButton(
                            icon: Icon(Icons.remove_circle, color: Colors.red),
                            onPressed: () {
                              removeFriend(index);
                            },
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

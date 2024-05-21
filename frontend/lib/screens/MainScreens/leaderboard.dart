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

class LeaderBoardPage extends StatelessWidget {
  final List<Friend> friends = [
    Friend(name: 'Friend 1', streak: 5, burnedCalories: 300, imagePath: 'assets/friend1.jpg'),
    Friend(name: 'Friend 2', streak: 10, burnedCalories: 500, imagePath: 'assets/friend2.jpg'),
    Friend(name: 'Friend 3', streak: 3, burnedCalories: 200, imagePath: 'assets/friend3.jpg'),
    Friend(name: 'Friend 4', streak: 7, burnedCalories: 400, imagePath: 'assets/friend4.jpg'),
    Friend(name: 'Friend 5', streak: 15, burnedCalories: 600, imagePath: 'assets/friend5.jpg'),
  ];

  @override
  Widget build(BuildContext context) {
    friends.sort((a, b) => b.burnedCalories.compareTo(a.burnedCalories));

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF1c1c1e),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                        Container(
                        decoration: BoxDecoration(
                          color: Colors.grey.shade800, // Background color of the circle
                          shape: BoxShape.circle,       // Makes the container round
                        ),
                        child: IconButton(
                          icon: Icon(Icons.arrow_back, color: Colors.white),
                          onPressed: () {
                            Navigator.pop(context);
                          },
                        ),
                      ),
                    Expanded(
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: Text(
                            "Leaderboard",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  children: friends.take(5).map((friend) {
                    int index = friends.indexOf(friend);
                    return Container(
                      margin: EdgeInsets.symmetric(vertical: 10),
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xFF2c2c2e),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "#${index + 1}",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
                          if (index == 0 || index == 1 || index == 2) ...[
                            Icon(
                              Icons.emoji_events,
                              color: index == 0 ? Colors.amber : index == 1 ? Colors.grey : Colors.brown,
                              size: 50,
                            ),
                            SizedBox(width: 10),
                          ],
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
import 'package:db_final_project_fitness_app/Provider/UserProv.dart';
import 'package:db_final_project_fitness_app/constants/Color.dart';
import 'package:db_final_project_fitness_app/static.dart';
import 'package:flutter/material.dart';

class ManageFriend extends StatefulWidget {
  @override
  _ManageFriendState createState() => _ManageFriendState();
}

class _ManageFriendState extends State<ManageFriend> {
  List<FriendProvider> friends = userProv.friends;

  TextEditingController _controller = TextEditingController();

  void removeFriend(int index) async {
    var res = await userProv.RemoveFriend(userProv.friends[index].email);
    setState(() {
      friends = userProv.friends;
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
                      IconButton(
                        icon: Icon(Icons.search, color: mainColor),
                        onPressed: () async {
                          if (_controller.text.isNotEmpty) {
                            await userProv.GetUsersWithName(_controller.text);
                            await Navigator.pushNamed(context, '/searchPage');
                            setState(() {
                              friends = userProv.friends;
                            });
                          }
                        },
                      ),
                    ],
                  ),
                ),
                friends.isEmpty
                    ? Center(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            "No friend found",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      )
                    : ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemCount: friends.length,
                        itemBuilder: (context, index) {
                          final friend = friends[index];
                          return Container(
                            margin: EdgeInsets.symmetric(vertical: 10),
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color:
                                  Color(0xFF2c2c2e), // Friend box color #2c2c2e
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      AssetImage('assets/Images/profile.jpg'),
                                ),
                                SizedBox(width: 10),
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                      // Text(
                                      //   "ID: ${friend.email}",
                                      //   style: TextStyle(
                                      //     color: Colors.white,
                                      //     fontSize: 16,
                                      //   ),
                                      Text(
                                        "Burned Cal: ${friend.caloriesBurnt}",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                IconButton(
                                  icon: Icon(Icons.remove_circle,
                                      color: Colors.red),
                                  onPressed: () {
                                    removeFriend(index);
                                  },
                                ),
                              ],
                            ),
                          );
                        },
                      ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

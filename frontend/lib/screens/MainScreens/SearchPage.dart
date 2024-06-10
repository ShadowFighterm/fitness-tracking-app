import 'package:flutter/material.dart';
import 'package:db_final_project_fitness_app/Provider/UserProv.dart';
import 'package:db_final_project_fitness_app/static.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<SearchedUserProv> searchList = userProv.searchList;

  void addFriend(int index) async
  {
    print(userProv.searchList[index].email);
    var res = await userProv.AddFriend(userProv.searchList[index].email);
    if (res == "success")
    {  
      userProv.searchList.removeAt(index); 
    }
    setState(() {
      searchList = userProv.searchList;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Friends'),
        backgroundColor: Color(0xFF1c1c1e),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      backgroundColor: Color(0xFF1c1c1e),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20),
              child: Text(
                'Search Results',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: searchList.length,
                itemBuilder: (context, index) {
                  final user = searchList[index];
                  return ListTile(
                    contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    leading: CircleAvatar(
                      backgroundImage: AssetImage('assets/Images/profile.jpg'), // Placeholder image
                    ),
                    title: Text(
                      user.name,
                      style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      user.email,
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    trailing: IconButton(
                      icon: Icon(Icons.add_circle, color: Colors.green),
                      onPressed: () {
                        addFriend(index);
                      },
                    ),
                    tileColor: Color(0xFF2c2c2e),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

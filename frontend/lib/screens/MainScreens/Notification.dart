import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Center(
          child: Text(
            'Notification',
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
      ),
      body: const _NotificationLisState(),
    );
  }
}

class _NotificationLisState extends StatefulWidget {
  const _NotificationLisState({super.key});

  @override
  State<_NotificationLisState> createState() => __NotificationLisStateState();
}

class __NotificationLisStateState extends State<_NotificationLisState> {
  List<String> notification = [
    'Well Done! You have completed your goal.',
    'You have successfully logged in.',
    'Congratulations on your progress',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return Dismissible(
        key: UniqueKey(),
        onDismissed: (direction) {
          setState(() {
            notification.removeAt(index);
          });
        },
        background: Container(
          color: Colors.red,
          child: const Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.delete,
                color: Colors.white,
              ),
            ),
          ),
        ),
        child: buildNotifiactionList(context),
      );
    });
  }
}

Widget buildNotifiactionList(BuildContext context) {
  return Container(
    padding: const EdgeInsets.all(20),
    child: const Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Congratulations",
              style: TextStyle(
                color: Colors.white24,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              '12:00 PM',
              style: TextStyle(
                color: Colors.grey,
              ),
            )
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'You have completed your goal.',
            style: TextStyle(
              color: Colors.white,
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),

        )
      ],
    ),
  );
}

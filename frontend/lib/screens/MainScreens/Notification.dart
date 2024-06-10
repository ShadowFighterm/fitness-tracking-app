import 'package:db_final_project_fitness_app/static.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key});

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
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: const _NotificationListState(),
    );
  }
}

class _NotificationListState extends StatefulWidget {
  const _NotificationListState({Key? key});

  @override
  State<_NotificationListState> createState() => __NotificationListStateState();
}

class __NotificationListStateState extends State<_NotificationListState> {
  List<dynamic> notifications = userProv.notifications;

  @override
  Widget build(BuildContext context) {
    List<dynamic> todayNotifications = [];
    List<dynamic> previousNotifications = [];

    DateTime now = DateTime.now();
    DateTime todayStart = DateTime(now.year, now.month, now.day);

    for (var notification in notifications) {
      DateTime notificationTime = DateTime.parse(notification['timestamp']).toLocal();
      if (notificationTime.isAfter(todayStart)) {
        todayNotifications.add(notification);
      } else {
        previousNotifications.add(notification);
      }
    }

    return ListView.builder(
      itemCount: todayNotifications.length + previousNotifications.length,
      itemBuilder: (context, index) {
        var isToday = index < todayNotifications.length;
        var notification = isToday
            ? todayNotifications[index]
            : previousNotifications[index - todayNotifications.length];
        var notificationTime = DateTime.parse(notification['timestamp']).toLocal();
        var formattedTime = DateFormat('hh:mm a').format(notificationTime);
        var formattedDate = DateFormat('MMM dd').format(notificationTime);

        return Dismissible(
          key: UniqueKey(),
          onDismissed: (direction) {
            setState(() {
              notifications.remove(notification);
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
          child: buildNotificationList(
            context,
            notification['message'],
            isToday ? formattedTime : formattedDate,
            isToday,
          ),
        );
      },
    );
  }

  Widget buildNotificationList(
    BuildContext context,
    String message,
    String time,
    bool isToday,
  ) {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                isToday ? "Today" : "Earlier",
                style: const TextStyle(
                  color: Colors.white24,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                time,
                style: const TextStyle(
                  color: Colors.grey,
                ),
              )
            ],
          ),
          const SizedBox(height: 10),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              message,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 17,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

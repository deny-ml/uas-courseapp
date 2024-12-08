import 'package:flutter/material.dart';

class NotificationsPage extends StatelessWidget {
  final List<String> notifications = [
    'Your course "Flutter Basics" is now live!',
    'Get 30% off on all Python courses!',
    'New course "React Native Advanced" is added to the catalog.',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        backgroundColor: Color.fromARGB(255, 112, 50, 163),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.builder(
          itemCount: notifications.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                leading: Icon(Icons.notifications, color: Colors.deepPurple),
                title: Text(notifications[index]),
                trailing: Icon(Icons.chevron_right),
                onTap: () {
                  // TODO: Handle notification tap
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

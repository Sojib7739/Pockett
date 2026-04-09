import 'package:flutter/material.dart';
import 'package:splash_screen2/constants.dart';
import 'package:splash_screen2/reminder2.dart';

class NotificationScreen extends StatelessWidget {
  final List<ReminderModel> notifications;

  const NotificationScreen({super.key, required this.notifications});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: klinearGradientStart,
        title: const Text('Notifications'),
      ),
      body: notifications.isEmpty
          ? const Center(
        child: Text('No notifications yet'),
      )
          : ListView.builder(
        itemCount: notifications.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Text(
                'Due: ${notifications[index].paymentName}',
                style: kBlackBold,
              ),
            ),
          );
        },
      ),
    );
  }
}
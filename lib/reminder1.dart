import 'dart:async';
import 'package:flutter/material.dart';
import 'package:splash_screen2/constants.dart';
import 'package:splash_screen2/reminder2.dart';

class Reminder1 extends StatefulWidget {
  final List<ReminderModel> reminders;
  final List<ReminderModel> notifications;
  final Function(ReminderModel) onAddReminder;
  final Function(ReminderModel) onAddNotification;

  const Reminder1({
    super.key,
    required this.reminders,
    required this.notifications,
    required this.onAddReminder,
    required this.onAddNotification,
  });

  @override
  State<Reminder1> createState() => _Reminder1State();
}

class _Reminder1State extends State<Reminder1> {

  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(const Duration(minutes: 1), (timer) {
      _checkReminders();
    });
  }

  void _checkReminders() {
    final now = DateTime.now();
    for (var reminder in widget.reminders) {
      final due = reminder.scheduledDate;
      if (due.year == now.year &&
          due.month == now.month &&
          due.day == now.day &&
          due.hour == now.hour &&
          due.minute == now.minute) {

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Payment due: ${reminder.paymentName} — ${reminder.amount}'),
            duration: const Duration(seconds: 5),
            backgroundColor: klinearGradientStart,
          ),
        );

        widget.onAddNotification(reminder);
      }
    }
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: klinearGradientStart,
        title: const Text('Reminders'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () async {
              final result = await Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Reminder2()),
              );
              if (result != null) {
                widget.onAddReminder(result);
              }
            },
          ),
        ],
      ),
      body: widget.reminders.isEmpty
          ? const Center(
        child: Text('No reminders yet. Tap + to add one.'),
      )
          : ListView.builder(
        itemCount: widget.reminders.length,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(widget.reminders[index].paymentName, style: kBlackBold),
                  Text('Amount: ${widget.reminders[index].amount}'),
                  Text('Date: ${widget.reminders[index].date}'),
                  Text('Merchant: ${widget.reminders[index].merchant}'),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
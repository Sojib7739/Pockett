import 'package:flutter/material.dart';
import 'package:splash_screen2/constants.dart';

class ReminderModel {
  String paymentName;
  String amount;
  String date;
  String merchant;
  DateTime scheduledDate;

  ReminderModel({
    required this.paymentName,
    required this.amount,
    required this.date,
    required this.merchant,
    required this.scheduledDate,
  });
}

class Reminder2 extends StatefulWidget {
  const Reminder2({super.key});

  @override
  State<Reminder2> createState() => _Reminder2State();
}

class _Reminder2State extends State<Reminder2> {

  final TextEditingController nameController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  final TextEditingController merchantController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: appBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Text('Payment Name', style: TextStyle(fontSize: 16)),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Text("Amount", style: TextStyle(fontSize: 16)),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Text("Date & Time", style: TextStyle(fontSize: 16)),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: dateController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  hintText: '14.00 02/06/2026',
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 20, top: 20),
            child: Text("Merchant", style: TextStyle(fontSize: 16)),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(8),
              ),
              child: TextField(
                controller: merchantController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                ),
              ),
            ),
          ),
          const SizedBox(height: 30),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 100),
              child: GestureDetector(
                onTap: () {
                  try {
                    final parts = dateController.text.trim().split(' ');
                    final timeParts = parts[0].split('.');
                    final dateParts = parts[1].split('/');

                    final int hour = int.parse(timeParts[0]);
                    final int minute = int.parse(timeParts[1]);
                    final int day = int.parse(dateParts[0]);
                    final int month = int.parse(dateParts[1]);
                    final int year = int.parse(dateParts[2]);

                    final enteredDate = DateTime(year, month, day, hour, minute);

                    final scheduled = DateTime(
                      enteredDate.year,
                      enteredDate.month + 1,
                      enteredDate.day,
                      enteredDate.hour,
                      enteredDate.minute,
                    );

                    ReminderModel reminder = ReminderModel(
                      paymentName: nameController.text,
                      amount: amountController.text,
                      date: dateController.text,
                      merchant: merchantController.text,
                      scheduledDate: scheduled,
                    );
                    Navigator.pop(context, reminder);

                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Invalid format. Use: 14.00 02/06/2026'),
                        backgroundColor: Colors.red,
                      ),
                    );
                  }
                },
                child: Container(
                  width: 200,
                  height: 50,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: klinearGradientStart,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    "Save",
                    style: kWhiteBold.copyWith(fontSize: 24),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      backgroundColor: klinearGradientStart,
      title: const Text('Add Reminder'),
    );
  }

  @override
  void dispose() {
    nameController.dispose();
    amountController.dispose();
    dateController.dispose();
    merchantController.dispose();
    super.dispose();
  }
}
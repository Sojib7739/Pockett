import 'package:flutter/material.dart';
import 'constants.dart';
import 'edit_account.dart';
import 'globals.dart' as globals;

class AccountSettings extends StatefulWidget {
  const AccountSettings({super.key});

  @override
  State<AccountSettings> createState() => _AccountSettingsState();
}

class _AccountSettingsState extends State<AccountSettings> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: klinearGradientStart,
        title: const Text("Account Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _infoCard("Name", globals.userName, Icons.person),
            const SizedBox(height: 16),
            _infoCard("Number", globals.userNumber, Icons.phone),
            const SizedBox(height: 16),
            _infoCard("Email", globals.userEmail, Icons.email),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const EditAccount()),
                ).then((_) {
                  setState(() {});
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: klinearGradientStart,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 50),
              ),
              child: Text("Update", style: kWhiteBold.copyWith(fontSize: 18)),
            ),
          ],
        ),
      ),
    );
  }

  Widget _infoCard(String label, String value, IconData icon) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
      decoration: BoxDecoration(
        color: klinearGradientStart,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.white),
          const SizedBox(width: 16),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: kWhiteBold.copyWith(fontSize: 14, color: Colors.white70)),
              const SizedBox(height: 4),
              Text(value, style: kWhiteBold.copyWith(fontSize: 18)),
            ],
          ),
        ],
      ),
    );
  }
}
import 'package:flutter/material.dart';
import 'constants.dart';
import 'globals.dart' as globals;

class EditAccount extends StatefulWidget {
  const EditAccount({super.key});

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  String _name = globals.userName;
  String _pin = globals.userPin;
  String _email = globals.userEmail;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: klinearGradientStart,
        title: Text("Edit Account", style: kWhiteBold),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _inputField("Name", _name, (value) => _name = value, Icons.person),
            const SizedBox(height: 16),
            _inputField("PIN Code", _pin, (value) => _pin = value, Icons.lock),
            const SizedBox(height: 16),
            _inputField("Email", _email, (value) => _email = value, Icons.email),
            const SizedBox(height: 30),
            Text(
              "Please note: Changes may require restarting the app to fully take effect.",
              style: TextStyle(
                color: Colors.red,
                fontSize: 10,
                fontFamily: 'Poppins',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                globals.userName = _name;
                globals.userPin = _pin;
                globals.userEmail = _email;
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Account updated successfully")),
                );
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: klinearGradientStart,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text("CONFIRM", style: kWhiteBold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputField(String label, String initialValue, Function(String) onChanged, IconData icon, {bool obscure = false}) {
    return TextField(
      decoration: InputDecoration(
        hintText: label,
        hintStyle: kWhiteBold,
        prefixIcon: Icon(icon, color: Colors.white),
        fillColor: klinearGradientStart,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        ),
      ),
      style: kWhiteBold,
      obscureText: obscure,
      onChanged: onChanged,
      controller: TextEditingController()..text = initialValue,
    );
  }
}
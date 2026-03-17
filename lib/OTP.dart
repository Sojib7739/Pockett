import 'package:flutter/material.dart';
import 'globals.dart' as globals;
import 'constants.dart';
import 'home_page.dart';

class OTP extends StatefulWidget {
  const OTP({super.key});

  @override
  State<OTP> createState() => _OTPState();
}

class _OTPState extends State<OTP> {
  String _otp = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _header(),
            const SizedBox(height: 30),
            _inputField(context),
          ],
        ),
      ),
    );
  }

  // 🔹 Header
  Widget _header() {
    return Center(
      child: Text(
        "ENTER OTP",
        textAlign: TextAlign.center,
        style: kWhiteBold.copyWith(fontSize: 28),
      ),
    );
  }

  // 🔹 Input + Button
  Widget _inputField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          keyboardType: TextInputType.number,
          maxLength: 4,
          decoration: InputDecoration(
            hintText: "Enter OTP",
            hintStyle: kWhiteBold,
            counterText: "",
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.lock),
          ),
          onChanged: (value) {
            _otp = value;
          },
        ),

        const SizedBox(height: 15),

        ElevatedButton(
          onPressed: () {
            if (_otp == "1234") {
              globals.balance += 500;
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const HomePage()),
              );

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Transaction Complete")),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Incorrect OTP")),
              );
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: klinearGradientStart,
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: Text(
            "CONFIRM",
            style: kWhiteBold,
          ),
        ),
      ],
    );
  }
}
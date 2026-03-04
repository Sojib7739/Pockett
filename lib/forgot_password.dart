import 'package:flutter/material.dart';

import 'constants.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String _registeredPhoneNumber= "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Container(
        margin: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _header(context),
            const SizedBox(height: 40),
            _inputField(context),
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            "Welcome Back",
            style: kWhiteBold.copyWith(fontSize: 40)
        ),
        const SizedBox(height: 8),
        Text(
            "Enter your credentials to login",
            style: kWhiteBold.copyWith(fontSize: 20)
        ),
      ],
    );
  }
  Widget _inputField(BuildContext context){

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: "Enter Registered Phone Number",
            hintStyle: kWhiteBold,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.phone),
          ),
          keyboardType: TextInputType.phone,
          onChanged: (value) {
            _registeredPhoneNumber = value;

          },
        ),
        SizedBox(height: 10),

        ElevatedButton(
          onPressed: () {
            if (_registeredPhoneNumber == "01912345678" || _registeredPhoneNumber == "01712345678"){
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("New password sent to your registered phone number")),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Please enter a valid phone number")),
              );
            }
          },
          child: Text(
            "LOGIN",
            style: kWhiteBold,
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: klinearGradientStart,
            shape: StadiumBorder(),
            padding: EdgeInsets.symmetric(vertical: 16),
          ),
        ),
      ],
    );
  }
}

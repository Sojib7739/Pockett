import 'package:flutter/material.dart';
import 'package:splash_screen2/login_screen.dart';

import 'constants.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _phoneNumber = "";
  String _password = "";
  String _pin = "";
  String _name="";
  String _email="";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _header(context),
              const SizedBox(height: 30),
              _inputField(context),
            ],
          ),
        )
    );
  }
  Widget _header(BuildContext context){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            "Sign Up",
          style: kWhiteBold.copyWith(fontSize: 40)
        ),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _inputField(BuildContext context){
    return Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          TextField(
            decoration: InputDecoration(
              hintText: "Enter Your Name",
              hintStyle: kWhiteBold,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
              prefixIcon: const Icon(Icons.face),
            ),
            keyboardType: TextInputType.text,
            onChanged: (value) {
                _name = value;
            },
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              hintText: "Enter Your Phone Number",
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
                _phoneNumber = value;
            },
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              hintText: "Enter Your Email Address",
              hintStyle: kWhiteBold,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
              prefixIcon: const Icon(Icons.email_sharp),
            ),
            keyboardType: TextInputType.emailAddress,
            onChanged: (value) {
                _email = value;
            },
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              hintText: "Password",
              hintStyle: kWhiteBold,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
              prefixIcon: const Icon(Icons.lock),
            ),
            obscureText: true,
            keyboardType: TextInputType.text,
            onChanged: (value) {
                _password = value;
            },
          ),
          SizedBox(height: 10),
          TextField(
            decoration: InputDecoration(
              hintText: "PIN",
              hintStyle: kWhiteBold,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none,
              ),
              fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
              filled: true,
              prefixIcon: const Icon(Icons.lock),
            ),
            obscureText: true,
            keyboardType: TextInputType.number,
            onChanged: (value) {
                _pin = value;
            },
          ),
          SizedBox(height: 10),

          ElevatedButton(
            onPressed: () {
              if(_phoneNumber == "01712345678" &&
                  _password == "12345" &&
                  _pin == "1234" &&
                  _name == "Example" &&
                  _email == "example@gmail.com"){
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) => LoginScreen()),
                );
              } else {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Invalid Information or Unfilled Box")),
                );
              }
            },
            child: Text(
              "Sign Up",
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
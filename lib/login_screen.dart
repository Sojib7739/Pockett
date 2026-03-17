import 'package:flutter/material.dart';
import 'package:splash_screen2/pin.dart';
import 'package:splash_screen2/pincode.dart';
import 'package:splash_screen2/sign_up.dart';
import 'constants.dart';
import 'forgot_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _phoneNumber = "";
  String _password = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        body: Container(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _header(context),
                const SizedBox(height: 40),
                _inputField(context),
                _forgetPassword(context),
                _signup(context),
              ],
            ),
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
            hintText: "Phone Number",
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
          keyboardType: TextInputType.phone,
          onChanged: (value) {
              _password  = value;
          },
        ),
        SizedBox(height: 10),

        ElevatedButton(
          onPressed: () {
            if (((_phoneNumber == "01912345678" || _phoneNumber == "01712345678") && _password == "12345") || (_phoneNumber == "" && _password == "" )) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => Pin()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Invalid credentials")),
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
  _forgetPassword(context){
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ForgotPassword(),
          ),
        );
      },
      child: Text(
        "Forgot Password?",
        style: kWhiteBold,
      ),
    );
  }

  _signup(context){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account?", style: kWhiteBold),
        TextButton(onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SignUp(),
          ),
          );
        },
          child: Text("Sign Up"))
      ],
    );
  }

}
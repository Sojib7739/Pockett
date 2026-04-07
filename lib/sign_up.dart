import 'package:flutter/material.dart';
import 'package:splash_screen2/auth_service.dart';
import 'package:splash_screen2/login_screen.dart';
import 'constants.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  String _name = "";
  String _phoneNumber = "";
  String _email = "";
  String _password = "";
  String _pin = "";
  bool _isLoading = false;

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
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Sign Up", style: kWhiteBold.copyWith(fontSize: 40)),
        const SizedBox(height: 40),
      ],
    );
  }

  Widget _inputField(BuildContext context) {
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
          onChanged: (value) => _name = value,
        ),
        const SizedBox(height: 10),
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
          onChanged: (value) => _phoneNumber = value,
        ),
        const SizedBox(height: 10),
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
          onChanged: (value) => _email = value,
        ),
        const SizedBox(height: 10),
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
          onChanged: (value) => _password = value,
        ),
        const SizedBox(height: 10),
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
          onChanged: (value) => _pin = value,
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: _isLoading
              ? null
              : () async {
            if (_name.isEmpty ||
                _email.isEmpty ||
                _password.isEmpty ||
                _phoneNumber.isEmpty ||
                _pin.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text("Please fill in all fields")),
              );
              return;
            }
            setState(() => _isLoading = true);
            try {
              await authService.value.createAccount(
                email: _email,
                password: _password,
              );
              await authService.value.updateUsername(username: _name);
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => LoginScreen()),
              );
            } catch (e) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text(e.toString())),
              );
            } finally {
              setState(() => _isLoading = false);
            }
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: klinearGradientStart,
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
          ),
          child: _isLoading
              ? const CircularProgressIndicator(color: Colors.white)
              : Text("Sign Up", style: kWhiteBold),
        ),
      ],
    );
  }
}
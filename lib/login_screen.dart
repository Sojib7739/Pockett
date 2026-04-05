import 'package:flutter/material.dart';
import 'package:splash_screen2/auth_service.dart';
import 'package:splash_screen2/pin.dart';
import 'package:splash_screen2/sign_up.dart';
import 'constants.dart';
import 'forgot_password.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String _email = "";
  String _password = "";
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            _header(context),
            const SizedBox(height: 40),
            _inputField(context),
            _forgetPassword(context),
            _signup(context),
          ],
        ),
      ),
    );
  }

  Widget _header(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Welcome Back", style: kWhiteBold.copyWith(fontSize: 40)),
        const SizedBox(height: 8),
        Text("Enter your credentials to login",
            style: kWhiteBold.copyWith(fontSize: 20)),
      ],
    );
  }

  Widget _inputField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: "Email",
            hintStyle: kWhiteBold,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none,
            ),
            fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
            filled: true,
            prefixIcon: const Icon(Icons.email),
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
        ElevatedButton(
          onPressed: _isLoading
              ? null
              : () async {
            setState(() => _isLoading = true);
            try {
              await authService.value.singIn(
                email: _email,
                password: _password,
              );
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => Pin()),
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
              : Text("LOGIN", style: kWhiteBold),
        ),
      ],
    );
  }

  Widget _forgetPassword(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ForgotPassword()),
        );
      },
      child: Text("Forgot Password?", style: kWhiteBold),
    );
  }

  Widget _signup(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Don't have an account?", style: kWhiteBold),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => SignUp()),
            );
          },
          child: const Text("Sign Up"),
        ),
      ],
    );
  }
}
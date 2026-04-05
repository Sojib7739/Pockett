import 'package:flutter/material.dart';
import 'package:splash_screen2/auth_service.dart';
import 'constants.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  String _email = "";
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
        Text("Forgot Password?", style: kWhiteBold.copyWith(fontSize: 40)),
      ],
    );
  }

  Widget _inputField(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: "Enter Registered Email",
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
        ElevatedButton(
          onPressed: _isLoading
              ? null
              : () async {
            if (_email.isEmpty) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text("Please enter your email")),
              );
              return;
            }
            setState(() => _isLoading = true);
            try {
              await authService.value.resetPassword(email: _email);
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                    content: Text("Password reset email sent")),
              );
              Navigator.pop(context);
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
              : Text("SEND RESET EMAIL", style: kWhiteBold),
        ),
      ],
    );
  }
}
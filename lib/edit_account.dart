import 'package:flutter/material.dart';
import 'package:splash_screen2/auth_service.dart';
import 'constants.dart';

class EditAccount extends StatefulWidget {
  const EditAccount({super.key});

  @override
  State<EditAccount> createState() => _EditAccountState();
}

class _EditAccountState extends State<EditAccount> {
  late String _name;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    // Pre-fill with current Firebase display name
    _name = authService.value.currentUser?.displayName ?? "";
  }

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
            _inputField(
              "Name",
              _name,
                  (value) => _name = value,
              Icons.person,
            ),
            const SizedBox(height: 30),
            Text(
              "Please note: Only your display name can be updated here.",
              style: TextStyle(
                color: Colors.red,
                fontSize: 10,
                fontFamily: 'Poppins',
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _isLoading
                  ? null
                  : () async {
                setState(() => _isLoading = true);
                try {
                  await authService.value.updateUsername(
                    username: _name,
                  );
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content:
                        Text("Account updated successfully")),
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
                  : Text("CONFIRM", style: kWhiteBold),
            ),
          ],
        ),
      ),
    );
  }

  Widget _inputField(
      String label,
      String initialValue,
      Function(String) onChanged,
      IconData icon, {
        bool obscure = false,
      }) {
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
import 'package:flutter/material.dart';
import 'constants.dart';
import 'home_page.dart';

class Pin extends StatefulWidget {
  const Pin({super.key});

  @override
  State<Pin> createState() => _PinState();
}

class _PinState extends State<Pin> {
  String _pinNumber = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,

      body: Container(
        child: Padding(
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
      ),
    );
  }
  Widget _header(BuildContext context){
    return Center(
      child: Text(
        "ENTER PIN NUMBER",
        textAlign: TextAlign.center,
        style: kWhiteBold.copyWith(fontSize: 28),
      ),
    );
  }
  Widget _inputField(BuildContext context){

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          decoration: InputDecoration(
            hintText: "Enter Your Pin Number",
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
            _pinNumber = value;

          },
        ),
        SizedBox(height: 10),

        ElevatedButton(
          onPressed: () {
            if (_pinNumber == "12345" || _pinNumber == "11111"){
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text("Wrong Pin Number")),
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


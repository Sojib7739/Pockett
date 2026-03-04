import 'package:flutter/material.dart';
import 'constants.dart';
import 'home_page.dart';

class Pincode extends StatefulWidget {
  const Pincode({super.key});

  @override
  State<Pincode> createState() => _PincodeState();
}

class _PincodeState extends State<Pincode> {
  String enteredPin = '';
  bool isPinVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: klinearGradientStart,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Text(
            'Enter Your Pin',
            style: kBlackBold.copyWith(fontSize: 24, color: Colors.white),
          ),

          SizedBox(height: 20),

          // Pin boxes
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              pinBox(0),
              pinBox(1),
              pinBox(2),
              pinBox(3),
            ],
          ),

          // Visibility button
          IconButton(
            onPressed: () {
              setState(() {
                isPinVisible = !isPinVisible;
              });
            },
            icon: Icon(
              isPinVisible ? Icons.visibility_off : Icons.visibility,
              color: Colors.white,
            ),
          ),

          SizedBox(height: 20),

          // Row 1
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              numButton('1'),
              numButton('2'),
              numButton('3'),
            ],
          ),

          // Row 2
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              numButton('4'),
              numButton('5'),
              numButton('6'),
            ],
          ),

          // Row 3
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              numButton('7'),
              numButton('8'),
              numButton('9'),
            ],
          ),

          // Row 4
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              // Check button
              SizedBox(
                width: 80,
                height: 80,
                child: IconButton(
                  onPressed: () {
                    if (enteredPin == '1234') {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    }
                  },
                  icon: Icon(Icons.check_circle_sharp, color: Colors.white, size: 28),
                ),
              ),

              numButton('0'),

              // Backspace button
              SizedBox(
                width: 80,
                height: 80,
                child: IconButton(
                  onPressed: () {
                    setState(() {
                      if (enteredPin.isNotEmpty) {
                        enteredPin = enteredPin.substring(0, enteredPin.length - 1);
                      }
                    });
                  },
                  icon: Icon(Icons.backspace_sharp, color: Colors.white),
                ),
              ),

            ],
          ),

        ],
      ),
    );
  }

  Widget pinBox(int index) {
    return Container(
      margin: EdgeInsets.all(20),
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: index < enteredPin.length ? kBackgroundColor : kBackgroundColor.withValues(alpha: 0.3),
      ),
      child: index < enteredPin.length
          ? Center(
        child: isPinVisible
            ? Text(enteredPin[index], style: kBlackBold.copyWith(fontSize: 17, color: Colors.black))
            : Container(
          width: 12,
          height: 12,
          decoration: BoxDecoration(color: Colors.black, shape: BoxShape.circle),
        ),
      )
          : null,
    );
  }

  Widget numButton(String number) {
    return SizedBox(
      width: 80,
      height: 80,
      child: TextButton(
        onPressed: () {
          if (enteredPin.length < 4) {
            setState(() {
              enteredPin += number;
            });
          }
        },
        child: Text(
          number,
          style: kBlackNormal.copyWith(fontSize: 24, color: Colors.white),
        ),
      ),
    );
  }
}
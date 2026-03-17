import 'package:flutter/material.dart';
import 'OTP.dart';
import 'constants.dart';
import 'globals.dart' as globals;


class AddMoneyCard extends StatefulWidget {
  const AddMoneyCard({super.key});

  @override
  State<AddMoneyCard> createState() => _AddMoneyCardState();
}

class _AddMoneyCardState extends State<AddMoneyCard> {
  String _cardNum = "";
  //String _validity = "";
  String _cvv = "";
  String _amount = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: klinearGradientStart,
        title: const Text("Add Money From Card"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Card to Pocket",
              style: kWhiteBold.copyWith(fontSize: 28),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Card Number',
                hintStyle: kWhiteBold,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
                fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
                filled: true,
                prefixIcon: const Icon(Icons.credit_card),
              ),
              onChanged: (value) {
                _cardNum = value;
              },
            ),

            const SizedBox(height: 15),
            /*
            TextField(
              keyboardType: TextInputType.datetime,
              decoration: InputDecoration(
                hintText: 'MM/YY',
                hintStyle: kWhiteBold,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
                fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
                filled: true,
                prefixIcon: const Icon(Icons.date_range),
              ),
              onChanged: (value) {
                _validity = value;
              },
            ),

            const SizedBox(height: 15),
            */
            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'CVV',
                hintStyle: kWhiteBold,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
                fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
                filled: true,
                prefixIcon: const Icon(Icons.lock),
              ),
              onChanged: (value) {
                _cvv = value;
              },
            ),

            const SizedBox(height: 15),

            TextField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Enter Amount',
                hintStyle: kWhiteBold,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
                fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
                filled: true,
                prefixIcon: const Icon(Icons.money),
              ),
              onChanged: (value) {
                _amount = value;
              },
            ),

            const SizedBox(height: 25),

            ElevatedButton(
              onPressed: () {
                if (_cardNum == "1234567890123456" || _cardNum == "1111222233334444") {
                  if (_cvv == "123" || _cvv == "111") {
                    if (_amount.isNotEmpty && int.tryParse(_amount) != null && int.parse(_amount) > 0) {
                      globals.balance += double.parse(_amount);

                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("OTP sent successfully")),
                      );

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const OTP()),
                      );

                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text("Enter valid amount")),
                      );
                    }
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text("Invalid CVV")),
                    );
                  }
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Invalid Card Number")),
                  );
                }
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: klinearGradientStart,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text("Send OTP", style: kWhiteBold),
            ),
          ],
        ),
      ),
    );
  }
}
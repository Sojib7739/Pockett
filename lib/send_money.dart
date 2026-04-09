import 'package:flutter/material.dart';
import 'constants.dart';
import 'home_page.dart';
import 'globals.dart' as globals;

class SendMoney extends StatefulWidget {
  const SendMoney({super.key});

  @override
  State<SendMoney> createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
  TextEditingController amount = TextEditingController();
  TextEditingController pin = TextEditingController();
  TextEditingController num = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: klinearGradientStart,
        title: const Text("Send Money"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Send Money",
              style: kWhiteBold.copyWith(fontSize: 28),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            TextField(
              controller: num,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Account Number',
                hintStyle: kWhiteBold,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
                fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
                filled: true,
                prefixIcon: const Icon(Icons.person),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: amount,
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
            ),

            const SizedBox(height: 15),

            TextField(
              controller: pin,
              keyboardType: TextInputType.number,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Enter pin',
                hintStyle: kWhiteBold,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
                fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
                filled: true,
                prefixIcon: const Icon(Icons.lock),
              ),
            ),

            const SizedBox(height: 25),

            ElevatedButton(
              onPressed: () {
                String accountNumber = num.text;
                String enteredPin = pin.text;
                String enteredAmount = amount.text;

                if (accountNumber.isEmpty || enteredAmount.isEmpty || enteredPin.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please fill all fields")),
                  );
                  return;
                }

                if (enteredPin != "1234" && enteredPin != "1111") {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Invalid PIN")),
                  );
                  return;
                }
                double? sendAmount = double.tryParse(enteredAmount);
                if (sendAmount == null || sendAmount <= 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Enter valid amount")),
                  );
                  return;
                }
                if (sendAmount > globals.balance) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Insufficient balance")),
                  );
                  return;
                }

                globals.balance -= sendAmount;

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Send Money Successful")),
                );

                amount.clear();
                pin.clear();
                num.clear();

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage())
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: klinearGradientStart,
                shape: const StadiumBorder(),
                padding: const EdgeInsets.symmetric(vertical: 16),
              ),
              child: Text("Submit", style: kWhiteBold),
            ),
          ],
        ),
      ),
    );
  }
}
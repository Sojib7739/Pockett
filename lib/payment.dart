import 'package:flutter/material.dart';
import 'constants.dart';
import 'home_page.dart';
import 'globals.dart' as globals;

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  TextEditingController amount = TextEditingController();
  TextEditingController pin = TextEditingController();
  TextEditingController num = TextEditingController();
  TextEditingController reference = TextEditingController();

  @override
  void dispose() {
    amount.dispose();
    pin.dispose();
    num.dispose();
    reference.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: klinearGradientStart,
        title: const Text("Payment"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Payment",
              style: kWhiteBold.copyWith(fontSize: 28),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            TextField(
              controller: num,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Merchant Account Number',
                hintStyle: kWhiteBold,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
                fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
                filled: true,
                prefixIcon: const Icon(Icons.store),
              ),
            ),

            const SizedBox(height: 15),

            TextField(
              controller: reference,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                hintText: 'Reference',
                hintStyle: kWhiteBold,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
                fillColor: Theme.of(context).primaryColor.withOpacity(0.1),
                filled: true,
                prefixIcon: const Icon(Icons.note),
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
                String merchantAccount = num.text;
                String enteredReference = reference.text;
                String enteredAmount = amount.text;
                String enteredPin = pin.text;

                if (merchantAccount.isEmpty || enteredAmount.isEmpty || enteredPin.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Please fill all required fields")),
                  );
                  return;
                }

                if (enteredPin != "1234" && enteredPin != "1111") {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Invalid PIN")),
                  );
                  return;
                }

                double? paymentAmount = double.tryParse(enteredAmount);
                if (paymentAmount == null || paymentAmount <= 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Enter valid amount")),
                  );
                  return;
                }

                if (paymentAmount > globals.balance) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Insufficient balance")),
                  );
                  return;
                }

                globals.balance -= paymentAmount;

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Payment successful")),
                );

                amount.clear();
                pin.clear();
                num.clear();
                reference.clear();

                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                      (route) => false,
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
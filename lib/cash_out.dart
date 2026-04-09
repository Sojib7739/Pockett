import 'package:flutter/material.dart';
import 'constants.dart';
import 'home_page.dart';
import 'globals.dart' as globals;

class CashOut extends StatefulWidget {
  const CashOut({super.key});

  @override
  State<CashOut> createState() => _CashOutState();
}

class _CashOutState extends State<CashOut> {
  TextEditingController amount = TextEditingController();
  TextEditingController pin = TextEditingController();
  TextEditingController num = TextEditingController();

  double _charge = 0.0;

  void _calculateCharge(String value) {
    double? enteredAmount = double.tryParse(value);
    if (enteredAmount != null && enteredAmount > 0) {
      setState(() {
        _charge = enteredAmount * 0.01;
      });
    } else {
      setState(() {
        _charge = 0.0;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    amount.addListener(() {
      _calculateCharge(amount.text);
    });
  }

  @override
  void dispose() {
    amount.dispose();
    pin.dispose();
    num.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: klinearGradientStart,
        title: const Text("Cash Out"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Cash Out",
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

            const SizedBox(height: 15),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Theme.of(context).primaryColor.withOpacity(0.1),
              ),
              child: Row(
                children: [
                  const Icon(Icons.attach_money),
                  const SizedBox(width: 12),
                  Text(
                    "Charge: ${_charge.toStringAsFixed(2)} BDT",
                    style: kWhiteBold.copyWith(fontSize: 16),
                  ),
                ],
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

                double? cashoutAmount = double.tryParse(enteredAmount);
                if (cashoutAmount == null || cashoutAmount <= 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Enter valid amount")),
                  );
                  return;
                }

                double totalDeduction = cashoutAmount + _charge;
                if (totalDeduction > globals.balance) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Insufficient balance")),
                  );
                  return;
                }

                globals.balance -= totalDeduction;

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Cash Out successful")),
                );

                amount.clear();
                pin.clear();
                num.clear();
                setState(() {
                  _charge = 0.0;
                });

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
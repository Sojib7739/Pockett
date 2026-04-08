import 'package:flutter/material.dart';
import 'constants.dart';
import 'home_page.dart';
import 'globals.dart' as globals;

class MobileRecharge extends StatefulWidget {
  const MobileRecharge({super.key});

  @override
  State<MobileRecharge> createState() => _MobileRechargeState();
}

class _MobileRechargeState extends State<MobileRecharge> {
  TextEditingController amount = TextEditingController();
  TextEditingController pin = TextEditingController();
  TextEditingController num = TextEditingController();

  String _selectedOperator = 'Robi';
  final List<String> _operators = ['Robi', 'Grameen Phone', 'Banglalink', 'Teletalk'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: klinearGradientStart,
        title: const Text("Mobile Recharge"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Mobile Recharge",
              style: kWhiteBold.copyWith(fontSize: 28),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 30),

            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Theme.of(context).primaryColor.withOpacity(0.1),
              ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  value: _selectedOperator,
                  isExpanded: true,
                  dropdownColor: klinearGradientStart,
                  borderRadius: BorderRadius.circular(18),
                  //borderSide: BorderSide.none,

                  style: kWhiteBold,
                  items: _operators.map((String operator) {
                    return DropdownMenuItem<String>(
                      value: operator,
                      child: Text(operator, style: kWhiteBold),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _selectedOperator = newValue!;
                    });
                  },
                ),
              ),
            ),

            const SizedBox(height: 15),

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
                prefixIcon: const Icon(Icons.phone_android),
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
                String phoneNumber = num.text;
                String enteredPin = pin.text;
                String enteredAmount = amount.text;

                if (phoneNumber.isEmpty || enteredAmount.isEmpty || enteredPin.isEmpty) {
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

                double? rechargeAmount = double.tryParse(enteredAmount);
                if (rechargeAmount == null || rechargeAmount <= 0) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Enter valid amount")),
                  );
                  return;
                }

                if (rechargeAmount > globals.balance) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Insufficient balance")),
                  );
                  return;
                }
                globals.balance -= rechargeAmount;


                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Mobile Recharge to $_selectedOperator successful")),
                );

                amount.clear();
                pin.clear();
                num.clear();


                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
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
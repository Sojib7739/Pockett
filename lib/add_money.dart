import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:splash_screen2/add_money_card.dart';
import 'constants.dart';

class AddMoney extends StatefulWidget {
  const AddMoney({super.key});

  @override
  State<AddMoney> createState() => _AddMoneyState();
}

class _AddMoneyState extends State<AddMoney> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: klinearGradientStart,
        title: const Text("Add Money"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          // Using SizedBox for spacing instead of an empty Container
          const SizedBox(height: 100),

          // --- From Bank Account Button ---
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    //builder: (context) => const AddMoneyFormBank(),
                    builder: (context) => const AddMoney(),
                  ),
                );
              },
              child: Container(
                height: 70,
                width: MediaQuery.sizeOf(context).width - 60,
                alignment: Alignment.center, // Centers the text inside
                decoration: BoxDecoration(
                  color: klinearGradientStart,
                  borderRadius: BorderRadius.circular(8), // Adds a nice curve
                ),
                child: Text(
                  "From Bank Account",
                  style: kDarkPurpleBold.copyWith(fontSize: 24),
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          // --- From Card Button ---
          Center(
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    //builder: (context) => const AddMoneyCard(),
                    builder: (context) => const AddMoney(),
                  ),
                );
              },
              child: Container(
                height: 70,
                width: MediaQuery.sizeOf(context).width - 60,
                alignment: Alignment.center, // Centers the text inside
                decoration: BoxDecoration(
                  color: klinearGradientStart,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  "From Card",
                  style: kDarkPurpleBold.copyWith(fontSize: 24),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
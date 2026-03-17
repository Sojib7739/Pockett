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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const AddMoneyCard(),
                  ),
                );
              },
              child: Container(
                height: 70,
                width: MediaQuery.sizeOf(context).width - 60,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: klinearGradientStart,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  "Card to Pocket",
                  style: kDarkPurpleBold.copyWith(fontSize: 25),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
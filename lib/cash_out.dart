import 'package:flutter/material.dart';
import 'constants.dart';

class CashOut extends StatefulWidget {
  const CashOut({super.key});

  @override
  State<CashOut> createState() => _CashOutState();
}

class _CashOutState extends State<CashOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: klinearGradientStart,
        title: Text("Cash Out"),
      ),
      body: Center(
        child: Text("Cash Out Page"),
      ),
    );
  }
}

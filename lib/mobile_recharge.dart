import 'package:flutter/material.dart';
import 'constants.dart';

class MobileRecharge extends StatefulWidget {
  const MobileRecharge({super.key});

  @override
  State<MobileRecharge> createState() => _MobileRechargeState();
}

class _MobileRechargeState extends State<MobileRecharge> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: klinearGradientStart,
        title: Text("Mobile Recharge"),
      ),
      body: Center(
        child: Text("Mobile Recharge Page"),
      ),
    );
  }
}


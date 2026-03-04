import 'package:flutter/material.dart';
import 'constants.dart';

class SendMoney extends StatefulWidget {
  const SendMoney({super.key});

  @override
  State<SendMoney> createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
  @override
  Widget build(BuildContext context) {
     return Scaffold(
       backgroundColor: kBackgroundColor,
      appBar: AppBar(
        backgroundColor: klinearGradientStart,
        title: Text("Send Money"),
      ),
      body: Center(
        child: Text("Send Money Page"),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:splash_screen2/add_money_bank.dart';
import 'package:splash_screen2/add_money_card.dart';
import 'constants.dart';
import 'home_page.dart';

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
          title: Text(
              "Add Money"
          ),

        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 100,
              width: MediaQuery.sizeOf(context).width,
              color: kBackgroundColor,
            ),
            Container(
                height: 70,
                width:  MediaQuery.sizeOf(context).width-60,
                color: klinearGradientStart,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddMoneyFormBank(),
                      ),
                    );
                  },
                  child: Text(
                    "From Bank Account",
                    style: kDarkPurpleBold.copyWith(fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                )
            ),
            Container(
              height: 20,
              width: MediaQuery.sizeOf(context).width,
              color: kBackgroundColor,
            ),
            Container(
                height: 70,
                width:  MediaQuery.sizeOf(context).width-60,
                color: klinearGradientStart,
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const AddMoneyCard(),
                      ),
                    );
                  },
                  child: Text(
                    "From Card",
                    style: kDarkPurpleBold.copyWith(fontSize: 30),
                    textAlign: TextAlign.center,
                  ),
                )
            ),
          ],
        )
    );
  }
}

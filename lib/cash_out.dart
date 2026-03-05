import 'package:flutter/material.dart';
import 'constants.dart';

class CashOut extends StatefulWidget {
  const CashOut({super.key});

  @override
  State<CashOut> createState() => _CashOutState();
}

class _CashOutState extends State<CashOut> {
  @override
  TextEditingController  amount =  TextEditingController();
  TextEditingController  pin =  TextEditingController();
  TextEditingController num= TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          backgroundColor: klinearGradientStart,
          title: Text("Cash Out"),
        ),
        body: SingleChildScrollView(
            child: Column(
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                TextField(
                  controller: num,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Account Number',
                      labelStyle: kDarkPurpleBold
                  ),
                ),
                Container(
                  height: 25,
                  width: MediaQuery.sizeOf(context).width,
                ),
                TextField(
                  controller: amount,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Enter Amount',
                      labelStyle: kDarkPurpleBold
                  ),
                ),
                Container(
                  height: 25,
                ),
                TextField(
                  controller: pin,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Enter pin',
                      labelStyle: kDarkPurpleBold
                  ),
                ),
                Container(
                  height: 25,
                ),
                Container(
                  height: 30,
                  width: 200,
                  color: klinearGradientStart,
                  child: Text(
                    "Charge= 00",
                    style: kWhiteBold.copyWith(fontSize: 15),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  height: MediaQuery.sizeOf(context).height/2,
                ),
                Container(
                    height: 50,
                    width:  201,
                    color: klinearGradientStart,
                    child: GestureDetector(
                      onTap: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Cashout Done "))
                        );
                      },
                      child: Text(
                        "Submit",
                        style: kWhiteBold.copyWith(fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                    )
                ),
              ],
            )
        )
    );
  }
}





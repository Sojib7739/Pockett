import 'package:flutter/material.dart';
import 'constants.dart';

class SendMoney extends StatefulWidget {
  const SendMoney({super.key});

  @override
  State<SendMoney> createState() => _SendMoneyState();
}

class _SendMoneyState extends State<SendMoney> {
  TextEditingController  amount =  TextEditingController();
  TextEditingController  pin =  TextEditingController();
  TextEditingController num= TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          backgroundColor: klinearGradientStart,
          title: Text("Send Money"),
        ),
        body: SingleChildScrollView(
            child: Column(
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
                  height: MediaQuery.sizeOf(context).height/2,
                ),
                Container(
                    height: 50,
                    width:  MediaQuery.sizeOf(context).width-60,
                    color: klinearGradientEnd,
                    child: GestureDetector(
                      onTap: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Send Money Successfull "))
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


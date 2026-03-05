import 'package:flutter/material.dart';
import 'constants.dart';

class AddMoneyCard extends StatefulWidget {
  const AddMoneyCard({super.key});

  @override
  State<AddMoneyCard> createState() => _AddMoneyCardState();
}

class _AddMoneyCardState extends State<AddMoneyCard> {
  TextEditingController cardNum =  TextEditingController();
  TextEditingController validity=  TextEditingController();
  TextEditingController cardHolder =  TextEditingController();
  TextEditingController  cvv =  TextEditingController();
  TextEditingController  otp =  TextEditingController();
  TextEditingController  amount =  TextEditingController();
  TextEditingController  pin =  TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          backgroundColor: klinearGradientStart,
          title: Text("Add Money From Card"),
        ),
        body: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: cardNum,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Card Number',
                      labelStyle: kDarkPurpleBold
                  ),
                ),
                Container(
                  height: 25,
                ),
                TextField(
                  controller: validity,
                  keyboardType: TextInputType.datetime,
                  decoration: InputDecoration(
                      hintText: 'MMYY',
                      hintStyle: kDarkPurpleNormal,
                      labelText: 'Validity',
                      labelStyle: kDarkPurpleBold
                  ),
                ),
                Container(
                  height: 25,
                ),
                TextField(
                  controller: cardHolder,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      labelText: 'Card Owners Name',
                      labelStyle: kDarkPurpleBold
                  ),
                ),
                Container(
                  height: 25,
                ),
                TextField(
                  controller: cvv,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'CVV/CVC/CVN',
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
                  height: 25,
                ),
                Container(
                    height: 50,
                    width:  MediaQuery.sizeOf(context).width/4+50,
                    child: GestureDetector(
                      onTap: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text("OTP sent successfully "))
                        );
                      },
                      child: Text(
                        "Send OTP",
                        style: kDarkPurpleBold.copyWith(fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                    )
                ),
                Container(
                  height: 200,
                ),
                Container(
                    height: 50,
                    width:  200,
                    color: kBackgroundColor,
                    child: GestureDetector(
                      onTap: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Money added successfully "))
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


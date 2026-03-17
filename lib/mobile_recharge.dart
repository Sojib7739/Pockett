import 'dart:math';

import 'package:flutter/material.dart';
import 'constants.dart';

class MobileRecharge extends StatefulWidget {
  const MobileRecharge({super.key});

  @override
  State<MobileRecharge> createState() => _MobileRechargeState();
}

class _MobileRechargeState extends State<MobileRecharge> {
  TextEditingController  amount =  TextEditingController();
  TextEditingController  pin =  TextEditingController();
  TextEditingController num= TextEditingController();
  TextEditingController operator= TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          backgroundColor: klinearGradientStart,
          title: Text("Mobile Recharge"),
        ),
        body: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: operator,
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                      labelText: 'Sim Operator Name',
                      labelStyle: kDarkPurpleBold
                  ),
                ),
                Container(
                  height: 25,
                ),
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
                    color: klinearGradientStart,
                    child: GestureDetector(
                      onTap: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Mobile Recharge successfull "))
                        );
                      },
                      child: Text(
                        "Submit",
                        style: kWhiteBold.copyWith(fontSize: 28),
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


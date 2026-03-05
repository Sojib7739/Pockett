import 'package:flutter/material.dart';
import 'constants.dart';

class Payment extends StatefulWidget {
  const Payment({super.key});

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  @override
  TextEditingController  amount =  TextEditingController();
  TextEditingController  pin =  TextEditingController();
  TextEditingController num= TextEditingController();
  TextEditingController reference= TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          backgroundColor: klinearGradientStart,
          title: Text("Payment"),
        ),
        body: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  controller: num,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                      labelText: 'Merchant Account Number',
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
                    width:  200,
                    color: klinearGradientStart,
                    child: GestureDetector(
                      onTap: (){
                        ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Payment successfull "))
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


import 'package:flutter/material.dart';
import 'constants.dart';

class AddMoneyFormBank extends StatefulWidget {
  const AddMoneyFormBank({super.key});

  @override
  State<AddMoneyFormBank > createState() => _AddMoneyFormState();
}

class _AddMoneyFormState extends State<AddMoneyFormBank> {

  TextEditingController accountNum = TextEditingController();
  TextEditingController amountController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController pinController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kBackgroundColor,
        appBar: AppBar(
          backgroundColor: klinearGradientStart,
          title: const Text("From Bank Account"),
          centerTitle: true,
        ),
        body:SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: accountNum,
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
                controller: amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: 'Enter amount',
                    labelStyle: kDarkPurpleBold
                ),
              ),
              Container(
                height: 25,
              ),
              TextField(
                controller: pinController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText:'Enter pin',
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
          ),
        )
    );
  }
}
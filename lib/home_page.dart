import 'package:flutter/material.dart';
import 'package:splash_screen2/login_screen.dart';
import 'package:splash_screen2/payment.dart';
import 'package:splash_screen2/reminder.dart';
import 'package:splash_screen2/send_money.dart';
import 'package:splash_screen2/transaction_history.dart';
import 'account_settings.dart';
import 'add_money.dart';
import 'cash_out.dart';
import 'constants.dart';
import 'mobile_recharge.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.title = "Home"});
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  double balance = 12500.50;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      drawer: Drawer(
        backgroundColor: kBackgroundColor,
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: klinearGradientStart),
              margin: EdgeInsets.zero,
              padding: EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'পকেট Menu',
                  style: kWhiteNormal.copyWith(
                    color: Colors.white,
                    fontSize: 24,
                  ),
                ),
              ),
            ),
            ListTile(
              title: Text('Send Money', style: kDarkPurpleBold),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SendMoney(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Add Money', style: kDarkPurpleBold),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> AddMoney(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Mobile Recharge', style: kDarkPurpleBold),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> MobileRecharge(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Payment', style: kDarkPurpleBold),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> Payment(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Cashout', style: kDarkPurpleBold),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> CashOut(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Reminder', style: kDarkPurpleBold),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> Reminder(),
                  ),
                );
              },
            ),

            Spacer(),
            ListTile(
              title: Text('Logout', style: kDarkPurpleBold),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> LoginScreen(),
                  ),
                );
              },
            ),
            ListTile(
              title: Text('Account Settings', style: kDarkPurpleBold),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> AccountSettings(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(
        backgroundColor: klinearGradientStart,
        toolbarHeight: 150,
        automaticallyImplyLeading: false,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Builder(
                  builder: (context) => IconButton(
                    icon: const Icon(Icons.menu, size: 25, color: Colors.white),
                    onPressed: () {
                      Scaffold.of(context).openDrawer();
                    },
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.receipt_long, size: 25, color: Colors.white),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => TransactionHistory()),
                    );
                  },
                ),
              ],
            ),
            Text("User Name", style: kWhiteNormal.copyWith(color: Colors.white, fontSize: 32)),
            Text("Available Balance", style: kWhiteNormal.copyWith(color: Colors.white, fontSize: 14)),
            Text("৳ 12500.50", style: kWhiteBold.copyWith(color: Colors.white, fontSize: 18)),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => SendMoney(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: klinearGradientStart,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '৳',
                    style: kWhiteBold.copyWith(
                      color: Colors.white,
                      fontSize: 38,
                    ),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Send Money',
                    style: kWhiteBold.copyWith(color: Colors.white),
                  ),
                ],
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                    MaterialPageRoute(builder: (context)=> AddMoney(),
                    ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: klinearGradientStart,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              icon: const Icon(
                Icons.account_balance_wallet,
                size: 50,
                color: Colors.white,
              ),
              label: Text(
                'Add Money',
                style: kWhiteBold.copyWith(color: Colors.white),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> MobileRecharge(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: klinearGradientStart,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              icon: const Icon(
                Icons.phone_android_sharp ,
                size: 50,
                color: Colors.white,
              ),
              label: Text(
                'Mobile Recharge',
                style: kWhiteBold.copyWith(color: Colors.white),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> Payment(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: klinearGradientStart,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              icon: const Icon(
                Icons.shopify_sharp ,
                size: 50,
                color: Colors.white,
              ),
              label: Text(
                'Payment',
                style: kWhiteBold.copyWith(color: Colors.white),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> CashOut(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: klinearGradientStart,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              icon: const Icon(
                Icons.handshake_outlined ,
                size: 50,
                color: Colors.white,
              ),
              label: Text(
                'Cashout',
                style: kWhiteBold.copyWith(color: Colors.white),
              ),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> Reminder(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: klinearGradientStart,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              icon: const Icon(
                Icons.notification_add,
                size: 50,
                color: Colors.white,
              ),
              label: Text(
                'Reminder',
                style: kWhiteBold.copyWith(color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

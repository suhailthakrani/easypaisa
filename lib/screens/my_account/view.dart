import 'package:easypaisa/screens/my_account/components/account_tile.dart';
import 'package:flutter/material.dart';

class MyAccountScreen extends StatefulWidget {
  const MyAccountScreen({super.key});

  @override
  State<MyAccountScreen> createState() => _MyAccountScreenState();
}

class _MyAccountScreenState extends State<MyAccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                Icon(
                  Icons.arrow_back_ios_new,
                  size: 22,
                  color: Colors.black54,
                ),
              ],
            ),
            const SizedBox(height: 14),
            const Text(
              'Account Settings',
              style: TextStyle(
                // fontFamily: 'Proxima Nova',
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              ' Account Info, Settings & More',
              style: TextStyle(
                fontFamily: 'Proxima Nova',
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'ACCOUNT',
              style: TextStyle(
                  // fontFamily: 'Proxima Nova',
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54),
            ),
            const SizedBox(height: 16),
            const AccountInfoTile(
              title: 'Account Infromation',
              leadingIcon: Icon(
                Icons.person_outline,
                color: Colors.green,
              ),
              trailingIcon: Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.black54,
              ),
            ),
            AccountInfoTile(
              title: 'Order New Debt Card',
              leadingIcon: Image.asset(
                'assets/icons/CNIC.png',
                height: 30,
                width: 30,
              ),
              trailingIcon: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.black54,
              ),
            ),
            AccountInfoTile(
              title: 'Change Easypaisa Account PIN',
              leadingIcon: Image.asset(
                'assets/icons/pin-code.png',
                height: 24,
                width: 24,
                color: Colors.green,
              ),
              trailingIcon: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.black54,
              ),
            ),
            AccountInfoTile(
              title: 'Link Telenor Microfinance Bank',
              leadingIcon: Image.asset(
                'assets/icons/pin-code.png',
                height: 24,
                width: 24,
                color: Colors.green,
              ),
              trailingIcon: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.black54,
              ),
            ),
            AccountInfoTile(
              title: 'Link Debt Card',
              leadingIcon: Image.asset(
                'assets/icons/pin-code.png',
                height: 24,
                width: 24,
                color: Colors.green,
              ),
              trailingIcon: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.black54,
              ),
            ),
            AccountInfoTile(
              title: 'Get Your Tax Certificate',
              leadingIcon: Image.asset(
                'assets/icons/pin-code.png',
                height: 24,
                width: 24,
                color: Colors.green,
              ),
              trailingIcon: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.black54,
              ),
            ),
            AccountInfoTile(
              title: 'Become an Easypaisa Merchant',
              leadingIcon: Image.asset(
                'assets/icons/pin-code.png',
                height: 24,
                width: 24,
                color: Colors.green,
              ),
              trailingIcon: const Icon(
                Icons.arrow_forward_ios,
                size: 16,
                color: Colors.black54,
              ),
            ),
            const SizedBox(height: 24),
            const Text(
              'GENERAL',
              style: TextStyle(
                  // fontFamily: 'Proxima Nova',
                  letterSpacing: 0.5,
                  fontWeight: FontWeight.w500,
                  color: Colors.black54),
            ),
            const SizedBox(height: 20),
            AccountInfoTile(
              title: 'Notifications',
              leadingIcon: const Icon(
                Icons.notifications_outlined,
                color: Colors.green,
              ),
              trailingIcon: Switch(
                  activeColor: Colors.green,
                  value: true,
                  onChanged: (value) {}),
            ),
            AccountInfoTile(
              title: 'Finger Print/Face Login',
              leadingIcon: const Icon(
                Icons.person_outline,
                color: Colors.green,
              ),
              trailingIcon: Switch(
                  activeColor: Colors.green,
                  value: false,
                  onChanged: (value) {}),
            ),
          ],
        ),
      ),
    );
  }
}

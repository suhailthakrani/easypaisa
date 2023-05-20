import 'package:easypaisa/screens/main_screen.dart';
import 'package:flutter/material.dart';

class PromotionsScreen extends StatefulWidget {
  const PromotionsScreen({super.key});

  @override
  State<PromotionsScreen> createState() => _PromotionsScreenState();
}

class _PromotionsScreenState extends State<PromotionsScreen> {
  List<String> proImages = [
    'assets/images/img1.jpg',
    'assets/images/img3.jpg',
    'assets/images/img4.jpg',
    'assets/images/img2.jpg',
  ];
  List<String> proText = [
    'Movie on Weekends!',
    'Cheesy offers!',
    'Avail Instant cash loan with Easypaisa!',
    'Easypaisa QR Scan & win!',
  ];
  List<String> proBodyText = [
    'Jeet Rs. 150,000 by scanning easypaisa QR code in just Rs.5!!',
    'Get 50% off + free delivery',
    'Get Rs.200 cashback on moview tickets.',
    '4 lucky winners will win',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _getAppBar(),
      body: _getBody(),
    );
  }

  AppBar _getAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.green,
      leading: IconButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const MainScreen(),
              ));
        },
        icon: const Icon(
          Icons.arrow_back_ios_new,
          // color: Colors.black87,
          size: 15,
        ),
      ),
      toolbarHeight: 60,
      title: const Padding(
        padding: EdgeInsets.only(top: 8.0, left: 40),
        child: Text(
          'Promotions',
          style: TextStyle(fontSize: 17),
        ),
      ),
    );
  }

  Widget _getBody() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
        itemCount: proImages.length,
        itemBuilder: (context, index) {
          return getCardWidget(index);
        },
      ),
    );
  }

  Widget getCardWidget(index) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              proImages[index],
            ),
            SizedBox(height: 5),
            Text(
              proText[index],
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.green,
              ),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    proBodyText[index],
                  ),
                ),
                const Text(
                  'Read more',
                  style: TextStyle(color: Colors.green),
                )
              ],
            ),
            SizedBox(height: 5),
          ],
        ),
      ),
    );
  }
}

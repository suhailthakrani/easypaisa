import 'package:easypaisa/commons/widgets/bottom_view_sheet.dart';
import 'package:easypaisa/commons/widgets/custom_app_bar.dart';
import 'package:easypaisa/commons/widgets/feature_widget.dart';
import 'package:easypaisa/commons/widgets/page_view_builder.dart';
import 'package:easypaisa/screens/home/components/first_view.dart';
import 'package:easypaisa/screens/home/components/fourth_view.dart';
import 'package:easypaisa/screens/home/components/second_view.dart';
import 'package:easypaisa/screens/home/components/third_view.dart';
import 'package:easypaisa/screens/my_account/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  // List of items to display
  final List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
    'Item 10',
  ];

  // Text editing controller for search bar
  final TextEditingController _controller = TextEditingController();

  final PageController _pageController = PageController();
  int _currentPage = 0;

  // List of filtered items based on search query
  List<String> filteredItems = [];

  // Animation controller for rotating the dropdown icon
  AnimationController? _animationController;

  // Whether the bottom sheet is expanded or not
  final bool _isExpanded = false;

  @override
  void initState() {
    super.initState();

    // Initialize the animation controller
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
  }

  @override
  void dispose() {
    // Dispose the animation controller
    _animationController!.dispose();

    super.dispose();
  }

  // Method to show the bottom sheet
  void _showBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (BuildContext context, StateSetter setState) {
            return AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
              height:
                  _isExpanded ? MediaQuery.of(context).size.height * 0.5 : 400,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16),
                  topRight: Radius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin:
                            const EdgeInsets.only(top: 16, left: 16, right: 16),
                        height: 4,
                        width: 40,
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(2),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.zero,
                        hintText: 'Search',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        isDense: true,
                      ),
                      onChanged: (value) {
                        setState(() {
                          // Update the filtered items based on search query

                          filteredItems = _controller.text.isEmpty
                              ? items
                              : items
                                  .where((item) => item
                                      .toLowerCase()
                                      .contains(value.toLowerCase()))
                                  .toList();
                        });
                      },
                    ),
                  ),
                  const SizedBox(height: 16),
                  Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      itemCount: filteredItems.isEmpty
                          ? items.length
                          : filteredItems.length,
                      itemBuilder: (BuildContext context, int index) {
                        filteredItems =
                            filteredItems.isNotEmpty ? filteredItems : items;
                        return ListTile(
                          title: Text(filteredItems[index]),
                          onTap: () {
// Do something when an item is tapped
                            print('Item ${filteredItems[index]} tapped');
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBody(),
      floatingActionButton: Stack(
        alignment: Alignment.centerRight,
        children: [
          Positioned(
            bottom: 80,
            right: 0,
            child: Container(
              alignment: Alignment.center,
              height: 40.0,
              width: 40.0,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12),
                  bottomLeft: Radius.circular(12),
                ),
                color: Colors.green,
              ),
            ),
          ),
          const Positioned(
            bottom: 88,
            right: 8,
            child: Icon(
              Icons.headset_mic_outlined,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  List<String> images = [
    'assets/images/img1.jpg',
    'assets/images/img4.jpg',
    'assets/images/img3.jpg',
    'assets/images/img2.jpg',
  ];

  Widget _getBody() {
    return CustomScrollView(
      physics: const ClampingScrollPhysics(),
      slivers: [
        _appBar(),
        _header(),
        // _moneyTransferText(),
        _moneyTransfer(),

        SliverToBoxAdapter(
          child: Container(
            decoration: const BoxDecoration(color: Color(0xfffffdf4)),
            padding: const EdgeInsets.symmetric(vertical: 18),
            // margin: const EdgeInsets.symmetric(vertical: 10),
            height: 65,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      // foregroundColor: Colors.black54,
                      padding: const EdgeInsets.symmetric(horizontal: 8),
                      side: BorderSide(
                        color: Colors.yellow.shade800,
                        width: 0.5,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      )),
                  onPressed: () {
                    _showBottomSheet(context);
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        'View Send Money Favourites',
                        style: TextStyle(
                            color: Color(0xff000006),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Proxima Nova'),
                      ),
                      RotationTransition(
                        turns: Tween(begin: 0.0, end: 0.5).animate(
                          CurvedAnimation(
                            parent: _animationController!,
                            curve: Curves.easeInOut,
                          ),
                        ),
                        child: const Icon(
                          Icons.keyboard_arrow_down,
                          color: Colors.black54,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        // SliverToBoxAdapter(child: MyPageView(children: [

        // ]),),

        SliverToBoxAdapter(
          child: Container(
            height: 210,
            decoration: const BoxDecoration(),
            child: const MyPageView(
              children: [
                FirstView(),
                SecondView(),
                ThirdView(),
                FourthView(),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.only(left: 20, bottom: 5),
            child: Text(
              'Promotions',
              style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                  fontFamily: 'Proxima Nova',
                  letterSpacing: 0.3),
            ),
          ),
        ),
        SliverToBoxAdapter(
          child: Container(
            height: 130,
            width: 300,
            padding: const EdgeInsets.only(left: 16),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.asset(
                    images[index],
                    // width: 300,
                  ),
                );
              },
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 8);
              },
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
            child: Text(
              'Discover MiniApps on Easypaisa',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
          ),
        ),
        const SliverToBoxAdapter(
          child: FirstView(),
        ),

        SliverToBoxAdapter(
            child: Container(
          height: 180,
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              return Card(
                color: Colors.white,
                surfaceTintColor: Colors.white,
                child: Image.asset(
                  'assets/images/Savings.png',
                  height: 100,
                  width: 300,
                ),
              );
            },
            separatorBuilder: (BuildContext context, int index) {
              return const SizedBox(width: 30);
            },
          ),
        )),
        const SliverPadding(padding: EdgeInsets.only(bottom: 10))
      ],
    );
  }

  SliverAppBar _appBar() {
    return SliverAppBar(
      pinned: true,
      elevation: 1,
      centerTitle: true,
      toolbarHeight: 60,
      flexibleSpace: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 11, 180, 96),
              Color.fromARGB(255, 10, 138, 78),
            ],
          ),
        ),
      ),
      title: const Padding(
        padding: EdgeInsets.only(top: 12.0),
        child: Text(
          'easypaisa',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Colors.white,
            fontFamily: 'Proxima Nova',
          ),
        ),
      ),
      leadingWidth: 90,
      leading: Container(
        margin: const EdgeInsets.only(left: 0, top: 20, bottom: 8, right: 16),
        // padding: EdgeInsets.only(top: 4.0),
        height: 35,
        width: 35,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            scale: 0.8,
            image: AssetImage(
              'assets/icons/easypaisa.jpg',
            ),
            // fit: BoxFit.cover,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(top: 12.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              IconButton(
                icon: const Icon(
                  Icons.search_sharp,
                ),
                color: Colors.white,
                onPressed: () {
                  // Implement search functionality
                },
              ),
              IconButton(
                icon: const Icon(Icons.notifications_outlined),
                color: Colors.white,
                onPressed: () {
                  // Implement notification functionality
                },
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _header() {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.only(bottom: 8, top: 2),
        height: 140,
        decoration: const BoxDecoration(
          color: Colors.white,
          gradient: LinearGradient(
            tileMode: TileMode.decal,
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 11, 180, 96),
              Color.fromARGB(255, 10, 138, 78),
            ],
          ),
        ),
        child: Card(
          elevation: 3,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          color: const Color(0xffffffff),
          surfaceTintColor: const Color(0xffffffff),
          child: Padding(
            padding: const EdgeInsets.all(6.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // SizedBox(height: 2),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: 18,
                      padding: const EdgeInsets.only(left: 30.0),
                      child: Image.asset(
                        'assets/icons/icon.png',
                      ),
                    ),
                    Wrap(
                      crossAxisAlignment: WrapCrossAlignment.center,
                      alignment: WrapAlignment.spaceEvenly,
                      children: [
                        Container(
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.amber,
                          ),
                          child: const Icon(
                            Icons.stream_rounded,
                            size: 18,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Padding(
                          padding: EdgeInsets.only(top: 2),
                          child: Text(
                            'My Rewards',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black54,
                              fontWeight: FontWeight.w600,
                              letterSpacing: 0.1,
                              fontFamily: 'Proxima Nova',
                            ),
                          ),
                        ),
                        const SizedBox(width: 5),
                      ],
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 12, right: 8, top: 5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: const [
                          SizedBox(height: 2),
                          Text(
                            ' SUHAIL KUMAR',
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.black87,
                              // fontWeight: FontWeight.w500,
                              // letterSpacing: 0.1,
                              // fontFamily: 'Proxima Nova',
                            ),
                          ),
                          Text(
                            '03483053712',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color(0xff000626),
                              letterSpacing: 0.3,
                            ),
                          ),
                          Text(
                            'Sign in to your easypaisa account',
                            style: TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                              letterSpacing: 0.3,
                              fontFamily: 'Proxima Nova',
                            ),
                          )
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 12),
                        width: 85,
                        height: 24,
                        child: CupertinoButton(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 0,
                          ),
                          borderRadius: BorderRadius.circular(16),
                          onPressed: () {},
                          color: Color.fromARGB(255, 65, 189, 71),
                          // style: ElevatedButton.styleFrom(
                          //   backgroundColor: Colors.green,
                          // ),
                          child: const Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: Colors.white,
                              // fontFamily: 'Proxima Nova',
                              // letterSpacing: 0.3,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _moneyTransfer() {
    return SliverToBoxAdapter(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 155,
        decoration: const BoxDecoration(color: Color(0xfffffdf4)),
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
        ),
        child: Column(
          children: [
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  'Send money to anyone in Pakistan instantly',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                    // letterSpacing: 0.2,
                    fontFamily: 'Proxima Nova',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      margin: EdgeInsets.all(8),
                      elevation: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            'assets/icons/easypaisa.png',
                            height: 32,
                            width: 32,
                          ),
                          const Text(
                            'Easypaisa',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                              letterSpacing: 0.2,
                              fontFamily: 'Proxima Nova',
                            ),
                          ),
                          SizedBox(
                            width: 50,
                            height: 15,
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.blue.shade400,
                              ),
                              child: const Text(
                                'Free',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  // letterSpacing: 0.2,
                                  fontFamily: 'Proxima Nova',
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      margin: EdgeInsets.all(8),
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      elevation: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/icons/Bank Transfer.png',
                                height: 35,
                                width: 35,
                              ),
                              Image.asset(
                                'assets/icons/Raast.png',
                                height: 35,
                                width: 35,
                              ),
                            ],
                          ),
                          const Text(
                            'Bank Transfer',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                              letterSpacing: 0.2,
                              fontFamily: 'Proxima Nova',
                            ),
                          ),
                          SizedBox(
                            width: 55,
                            height: 15,
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Colors.blue.shade400,
                              ),
                              child: const Text(
                                'Free',
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  // letterSpacing: 0.2,
                                  fontFamily: 'Proxima Nova',
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: Card(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      margin: EdgeInsets.all(8),
                      color: Colors.white,
                      surfaceTintColor: Colors.white,
                      elevation: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            'assets/icons/CNIC.png',
                            height: 35,
                            width: 35,
                          ),
                          const Text(
                            'CNIC Transfer',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.black87,
                              letterSpacing: 0.3,
                              fontFamily: 'Proxima Nova',
                            ),
                          ),
                          const SizedBox(height: 2),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // Method to show the bottom sheet
}

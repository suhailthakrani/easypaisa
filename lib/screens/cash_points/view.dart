import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CashPointsScreen extends StatefulWidget {
  const CashPointsScreen({super.key});

  @override
  State<CashPointsScreen> createState() => _CashPointsScreenState();
}

class _CashPointsScreenState extends State<CashPointsScreen> {
  bool _isExpanded = false;

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff8ab4f8),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.green,
        leading: const Icon(Icons.arrow_back_ios_new),
        title: const Padding(
          padding: EdgeInsets.only(left: 30.0),
          child: Text(
            'Cash Deposit',
          ),
        ),
      ),
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Image.asset(
              'assets/images/map.PNG',
              filterQuality: FilterQuality.high,
              fit: BoxFit.fitHeight,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: GestureDetector(
              onTap: _toggleExpanded,
              child: AnimatedContainer(
                  duration: const Duration(microseconds: 300),
                  margin: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                    top: 8,
                    bottom: 4,
                  ),
                  height: _isExpanded ? 320 : 80,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: Column(
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: !_isExpanded
                              ? Container(
                                  height: 60,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.green,
                                  ),
                                  alignment: Alignment.center,
                                  padding: const EdgeInsets.all(12),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      const Text(
                                        'Cash Deposit',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                            fontSize: 18),
                                      ),
                                      Icon(
                                        !_isExpanded
                                            ? Icons.keyboard_arrow_up
                                            : Icons.keyboard_arrow_down,
                                        color: Colors.white,
                                      )
                                    ],
                                  ),
                                )
                              : Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      height: 60,
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8),
                                            topRight: Radius.circular(8)),
                                        color: Colors.green,
                                      ),
                                      alignment: Alignment.center,
                                      padding: EdgeInsets.all(12),
                                      child: Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Text(
                                            'Cash Deposit',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                                fontSize: 18),
                                          ),
                                          Icon(
                                            _isExpanded
                                                ? Icons.keyboard_arrow_up
                                                : Icons.keyboard_arrow_down,
                                            color: Colors.white,
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Container(
                                      color: Colors.white,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Text(
                                            'Your first cash deposit needs to be made through a Biomatric(BVS) Cash Point',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                              color: Colors.orange.shade400,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          SizedBox(height: 20),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: const [
                                              Chip(
                                                backgroundColor: Colors.green,
                                                labelStyle: TextStyle(
                                                    color: Colors.white),
                                                labelPadding: EdgeInsets.only(
                                                    top: 4,
                                                    right: 16,
                                                    bottom: 4,
                                                    left: 8),
                                                label: Text(
                                                  'Cash Points',
                                                ),
                                                avatar: CircleAvatar(
                                                  radius: 14,
                                                  backgroundColor: Colors.white,
                                                  child: Icon(
                                                    Icons.location_on_outlined,
                                                    color: Colors.green,
                                                  ),
                                                ),
                                              ),
                                              Chip(
                                                backgroundColor: Colors.green,
                                                labelStyle: TextStyle(
                                                    color: Colors.white),
                                                labelPadding: EdgeInsets.only(
                                                    top: 4,
                                                    right: 16,
                                                    bottom: 4,
                                                    left: 8),
                                                label: Text(
                                                  'Cash Points',
                                                ),
                                                avatar: CircleAvatar(
                                                  backgroundColor: Colors.white,
                                                  radius: 14,
                                                  child: Icon(
                                                    Icons.location_on_outlined,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            padding: const EdgeInsets.all(12.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Expanded(
                                                  flex: 3,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: const [
                                                      Text(
                                                        '1.0 Location',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.black54,
                                                          fontSize: 16,
                                                        ),
                                                      ),
                                                      SizedBox(height: 16),
                                                      Text(
                                                        'KM Hyderabad',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w600,
                                                          color: Colors.black45,
                                                          fontSize: 14,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Expanded(
                                                  flex: 3,
                                                  child: Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          Container(
                                                            width: 8,
                                                            height: 16,
                                                            color: Colors
                                                                .grey.shade400,
                                                          ),
                                                          Expanded(
                                                            child: Container(
                                                              height: 5,
                                                              color: Colors.grey
                                                                  .shade400,
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      SizedBox(
                                                        height: 16,
                                                        child: Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceEvenly,
                                                          children: const [
                                                            Expanded(
                                                              child: Text(
                                                                '1km',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 8,
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Text(
                                                                '10km',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 8,
                                                                ),
                                                              ),
                                                            ),
                                                            Expanded(
                                                              child: Text(
                                                                '20km',
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 8,
                                                                ),
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(height: 8),
                                                      const Text(
                                                        'Expand Radius',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          color: Colors.black45,
                                                          fontSize: 10,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                          SizedBox(height: 12),
                                          Container(
                                            height: 50,
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 5, horizontal: 12),
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.9,
                                            decoration: BoxDecoration(
                                              color: Colors.green,
                                              borderRadius:
                                                  BorderRadius.circular(
                                                20,
                                              ),
                                            ),
                                            child: Row(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                CircleAvatar(
                                                  radius: 16,
                                                  backgroundColor: Colors.white,
                                                  child: Icon(
                                                    CupertinoIcons
                                                        .money_dollar_circle,
                                                    color: Colors.green,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Text(
                                                    'How to Deposit Cash',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white,
                                                      fontSize: 14,
                                                    ),
                                                  ),
                                                ),
                                                Icon(
                                                  Icons
                                                      .arrow_forward_ios_outlined,
                                                  color: Colors.white,
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                        ),
                      ),
                    ],
                  )),
            ),
          ),
        ],
      ),
    );
  }
}

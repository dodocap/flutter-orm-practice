import 'dart:math';

import 'package:flutter/material.dart';

class StarbucksCloneScreen extends StatefulWidget {
  const StarbucksCloneScreen({super.key});

  @override
  State<StarbucksCloneScreen> createState() => _StarbucksCloneScreenState();
}

class _StarbucksCloneScreenState extends State<StarbucksCloneScreen> {
  final int _nextLevel = 25;
  bool _isLoading = true;

  @override
  void initState() {
    getItems();
    super.initState();
  }

  Future<void> getItems() async {
    await Future.delayed(const Duration(milliseconds: 300));

    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double bannerHeight = MediaQuery.of(context).size.width / (16 / 9);
    final int currentLevel = Random().nextInt(20) + 1;
    final int remainLevel = _nextLevel - currentLevel;

    return Scaffold(
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: bannerHeight,
                    scrolledUnderElevation: 0,
                    automaticallyImplyLeading: false,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Image.asset(
                        'assets/starbucks/top_0${Random().nextInt(3) + 1}.png',
                        fit: BoxFit.scaleDown,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '$remainLevel ✭ until Gold Level',
                                  style: const TextStyle(color: Colors.green, fontSize: 15.0),
                                ),
                                const SizedBox(height: 10),
                                LinearProgressIndicator(
                                  value: currentLevel / _nextLevel,
                                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                                  backgroundColor: const Color.fromARGB(255, 200, 200, 200),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 25),
                          Text(
                            '$currentLevel',
                            style: const TextStyle(fontSize: 30),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            '$_nextLevel✭',
                            style: const TextStyle(
                              color: Colors.green,
                              fontSize: 20,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.green,
        unselectedItemColor: Colors.grey,
        currentIndex: 0,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.payment),
            label: 'Pay',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.coffee),
            label: 'Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'Shop',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.more_horiz),
            label: 'Other',
          ),
        ],
      ),
    );
  }
}

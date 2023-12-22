import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                    floating: false,
                    pinned: true,
                    expandedHeight: bannerHeight + 45,
                    scrolledUnderElevation: 0,
                    automaticallyImplyLeading: false,
                    flexibleSpace: FlexibleSpaceBar(
                      collapseMode: CollapseMode.pin,
                      background: Column(
                        children: [
                          Image.asset(
                            'assets/starbucks/top_0${Random().nextInt(3) + 1}.png',
                            fit: BoxFit.scaleDown,
                          ),
                          Padding(
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
                        ],
                      ),
                    ),
                    bottom: PreferredSize(
                        preferredSize: const Size.fromHeight(0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.mail_lock_outlined,
                                  color: Colors.black54,
                                ),
                                label: const Text(
                                  '''What's New''',
                                  style: TextStyle(color: Colors.black54),
                                ),
                              ),
                              TextButton.icon(
                                onPressed: () {},
                                icon: const Icon(
                                  Icons.mail_lock_outlined,
                                  color: Colors.black54,
                                ),
                                label: const Text(
                                  'Coupon',
                                  style: TextStyle(color: Colors.black54),
                                ),
                              ),
                              const Spacer(),
                              IconButton(
                                onPressed: () {},
                                icon: SvgPicture.asset(
                                  'assets/icons/common_alarm.svg',
                                  width: 24,
                                  height: 24,
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                  SliverToBoxAdapter(
                      child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset('assets/starbucks/01_main_banner.png'),
                  )),
                  SliverToBoxAdapter(child: Image.asset('assets/starbucks/02_01_siren_order.png')),
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 16.0, left: 32.0, right: 32.0),
                          child: Row(
                            children: [
                              Text(
                                'Quick Order',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Text('최근 주문', style: TextStyle(fontSize: 15)),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 180,
                          child: PageView.builder(
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(right: 16.0),
                                child: Image.asset(
                                  'assets/starbucks/03_quick_0${index + 1}.png',
                                  fit: BoxFit.contain,
                                ),
                              );
                            },
                            controller: PageController(viewportFraction: 0.8),
                            itemCount: 2,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5),
                        child: Image.asset('assets/starbucks/04_christmas_event.png'),
                      ),
                    ),
                  )
                  /*SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return const Text(
                          'Test Text',
                          style: TextStyle(fontSize: 30),
                        );
                      },
                      childCount: 30,
                    ),
                  ),*/
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

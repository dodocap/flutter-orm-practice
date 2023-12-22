import 'dart:async';
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

  Future<Map<String, double>> _getImageSize(String imagePath) async {
    Completer<ImageInfo> completer = Completer();

    Image(image: AssetImage(imagePath))
        .image
        .resolve(const ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo image, bool synchronousCall) {
      completer.complete(image);
    }));

    final ImageInfo imageInfo = await completer.future;

    return {'width': imageInfo.image.width.toDouble(), 'height': imageInfo.image.height.toDouble()};
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
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const Row(
                            children: [
                              Text(
                                '''What's New''',
                                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Text('See all', style: TextStyle(fontSize: 15)),
                            ],
                          ),
                          const SizedBox(height: 16),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: SizedBox(
                              height: 225,
                              child: Row(
                                children:
                                  List.generate(13, (index) {
                                    return Padding(
                                      padding: EdgeInsets.only(right: (index != 12) ? 8.0 : 0),
                                      child: Image.asset(
                                        'assets/starbucks/05_whats_new_${(index+1).toString().padLeft(2, '0')}.jpg',
                                        fit: BoxFit.contain,
                                      ),
                                    );
                                  }
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 4.0),
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          elevation: 3,
                          child: Image.asset('assets/starbucks/06_banner_0${index + 1}.png'),
                        ),
                      );
                    }, childCount: 2),
                  ),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 16),
                          RichText(
                            text: const TextSpan(
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                              children: [
                                TextSpan(text: '도도', style: TextStyle(color: Color.fromARGB(255, 218, 165, 32))),
                                TextSpan(text: '님을 위한 추천 메뉴 ', style: TextStyle(color: Colors.black)),
                              ]
                            ),
                          ),
                          const SizedBox(height: 16,),
                          SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: SizedBox(
                              height: 175,
                              child: Row(
                                children:
                                List.generate(8, (index) {
                                  return Padding(
                                    padding: EdgeInsets.only(right: (index != 8) ? 16.0 : 0),
                                    child: Image.asset(
                                      'assets/starbucks/07_coffee_${(index+1).toString().padLeft(2, '0')}.jpg',
                                      fit: BoxFit.contain,
                                    ),
                                  );
                                }
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate((context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 4.0),
                        child: Card(
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          elevation: 3,
                          child: Image.asset('assets/starbucks/08_banner_0${index + 1}.png'),
                        ),
                      );
                    }, childCount: 5),
                  ),
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

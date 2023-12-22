import 'dart:math';

import 'package:flutter/material.dart';

class StarbucksCloneScreen extends StatefulWidget {
  const StarbucksCloneScreen({super.key});

  @override
  State<StarbucksCloneScreen> createState() => _StarbucksCloneScreenState();
}

class _StarbucksCloneScreenState extends State<StarbucksCloneScreen> {
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
    final double _bannerHeight = MediaQuery.of(context).size.width / (16 / 9);
    final int _nextLevel = 25;
    final int _currentLevel = Random().nextInt(20 + 1);
    final int _remainLevel = _nextLevel - _currentLevel;

    return Scaffold(
      body: _isLoading
          ? Center(child: CircularProgressIndicator())
          : SafeArea(
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    expandedHeight: _bannerHeight,
                    scrolledUnderElevation: 0,
                    automaticallyImplyLeading: false,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Image.asset(
                        'assets/starbucks/top_0${Random().nextInt(3)+1}.png',
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
                                  '$_remainLevel ✭ until Gold Level',
                                  style: const TextStyle(color: Colors.green),
                                ),
                                const SizedBox(height: 10),
                                LinearProgressIndicator(
                                  value: _currentLevel / _nextLevel,
                                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.green),
                                  backgroundColor: const Color.fromARGB(255, 200, 200, 200),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 25),
                          Text(
                            '$_currentLevel',
                            style: const TextStyle(fontSize: 30),
                          ),
                          const SizedBox(width: 10),
                          Text('$_nextLevel✭',
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
    );
  }
}

/*
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 100.0,
                  floating: false,
                  scrolledUnderElevation: 0,
                  automaticallyImplyLeading: false,
                  leadingWidth: 120,
                  leading: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SvgPicture.asset('assets/youtube_premium_logo.svg'),
                  ),
                  actions: [
                    IconButton(
                      icon: const Icon(Icons.cast_connected_outlined),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: SvgPicture.asset(
                        'assets/icons/youtube_alarm.svg',
                        width: 24,
                        height: 24,
                      ),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: ClipRRect(
                        borderRadius: BorderRadius.circular(30.0),
                        child: Image.network('https://lh3.googleusercontent.com/a/ACg8ocLnT_WBB2xj9NsG4bHB-P5SnT7ARZWG9ZFYH2S8mYBVX2I=s576-c-no'),
                      ),
                      onPressed: () {},
                    ),
                  ],
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(40.0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          IconButton(
                            icon: SvgPicture.asset(
                              'assets/icons/youtube_compass.svg',
                              width: 24,
                              height: 24,
                            ),
                            onPressed: () {},
                          ),
                          const SizedBox(width: 12),
                          const Chip(
                            label: Text(
                              '전체',
                              style: TextStyle(color: Colors.white),
                            ),
                            backgroundColor: Colors.black87,
                          ),
                          const SizedBox(width: 12),
                          const Chip(label: Text('믹스')),
                          const SizedBox(width: 12),
                          const Chip(label: Text('뉴스')),
                          const SizedBox(width: 12),
                          const Chip(label: Text('음악')),
                          const SizedBox(width: 12),
                          const Chip(label: Text('게임')),
                          const SizedBox(width: 12),
                          const Chip(label: Text('스케치 코미디')),
                          const SizedBox(width: 12),
                          const Chip(label: Text('요리 프로그램')),
                        ],
                      ),
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      return Text('asdf', style: TextStyle(fontSize: 50),);
                    },
                    childCount: 20,
                  ),
                ),
              ],
            ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/youtube_shorts_modify.svg',
              width: 20,
            ),
            label: 'Shorts',
          ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_outline_outlined,
              size: 48,
            ),
            label: '',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.subscriptions_outlined),
            label: '구독',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.playlist_play_outlined),
            label: '보관함',
          ),
        ],
        currentIndex: 0,
      ),
    );
  }
}


 */

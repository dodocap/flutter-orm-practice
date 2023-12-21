import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orm_practice/23_12_21/model/youtube_item.dart';
import 'package:orm_practice/23_12_21/model/youtube_item_full.dart';
import 'package:orm_practice/23_12_21/model/youtube_item_short_group.dart';
import 'package:orm_practice/23_12_21/repository/youtube_item_repository.dart';
import 'package:orm_practice/23_12_21/youtube_item_short_widget.dart';
import 'package:orm_practice/23_12_21/youtube_item_widget.dart';

class YoutubeCloneScreen extends StatefulWidget {
  final YoutubeItemRepository repository = YoutubeItemRepository();

  YoutubeCloneScreen({super.key});

  @override
  State<YoutubeCloneScreen> createState() => _YoutubeCloneScreenState();
}

class _YoutubeCloneScreenState extends State<YoutubeCloneScreen> {
  final List<YoutubeItem> itemList = [];
  bool _isLoading = true;

  @override
  void initState() {
    getItems();
    super.initState();
  }

  Future<void> getItems() async {
    itemList.clear();
    itemList.addAll(await widget.repository.getYoutubeItems());
    setState(() {
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('클론 UI - Youtube'),
        scrolledUnderElevation: 0,
      ),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : CustomScrollView(
              slivers: [
                SliverAppBar(
                  expandedHeight: 100.0,
                  floating: true,
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
                          const Chip(label: Text('전체', style: TextStyle(color: Colors.white),), backgroundColor: Colors.black87,),
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
                      final YoutubeItem item = itemList[index];
                      switch (item.getType()) {
                        case TypeFull():
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: YoutubeItemWidget(item: item as YoutubeItemFull),
                          );
                        case TypeShort():
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: YoutubeItemShortWidget(item: item as YoutubeItemShortGroup),
                          );
                      }
                    },
                    childCount: itemList.length,
                  ),
                ),
              ],
            ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black,),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/youtube_shorts_modify.svg', width: 20,),
            label: 'Shorts',
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.add_circle_outline_outlined, size: 48,),
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

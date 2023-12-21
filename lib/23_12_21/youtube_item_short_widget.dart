import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orm_practice/23_12_21/model/youtube_item_short_group.dart';

class YoutubeItemShortWidget extends StatefulWidget {
  final YoutubeItemShortGroup _item;

  const YoutubeItemShortWidget({super.key, required YoutubeItemShortGroup item}) : _item = item;

  @override
  State<YoutubeItemShortWidget> createState() => _YoutubeItemShortWidgetState();
}

class _YoutubeItemShortWidgetState extends State<YoutubeItemShortWidget> {
  double _shortHeight = 0.0;

  @override
  Widget build(BuildContext context) {
    _shortHeight = MediaQuery.of(context).size.height / 2.5;

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 8.0, left: 8.0),
          child: Row(
            children: [
              SvgPicture.asset(
                'assets/icons/youtube_shorts.svg',
                height: 36,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 8.0),
                child: Text(
                  'Shorts',
                  style: TextStyle(
                    fontSize: 16.0,
                  ),
                ),
              )
            ],
          ),
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: widget._item.list.map((e) => shortCard(e)).toList(),
          ),
        )
      ],
    );
  }

  Widget shortCard(YoutubeItemShort short) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Stack(
          children: [
            Image.network(
              short.thumbnailUrl,
              height: _shortHeight,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 0,
              right: 0,
              child: IconButton(
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                  shadows: [
                    Shadow(
                      blurRadius: 3.0,
                      color: Colors.black,
                      offset: Offset(1.0, 1.0),
                    )
                  ],
                ),
                onPressed: () {},
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.only(left: 8.0, bottom: 8.0, right: 16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      short.title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 1.5,
                            color: Colors.black,
                            offset: Offset(1.0, 1.0),
                          ),
                        ],
                      ),
                    ),
                    Text(
                      '조회수 ${short.viewCount}',
                      style: const TextStyle(
                        fontSize: 12.0,
                        color: Colors.white,
                        shadows: [
                          Shadow(
                            blurRadius: 3.0,
                            color: Colors.black,
                            offset: Offset(1.0, 1.0),
                          ),
                        ],
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

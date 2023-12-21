import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:orm_practice/23_12_21/model/youtube_item_full.dart';

class YoutubeItemWidget extends StatelessWidget {
  final YoutubeItemFull _item;

  const YoutubeItemWidget({super.key, required YoutubeItemFull item}) : _item = item;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(
          _item.thumbnailUrl,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: Image.network(
                  _item.creatorThumbnailUrl,
                  scale: 1.5,
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      _item.title,
                      style: const TextStyle(fontSize: 16.0, overflow: TextOverflow.ellipsis),
                      maxLines: 2,
                    ),
                    Text(
                      '${_item.creator} \u22C5 '
                          '조회수 ${_item.viewCount} \u22C5 '
                          '${_item.publishTime}',
                      maxLines: 2,
                      style: const TextStyle(fontSize: 12.0, overflow: TextOverflow.ellipsis),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 30),
              Column(
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.more_vert)),
                ],
              ),
            ],
          ),
        )
      ],
    );
  }
}

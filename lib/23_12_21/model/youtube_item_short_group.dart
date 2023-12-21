import 'package:orm_practice/23_12_21/model/youtube_item.dart';

class YoutubeItemShortGroup implements YoutubeItem {
  final List<YoutubeItemShort> list;

  const YoutubeItemShortGroup(this.list);

  @override
  YoutubeType getType() {
    return TypeShort();
  }
}

class YoutubeItemShort {
  String thumbnailUrl;
  String title;
  String viewCount;

  YoutubeItemShort({
    required this.thumbnailUrl,
    required this.title,
    required this.viewCount,
  });
}
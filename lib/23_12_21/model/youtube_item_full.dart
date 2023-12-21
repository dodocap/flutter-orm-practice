import 'package:orm_practice/23_12_21/model/youtube_item.dart';

class YoutubeItemFull implements YoutubeItem {
  String thumbnailUrl;
  String creatorThumbnailUrl;
  String title;
  String creator;
  String viewCount;
  String publishTime;

  YoutubeItemFull({
    required this.thumbnailUrl,
    required this.creatorThumbnailUrl,
    required this.title,
    required this.creator,
    required this.viewCount,
    required this.publishTime,
  });

  @override
  YoutubeType getType() {
    return TypeFull();
  }
}
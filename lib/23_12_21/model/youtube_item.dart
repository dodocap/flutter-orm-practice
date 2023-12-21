sealed class YoutubeType {}
class TypeFull extends YoutubeType {}
class TypeShort extends YoutubeType {}

abstract interface class YoutubeItem {
  YoutubeType getType();
}
sealed class StarbucksItemType {}
class TypeFull extends StarbucksItemType {}
class TypeShort extends StarbucksItemType {}

abstract interface class StarbucksItem {
  StarbucksItemType getType();
}
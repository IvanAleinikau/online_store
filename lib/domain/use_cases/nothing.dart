/// Nothing class
class Nothing {
  /// Factory constructor
  factory Nothing() => _singleton;

  Nothing._internal();

  static final Nothing _singleton = Nothing._internal();
}

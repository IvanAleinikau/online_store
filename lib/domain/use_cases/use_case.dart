/// Abstract use case class
abstract class UseCase<T, V> {
  /// Call Method
  Future<T> call(V value);
}

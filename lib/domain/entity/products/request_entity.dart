/// Entity when we call get products
class RequestEntity {
  /// Default constructor
  RequestEntity({
    required this.limit,
    required this.skip,
  });

  /// Number of products on one page
  final int limit;

  /// Number of skipped products
  final int skip;
}

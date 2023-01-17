class PaginationResponse<T extends List> {
  final int totalCount;
  final T items;
  PaginationResponse({
    required this.totalCount,
    required this.items,
  });
}

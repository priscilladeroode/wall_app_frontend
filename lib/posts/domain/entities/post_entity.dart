class PostResponseEntity {
  final String id;
  final String title;
  final String content;
  final String createdBy;
  final DateTime createdAt;

  PostResponseEntity({
    required this.id,
    required this.title,
    required this.content,
    required this.createdBy,
    required this.createdAt,
  });
}

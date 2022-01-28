class PostResponseModel {
  final String id;
  final String title;
  final String content;
  final String createdBy;
  final DateTime createdAt;

  PostResponseModel({
    required this.id,
    required this.title,
    required this.content,
    required this.createdBy,
    required this.createdAt,
  });

  factory PostResponseModel.fromJson(Map<String, dynamic> json) => PostResponseModel(
        id: json['id'] ?? "",
        title: json['title'] ?? "",
        content: json['content'] ?? "",
        createdBy: json['createdBy'] ?? "",
        createdAt: json['createdAt'] != null ? DateTime.parse(json['createdAt']) : DateTime.now(),
      );

  static List<PostResponseModel> fromJsonList(List<dynamic> json) =>
      json.map((i) => PostResponseModel.fromJson(i)).toList();
}

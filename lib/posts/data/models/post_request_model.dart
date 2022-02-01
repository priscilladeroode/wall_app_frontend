class PostRequestModel {
  final String? id;
  final String title;
  final String content;

  PostRequestModel({
    this.id,
    required this.title,
    required this.content,
  });

  Map<String, dynamic> toJson(PostRequestModel post) => <String, dynamic>{
        'id': post.id,
        'title': post.title,
        'content': post.content,
      };
}

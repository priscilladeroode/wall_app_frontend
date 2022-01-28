abstract class PostsFailures implements Exception {
  String? get message;
}

class PostsDatasourceError extends PostsFailures {
  @override
  final String? message;

  PostsDatasourceError({this.message});
}

class PostsRepositoryFailure extends PostsFailures {
  @override
  final String? message;

  PostsRepositoryFailure({this.message});
}

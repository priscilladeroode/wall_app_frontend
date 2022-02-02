abstract class PostsFailures implements Exception {
  String get message;
}

class PostsDatasourceError extends PostsFailures {
  @override
  String get message => "Ops... an error has occured, try again later.";
}

class PostsRepositoryFailure extends PostsFailures {
  @override
  String get message => "Ops... an error has occured, try again later.";
}

class InvalidTitleLength extends PostsFailures {
  @override
  String get message => 'Title must be between 10 and 150 characters.';
}

class InvalidContentLength extends PostsFailures {
  @override
  String get message => 'Content must be between 200 and 3000 characters.';
}

class Unauthorized extends PostsFailures {
  @override
  String get message => 'It seems like you are not the owner of this post.';
}

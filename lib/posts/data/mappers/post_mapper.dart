import '../../../commons/mapper.dart';
import '../../domain/entities/post_response_entity.dart';
import '../models/post_response_model.dart';

class PostMapper extends Mapper<PostResponseEntity, PostResponseModel> {
  @override
  PostResponseEntity handle(PostResponseModel f) {
    return PostResponseEntity(
      id: f.id,
      title: f.title,
      content: f.content,
      createdBy: f.createdBy,
      createdAt: f.createdAt,
    );
  }
}

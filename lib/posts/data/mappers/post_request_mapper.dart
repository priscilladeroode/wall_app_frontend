import '../../../commons/mapper.dart';
import '../../domain/entities/post_request_entity.dart';
import '../models/post_request_model.dart';

class PostRequestMapper extends Mapper<PostRequestModel, PostRequestEntity> {
  @override
  PostRequestModel handle(PostRequestEntity f) {
    return PostRequestModel(
      id: f.id,
      title: f.title,
      content: f.content,
    );
  }
}

import '../../domain/usecases/get_post_by_id.dart';
import 'stores/post_details_page_store.dart';

class PostDetailsPageController {
  final PostDetailsPageStore store;
  final GetPostById usecase;

  PostDetailsPageController({
    required this.store,
    required this.usecase,
  });

  Future<void> getPost(String id) async {
    store.setLoading = true;
    final result = await usecase(id);
    result.fold(
      (l) => store.setError = l.message ?? "Ops... an error has occured. Try again later.",
      (r) => store.setPost = r,
    );
    store.setLoading = false;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../auth/presentation/stores/auth_store.dart';
import '../../../commons/local_storage/domain/usecases/clear_user_usecase.dart';

import '../../../wall_ui/components/wall_success_dialog.dart';
import '../../domain/failures/posts_failures.dart';
import '../../domain/usecases/delete_post_usecase.dart';
import '../../domain/usecases/get_post_by_id.dart';
import 'stores/post_details_page_store.dart';

class PostDetailsPageController {
  final PostDetailsPageStore store;
  final GetPostById usecase;
  final DeletePostUseCase deletePostUseCase;
  final ClearUserUseCase clearUserUseCase;
  final AuthStore authStore;

  PostDetailsPageController(
      {required this.store,
      required this.usecase,
      required this.deletePostUseCase,
      required this.clearUserUseCase,
      required this.authStore});

  Future<void> getPost(String id) async {
    store.setLoading = true;
    final result = await usecase(id);
    result.fold(
      (l) => store.setError = l.message,
      (r) => store.setPost = r,
    );
    store.setLoading = false;
  }

  Future<void> deletePost(BuildContext context) async {
    store.setLoading = true;
    final result = await deletePostUseCase(store.post!.id);
    result.fold(
      (l) {
        store.setError = l.message;
        if (l is AccessDenied) {
          signOut();
        }
      },
      (r) {
        showDialog(
                context: context,
                builder: (context) => const WallSuccessDialog(
                    title: 'Post deleted', imagePath: 'assets/images/delete.svg'))
            .whenComplete(() => Modular.to.popUntil(ModalRoute.withName('/home/myHome')));
      },
    );
    store.setLoading = false;
  }

  void signOut() async {
    await clearUserUseCase();
    Modular.to.navigate('/home/');
    authStore.setName = null;
    authStore.setEmail = null;
    authStore.setAccessToken = null;
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:wall_app_frontend/auth/presentation/stores/auth_store.dart';
import 'package:wall_app_frontend/commons/local_storage/domain/usecases/clear_user_usecase.dart';

import '../../../wall_ui/components/wall_success_dialog.dart';
import '../../domain/entities/post_request_entity.dart';
import '../../domain/failures/posts_failures.dart';
import '../../domain/usecases/create_post_usecase.dart';
import '../../domain/usecases/get_post_by_id.dart';
import '../../domain/usecases/update_post_usecase.dart';
import '../components/post_form/post_form_store.dart';

class WritePostPageController {
  final UpdatePostUseCase usecase;
  final CreatePostUseCase createUsecase;
  final PostFormStore store;
  final GetPostById getUsecase;
  final ClearUserUseCase clearUserUseCase;
  final AuthStore authStore;

  WritePostPageController(
    this.usecase,
    this.store,
    this.getUsecase,
    this.createUsecase,
    this.clearUserUseCase,
    this.authStore,
  );

  Future<void> getPost(String id) async {
    store.setLoading = true;
    final result = await getUsecase(id);
    result.fold(
      (l) => store.setError = l.message,
      (r) => {
        store.setId = r.id,
        store.title.text = r.title,
        store.content.text = r.content,
      },
    );
    store.setLoading = false;
  }

  Future<void> update(BuildContext context) async {
    final content = store.content.text.replaceAll("\"", "'");
    final title = store.title.text.replaceAll("\"", "'");
    final _result = await usecase(PostRequestEntity(
      id: store.id,
      title: title,
      content: content,
    ));
    _result.fold((l) {
      store.setError = l.message;
      if (l is AccessDenied) {
        signOut();
      }
    },
        (r) => showDialog(
                context: context,
                builder: (context) => const WallSuccessDialog(
                    title: 'Post updated', imagePath: 'assets/images/done.svg')).whenComplete(
              () => Modular.to.popUntil(ModalRoute.withName('/home/myHome')),
            ));
  }

  Future<void> create(BuildContext context) async {
    final content = store.content.text.replaceAll("\"", "'");
    final title = store.title.text.replaceAll("\"", "'");
    final _result = await createUsecase(PostRequestEntity(
      title: title,
      content: content,
    ));
    _result.fold(
      (l) {
        store.setError = l.message;
        if (l is AccessDenied) {
          signOut();
        }
      },
      (r) => showDialog(
              context: context,
              builder: (context) => const WallSuccessDialog(
                  title: 'Post created', imagePath: 'assets/images/done.svg'))
          .whenComplete(() => Modular.to.popUntil(ModalRoute.withName('/home/myHome'))),
    );
  }

  void signOut() async {
    await clearUserUseCase();
    Modular.to.navigate('/home/');
    authStore.setName = null;
    authStore.setEmail = null;
    authStore.setAccessToken = null;
  }
}

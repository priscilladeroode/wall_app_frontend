import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../wall_ui/components/wall_success_dialog.dart';

import '../../domain/entities/post_request_entity.dart';
import '../../domain/usecases/create_post_usecase.dart';
import 'stores/create_post_page_store.dart';

class CreatePostPageController {
  final CreatePostUseCase usecase;
  final CreatePostPageStore store;

  CreatePostPageController(this.usecase, this.store);

  Future<void> create(BuildContext context) async {
    final _result = await usecase(PostRequestEntity(
      title: store.title.text,
      content: store.content.text,
    ));
    _result.fold(
      (l) => store.setError = l.message,
      (r) => showDialog(
          context: context,
          builder: (context) => const WallSuccessDialog(
              title: 'Post created',
              imagePath: 'assets/images/done.svg')).whenComplete(() => Modular.to.pop()),
    );
  }
}

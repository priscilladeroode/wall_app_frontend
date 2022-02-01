import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_svg/svg.dart';

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
        builder: (context) => AlertDialog(
          title: const Text(
            'Post created',
            textAlign: TextAlign.center,
          ),
          content: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 350, maxHeight: 350),
            child: SvgPicture.asset('assets/images/done.svg'),
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => Modular.to.pop(),
                  child: const Text('ok'),
                ),
              ],
            ),
          ],
        ),
      ).whenComplete(() => Modular.to.pop()),
    );
  }
}

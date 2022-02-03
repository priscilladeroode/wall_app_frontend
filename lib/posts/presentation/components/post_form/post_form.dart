import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../commons/breakpoints.dart';
import '../../../../wall_ui/base_components/wall_elevated_button.dart';
import '../../../../wall_ui/base_components/wall_page_title.dart';
import '../../../domain/failures/posts_failures.dart';
import 'post_form_store.dart';

class PostForm extends StatefulWidget {
  final String formTitle;
  final PostFormStore store;
  final Function(BuildContext) onFormSend;
  final Breakpoint breakpoint;

  const PostForm({
    Key? key,
    this.formTitle = 'Let\'s start!',
    required this.onFormSend,
    required this.breakpoint,
    required this.store,
  }) : super(key: key);

  @override
  State<PostForm> createState() => _PostFormState();
}

class _PostFormState extends State<PostForm> {
  final GlobalKey<FormState> postFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      return Form(
        key: postFormKey,
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          constraints: widget.breakpoint.device == LayoutClass.mobile
              ? null
              : BoxConstraints(maxWidth: widget.breakpoint.screenWidth * 0.7),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              WallPageTitle(
                title: widget.formTitle,
                device: widget.breakpoint.device,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: widget.store.title,
                maxLength: 150,
                decoration: const InputDecoration(
                  label: Text('Title'),
                ),
                validator: (value) {
                  if (value!.length < 3 || value.length > 150) {
                    return InvalidTitleLength().message;
                  }
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                controller: widget.store.content,
                minLines: 1,
                maxLines: 15,
                maxLength: 3000,
                decoration: const InputDecoration(
                  alignLabelWithHint: true,
                  label: Text('Content'),
                ),
                validator: (value) {
                  if (value!.length < 10 || value.length > 3000) {
                    return InvalidContentLength().message;
                  }
                },
              ),
              const SizedBox(height: 24),
              Observer(builder: (context) {
                return WallElevatedButton(
                  label: 'Save',
                  loading: widget.store.loading,
                  onPressed: () {
                    if (postFormKey.currentState!.validate()) {
                      widget.onFormSend(context);
                    }
                  },
                );
              })
            ],
          ),
        ),
      );
    });
  }
}

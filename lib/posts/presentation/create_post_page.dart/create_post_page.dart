import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../commons/breakpoints.dart';
import '../../../wall_ui/base_components/wall_page_title.dart';
import '../../../wall_ui/components/wall_app_bar/wall_app_bar.dart';
import '../../domain/failures/posts_failures.dart';
import 'create_post_page_controller.dart';

class CreatePostPage extends StatefulWidget {
  const CreatePostPage({Key? key}) : super(key: key);

  @override
  State<CreatePostPage> createState() => _CreatePostPageState();
}

class _CreatePostPageState extends ModularState<CreatePostPage, CreatePostPageController> {
  late Breakpoint breakpoint;
  final GlobalKey<FormState> _formNewPostKey = GlobalKey<FormState>();

  @override
  void didChangeDependencies() {
    breakpoint = Breakpoint.fromMediaQuery(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: WallAppBar(breakpoint: breakpoint),
        body: SingleChildScrollView(
          child: SizedBox(
            width: breakpoint.screenWidth,
            height: breakpoint.screenHeight,
            child: Center(
              child: Form(
                  key: _formNewPostKey,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16),
                    constraints: breakpoint.device == LayoutClass.mobile
                        ? null
                        : BoxConstraints(maxWidth: breakpoint.screenWidth * 0.7),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        WallPageTitle(
                          title: 'Let\'s go!',
                          device: breakpoint.device,
                        ),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controller.store.title,
                          maxLength: 150,
                          decoration: const InputDecoration(
                            label: Text('Title'),
                          ),
                          validator: (value) {
                            if (value!.length <= 10 || value.length >= 150) {
                              return InvalidTitleLength().message;
                            }
                          },
                        ),
                        const SizedBox(height: 16),
                        TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: controller.store.content,
                          minLines: 1,
                          maxLines: 15,
                          maxLength: 3000,
                          decoration: const InputDecoration(
                            alignLabelWithHint: true,
                            label: Text('Content'),
                          ),
                          validator: (value) {
                            if (value!.length <= 10 || value.length >= 150) {
                              return InvalidContentLength().message;
                            }
                          },
                        ),
                        const SizedBox(height: 24),
                        ElevatedButton(
                            onPressed: () {
                              if (_formNewPostKey.currentState!.validate()) {
                                controller.create(context);
                              }
                            },
                            child: Text('Save'.toUpperCase()))
                      ],
                    ),
                  )),
            ),
          ),
        ));
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../commons/breakpoints.dart';
import '../../../wall_ui/components/wall_app_bar/wall_app_bar.dart';
import '../components/post_form/post_form.dart';
import 'write_post_page_controller.dart';

class WritePostPage extends StatefulWidget {
  final String? id;
  const WritePostPage({Key? key, this.id}) : super(key: key);

  @override
  State<WritePostPage> createState() => _WritePostPageState();
}

class _WritePostPageState extends ModularState<WritePostPage, WritePostPageController> {
  late Breakpoint breakpoint;

  @override
  void initState() {
    widget.id != null ? controller.getPost(widget.id!) : null;
    super.initState();
  }

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
            child: PostForm(
              store: controller.store,
              onFormSend:
                  (widget.id == null || widget.id!.isEmpty) ? controller.create : controller.update,
              breakpoint: breakpoint,
            ),
          ),
        ),
      ),
    );
  }
}

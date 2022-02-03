import 'package:flutter/material.dart';

import '../../../commons/breakpoints.dart';
import '../../../wall_ui/components/wall_app_bar/wall_app_bar.dart';
import '../components/auth_image_widget.dart';
import 'components/sign_up_form/sign_up_form.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  late Breakpoint breakpoint;
  @override
  void didChangeDependencies() {
    breakpoint = Breakpoint.fromMediaQuery(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WallAppBar(
        breakpoint: breakpoint,
        hideActions: true,
      ),
      body: SizedBox(
        height: breakpoint.screenHeight,
        width: breakpoint.device == LayoutClass.desktop
            ? breakpoint.screenWidth * 0.75
            : breakpoint.screenWidth,
        child: Row(
          mainAxisAlignment: breakpoint.device == LayoutClass.desktop
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            if (breakpoint.device == LayoutClass.desktop)
              AuthImageWidget(
                breakpoint: breakpoint,
                imagePath: 'assets/images/signup_image.png',
              ),
            const SignUpForm(),
          ],
        ),
      ),
    );
  }
}

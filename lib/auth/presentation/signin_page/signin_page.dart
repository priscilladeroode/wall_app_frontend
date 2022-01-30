import 'package:flutter/material.dart';

import '../../../commons/breakpoints.dart';
import '../../../wall_ui.dart/components/wall_app_bar/wall_app_bar.dart';
import '../components/auth_image_widget.dart';
import 'components/sign_in_form/signin_form.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  late Breakpoint breakpoint;
  @override
  void didChangeDependencies() {
    breakpoint = Breakpoint.fromMediaQuery(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: WallAppBar(breakpoint: breakpoint),
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
                imagePath: 'assets/images/signin_image.png',
              ),
            const SignInForm(),
          ],
        ),
      ),
    );
  }
}

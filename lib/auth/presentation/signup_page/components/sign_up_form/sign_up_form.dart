import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../commons/breakpoints.dart';

import '../../../../../wall_ui/base_components/wall_elevated_button.dart';
import '../../../../../wall_ui/components/wall_theme_mode_switch/wall_theme_mode_switch.dart';
import '../../../../../wall_ui/tokens/wall_colors.dart';
import 'sign_up_form_controller.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends ModularState<SignUpForm, SignUpFormController> {
  late ThemeData theme;
  late Breakpoint breakpoint;
  final _formKey = GlobalKey<FormState>();
  @override
  void didChangeDependencies() {
    theme = Theme.of(context);
    breakpoint = Breakpoint.fromMediaQuery(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        width: breakpoint.screenWidth,
        child: Container(
          padding: breakpoint.device == LayoutClass.desktop
              ? null
              : const EdgeInsets.symmetric(horizontal: 16),
          width: double.maxFinite,
          child: Form(
            key: _formKey,
            child: Observer(builder: (context) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const WallThemeModeSwitch(),
                  Text(
                    'Register',
                    style: theme.textTheme.headline3,
                  ),
                  const SizedBox(height: 48),
                  if (controller.store.error.isNotEmpty)
                    Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(bottom: 16),
                      decoration: BoxDecoration(
                          color: theme.errorColor, borderRadius: BorderRadius.circular(4)),
                      child: Row(
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(right: 16),
                            child: Icon(
                              Icons.warning,
                              color: WallColors.neutral50,
                            ),
                          ),
                          Flexible(
                            child: Text(
                              controller.store.error,
                              style:
                                  theme.textTheme.bodyText1!.copyWith(color: WallColors.neutral50),
                            ),
                          ),
                        ],
                      ),
                    ),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller.store.fullNameController,
                    decoration: const InputDecoration(
                      label: Text('Full name'),
                    ),
                    validator: (value) => controller.validateName(value),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller.store.emailController,
                    decoration: const InputDecoration(
                      label: Text('E-mail'),
                    ),
                    inputFormatters: [FilteringTextInputFormatter(RegExp("[A-Z ]"), allow: false)],
                    validator: (value) => controller.validateEmail(value),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller.store.passwordController,
                    obscureText: controller.store.passwordObscure,
                    inputFormatters: [FilteringTextInputFormatter(RegExp("[ \"]"), allow: false)],
                    decoration: InputDecoration(
                      label: const Text('Password'),
                      suffixIcon: IconButton(
                        onPressed: () => controller.store.setPasswordVisibility(),
                        icon: controller.store.passwordObscure
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                      ),
                    ),
                    validator: (value) => controller.validatePassword(value),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    controller: controller.store.passwordConfirmationController,
                    obscureText: controller.store.passwordConfirmationObscure,
                    inputFormatters: [FilteringTextInputFormatter(RegExp("[ \"]"), allow: false)],
                    decoration: InputDecoration(
                      label: const Text('Password confirmation'),
                      suffixIcon: IconButton(
                        onPressed: () => controller.store.setPasswordConfirmationVisibility(),
                        icon: controller.store.passwordConfirmationObscure
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                      ),
                    ),
                    validator: (value) => controller.validatePassword(value),
                  ),
                  const SizedBox(height: 40),
                  WallElevatedButton(
                    label: 'Sign Up',
                    width: double.maxFinite,
                    loading: controller.store.loading,
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        controller.register();
                      }
                    },
                  ),
                  const SizedBox(height: 48),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Already have an account?',
                        style: theme.textTheme.bodyText1,
                      ),
                      TextButton(
                        onPressed: () => Modular.to.pushReplacementNamed('/auth/signin'),
                        child: const Text('Sign In'),
                      )
                    ],
                  )
                ],
              );
            }),
          ),
        ),
      ),
    );
  }
}

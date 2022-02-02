import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../../wall_ui/base_components/wall_elevated_button.dart';
import '../../../../../wall_ui/components/wall_theme_mode_switch/wall_theme_mode_switch.dart';
import '../../../../../wall_ui/tokens/wall_colors.dart';
import 'signin_form_controller.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({
    Key? key,
  }) : super(key: key);

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends ModularState<SignInForm, SignInFormController> {
  late ThemeData theme;
  final _formKey = GlobalKey<FormState>();
  @override
  void didChangeDependencies() {
    theme = Theme.of(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        constraints: const BoxConstraints(maxWidth: 400),
        width: MediaQuery.of(context).size.width,
        child: SizedBox(
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
                    'Sign In',
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
                    onChanged: (value) => value.replaceAll(RegExp(r"\s\b|\b\s"), ""),
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
                  const SizedBox(height: 40),
                  WallElevatedButton(
                    width: double.maxFinite,
                    label: 'Sign In',
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        controller.signIn();
                      }
                    },
                    loading: controller.store.loading,
                  ),
                  const SizedBox(height: 48),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Don\'t have an account yet?',
                        style: theme.textTheme.bodyText1,
                      ),
                      TextButton(
                        onPressed: () => Modular.to.pushReplacementNamed('/auth/signup'),
                        child: const Text('Sign Up'),
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

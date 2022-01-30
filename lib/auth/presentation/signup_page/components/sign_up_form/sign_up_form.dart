import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../../../../wall_ui.dart/tokens/wall_colors.dart';
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
          child: Observer(builder: (context) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
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
                            style: theme.textTheme.bodyText1!.copyWith(color: WallColors.neutral50),
                          ),
                        ),
                      ],
                    ),
                  ),
                TextFormField(
                  controller: controller.store.fullNameController,
                  decoration: const InputDecoration(
                    label: Text('Full name'),
                  ),
                ),
                const SizedBox(height: 16),
                TextFormField(
                  controller: controller.store.emailController,
                  decoration: const InputDecoration(
                    label: Text('E-mail'),
                  ),
                ),
                const SizedBox(height: 16),
                Observer(builder: (context) {
                  return TextFormField(
                    controller: controller.store.passwordController,
                    obscureText: controller.store.passwordObscure,
                    decoration: InputDecoration(
                      label: const Text('Password'),
                      suffixIcon: IconButton(
                        onPressed: () => controller.store.setPasswordVisibility(),
                        icon: controller.store.passwordObscure
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 16),
                Observer(builder: (context) {
                  return TextFormField(
                    controller: controller.store.passwordConfirmationController,
                    obscureText: controller.store.passwordConfirmationObscure,
                    decoration: InputDecoration(
                      label: const Text('Password confirmation'),
                      suffixIcon: IconButton(
                        onPressed: () => controller.store.setPasswordConfirmationVisibility(),
                        icon: controller.store.passwordConfirmationObscure
                            ? const Icon(Icons.visibility_off)
                            : const Icon(Icons.visibility),
                      ),
                    ),
                  );
                }),
                const SizedBox(height: 40),
                SizedBox(
                  width: double.maxFinite,
                  child: ElevatedButton(
                    onPressed: controller.store.loading ? null : controller.register,
                    child: controller.store.loading
                        ? const SizedBox(
                            width: 24,
                            height: 24,
                            child: CircularProgressIndicator(),
                          )
                        : Text(
                            'Sign Up'.toUpperCase(),
                          ),
                  ),
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
                      onPressed: () {},
                      child: const Text('Sign In'),
                    )
                  ],
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}

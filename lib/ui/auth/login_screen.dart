// ignore_for_file: deprecated_member_use
import 'package:e_commerce_project/provider/auth_view_model_provider.dart';
import 'package:e_commerce_project/ui/auth/register_page.dart';
import 'package:e_commerce_project/ui/components/loading_layer.dart';
import 'package:e_commerce_project/ui/components/snackbar.dart';
import 'package:e_commerce_project/ui/root.dart';
import 'package:e_commerce_project/utils/lables.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../utils/assets.dart';

// ignore: must_be_immutable
class LoginScreen extends ConsumerWidget {
  LoginScreen({Key? key}) : super(key: key);

  static const String route = "/login_screen";

  final _formkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final style = theme.textTheme;
    final provider = authViewModelProvider;
    final model = ref.read(authViewModelProvider);

    return LoadingLayer(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Center(
                      child: Center(
                        child: Image.asset(
                          Assets.logo,
                          width: 72,
                          height: 72,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Center(
                      child: Text(
                        Lables.welcomeToLafyuu,
                        style: style.bodyLarge,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: Text(
                        Lables.signInToContinue,
                        style: style.caption,
                      ),
                    ),
                    const SizedBox(height: 28),
                    TextFormField(
                      initialValue: model.email,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                        hintText: Lables.yourEmail,
                        prefixIcon: Icon(Icons.email_outlined),
                      ),
                      onChanged: (v) => model.email = v,
                      validator: (v) => model.emailValidate(v!),
                    ),
                    const SizedBox(height: 10),
                    Consumer(
                      builder: (context, ref, child) {
                        ref.watch(
                            provider.select((value) => value.obscurePassword));
                        return TextFormField(
                          initialValue: model.password,
                          obscureText: model.obscurePassword,
                          decoration: InputDecoration(
                            hintText: Lables.password,
                            prefixIcon: const Icon(Icons.lock_outlined),
                            suffixIcon: IconButton(
                              onPressed: () {
                                model.obscurePassword = !model.obscurePassword;
                              },
                              icon: Icon(model.obscurePassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined),
                            ),
                          ),
                          onChanged: (v) => model.password = v,
                        );
                      },
                    ),
                    const SizedBox(height: 16),
                    Consumer(
                      builder: (context, ref, child) {
                        ref.watch(provider);
                        return MaterialButton(
                          color: theme.primaryColor,
                          textColor: Colors.white,
                          onPressed: model.email.isNotEmpty &&
                                  model.password.isNotEmpty
                              ? () async {
                                  if (_formkey.currentState!.validate()) {
                                    try {
                                      await model.login();
                                      Navigator.pushReplacementNamed(
                                          context, Root.route);
                                    } catch (e) {
                                      AppSnackBar(context).error(e);
                                    }
                                  }
                                }
                              : null,
                          child: const Text(Lables.signIn),
                        );
                      },
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        const Expanded(
                          child: Divider(),
                        ),
                        const SizedBox(
                          height: 28,
                        ),
                        Text(Lables.or, style: style.labelLarge),
                        const SizedBox(
                          height: 28,
                        ),
                        const Expanded(
                          child: Divider(),
                        ),
                      ],
                    ),
                    const SizedBox(height: 16),
                    OutlinedButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Image.asset(Assets.google, width: 24, height: 24),
                          const Spacer(),
                          const Text(Lables.loginwithgoogle),
                          const Spacer()
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    OutlinedButton(
                      onPressed: () {},
                      child: Row(
                        children: [
                          Image.asset(Assets.facebook, width: 24, height: 24),
                          const Spacer(),
                          const Text(Lables.loginwithfacebook),
                          const Spacer()
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    TextButton(
                      onPressed: () {},
                      child: const Text(Lables.forgotPassword),
                    ),
                    const SizedBox(height: 8),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: Lables.dontHaveAAccount,
                        style: style.caption,
                        children: [
                          TextSpan(
                            text: Lables.register,
                            style: style.button!.copyWith(
                              color: scheme.primary,
                              fontSize: style.bodyMedium!.fontSize,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  RegisterPage.route,
                                );
                              },
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

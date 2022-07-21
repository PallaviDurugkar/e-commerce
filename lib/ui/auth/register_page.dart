import 'package:e_commerce_project/ui/auth/login_screen.dart';
import 'package:e_commerce_project/ui/components/loading_layer.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../provider/auth_view_model_provider.dart';
import '../../utils/assets.dart';
import '../../utils/lables.dart';
import '../components/snackbar.dart';
import '../root.dart';

class RegisterPage extends ConsumerWidget {
  RegisterPage({Key? key}) : super(key: key);

  static const String route = "/register_page";

  final _formkey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final style = theme.textTheme;
    final provider = authViewModelProvider;
    final model = ref.read(provider);

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
                        Lables.letsGetStarted,
                        style: style.bodyLarge,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Center(
                      child: Text(
                        Lables.createAnNewAccount,
                        style: style.caption,
                      ),
                    ),
                    const SizedBox(height: 28),
                    TextFormField(
                      initialValue: model.fullName,
                      textCapitalization: TextCapitalization.words,
                      decoration: const InputDecoration(
                        hintText: Lables.fullName,
                        prefixIcon: Icon(Icons.person_outline_rounded),
                      ),
                      onChanged: (v) => model.fullName = v,
                    ),
                    const SizedBox(height: 8),
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
                    const SizedBox(height: 8),
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
                    const SizedBox(height: 8),
                    Consumer(
                      builder: (context, ref, child) {
                        ref.watch(provider
                            .select((value) => value.obscureConfirmPassword));
                        return TextFormField(
                          initialValue: model.confirmPassword,
                          obscureText: model.obscureConfirmPassword,
                          decoration: InputDecoration(
                            hintText: Lables.passwordAgain,
                            prefixIcon: const Icon(Icons.lock_outlined),
                            suffixIcon: IconButton(
                              onPressed: () {
                                model.obscureConfirmPassword =
                                    !model.obscureConfirmPassword;
                              },
                              icon: Icon(model.obscureConfirmPassword
                                  ? Icons.visibility_off_outlined
                                  : Icons.visibility_outlined),
                            ),
                          ),
                          onChanged: (v) => model.confirmPassword = v,
                          validator: (v) =>
                              v != model.password ? "Mismatch password" : null,
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
                          onPressed: model.fullName.isNotEmpty &&
                                  model.email.isNotEmpty &&
                                  model.password.isNotEmpty &&
                                  model.confirmPassword.isNotEmpty
                              ? () async {
                                  if (_formkey.currentState!.validate()) {
                                    try {
                                      await model.register();
                                      Navigator.pushReplacementNamed(
                                          context, Root.route);
                                    } catch (e) {
                                      AppSnackBar(context).error(e);
                                    }
                                  }
                                }
                              : null,
                          child: const Text(Lables.signUp),
                        );
                      },
                    ),
                    const SizedBox(height: 24),
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        text: Lables.haveaaccount,
                        style: style.caption,
                        children: [
                          TextSpan(
                            text: Lables.signIn,
                            style: style.button!.copyWith(
                              color: scheme.primary,
                              fontSize: style.bodyMedium!.fontSize,
                            ),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                Navigator.pushReplacementNamed(
                                  context,
                                  Root.route,
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

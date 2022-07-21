import 'package:e_commerce_project/ui/home_page.dart';
import 'package:e_commerce_project/onboarding/onboarding.dart';
import 'package:e_commerce_project/provider/auth_view_model_provider.dart';
import 'package:e_commerce_project/provider/cache_provider.dart';
import 'package:e_commerce_project/ui/auth/email_verify_page.dart';
import 'package:e_commerce_project/ui/auth/login_screen.dart';
import 'package:e_commerce_project/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Root extends ConsumerWidget {
  const Root({Key? key}) : super(key: key);

  static const String route = "/root";

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.read(authViewModelProvider);
    final seen =
        ref.read(cacheProvider).value!.getBool(Constants.seen) ?? false;
    return !seen
        ? const OnBoarding()
        : auth.user != null
            ? auth.user!.emailVerified
                ? const HomePage()
                : const EmailVerifyPage()
            : LoginScreen();
  }
}

import 'package:e_commerce_project/onboarding/onboarding.dart';
import 'package:e_commerce_project/provider/cache_provider.dart';
import 'package:e_commerce_project/ui/root.dart';
import 'package:e_commerce_project/utils/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerStatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  static const String route = "/";

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();
    init();
  }

  void init() async {
    await ref.read(cacheProvider.future);
    await Future.delayed(const Duration(seconds: 1));
    if (!mounted) return;
    Navigator.pushNamedAndRemoveUntil(context, Root.route,(route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      color: theme.primaryColor,
      child: Center(
        child: Image.asset(
          Assets.logowhite,
          height: 72,
          width: 72,
        ),
      ),
    );
  }
}

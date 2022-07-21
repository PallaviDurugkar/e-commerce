import 'package:e_commerce_project/provider/auth_view_model_provider.dart';
import 'package:e_commerce_project/ui/components/snackbar.dart';
import 'package:e_commerce_project/ui/root.dart';
import 'package:e_commerce_project/utils/lables.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class EmailVerifyPage extends ConsumerStatefulWidget {
  const EmailVerifyPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _EmailVerifyPageState();
}

class _EmailVerifyPageState extends ConsumerState<EmailVerifyPage> {
  final provider = authViewModelProvider;

  void onDone() {
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, Root.route);
  }

  @override
  void initState() {
    ref.read(provider).streamCheck(onDone: onDone);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme;
    final model = ref.read(provider);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              await model.logout();
              onDone();
            },
            icon: const Icon(Icons.logout_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Spacer(),
            Text(
              Lables.verifyyouremail,
              style: style.headlineLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 16,
            ),
            Text(
              Lables.verificationEmailLink(model.user!.email!),
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Center(
              child: ElevatedButton(
                onPressed: () async {
                  await model.reload();
                  if (model.user!.emailVerified) {
                    onDone();
                  } else {
                    AppSnackBar(context).error(Lables.emailNotVerifiedYet);
                  }
                },
                child: const Text(Lables.done),
              ),
            ),
            Center(
              child: TextButton(
                onPressed: () async {
                  try {
                    await model.sendEmail();
                    AppSnackBar(context)
                        .message(Lables.verificationEmailResent);
                  } catch (e) {
                    if (kDebugMode) {
                      print(e);
                    }
                  }
                },
                child: const Text(Lables.resend),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

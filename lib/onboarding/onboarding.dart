import 'package:e_commerce_project/provider/cache_provider.dart';
import 'package:e_commerce_project/ui/root.dart';
import 'package:e_commerce_project/utils/assets.dart';
import 'package:e_commerce_project/utils/constants.dart';
import 'package:e_commerce_project/utils/lables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class OnboardingItem {
  final String image;
  final String title;
  final String description;

  const OnboardingItem({
    required this.image,
    required this.title,
    required this.description,
  });
}

class OnBoarding extends HookConsumerWidget {
  const OnBoarding({Key? key}) : super(key: key);

  static const List<OnboardingItem> _items = [
    OnboardingItem(
        image: Assets.onlineGroceries,
        title: Lables.find,
        description: Lables.findYour),
    OnboardingItem(
        image: Assets.ontheWay,
        title: Lables.productDelivery,
        description: Lables.yourProductIsDelivered),
    OnboardingItem(
        image: Assets.onlinePayment,
        title: Lables.easyAndSafePayment,
        description: Lables.payForThe)
  ];

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final scheme = theme.colorScheme;
    final style = theme.textTheme;
    final controller = useTabController(initialLength: _items.length);

    final index = useState(0);

    controller.addListener(() {
      if (index.value != controller.index) {
        index.value = controller.index;
      }
    });

    void done() async {
      ref.read(cacheProvider).value!.setBool(Constants.seen, true);
      Navigator.pushReplacementNamed(context, Root.route);
    }

    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton(
              onPressed: done,
              child: Text('SKIP'),
            ),
            MaterialButton(
              textColor: Colors.white,
              color: scheme.primary,
              onPressed: () {
                if (controller.index < 2) {
                  controller.animateTo(controller.index + 1);
                  index.value++;
                } else {
                  done();
                }
              },
              child: Text(index.value==2?"Done":"NEXT"),
            ),
          ],
        ),
      ),
      bottomSheet: Material(
        color: theme.cardColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              _items.length,
              (i) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: Container(
                  decoration: ShapeDecoration(
                    shape: StadiumBorder(),
                    color: index.value == i
                        ? scheme.tertiary
                        : scheme.tertiaryContainer,
                  ),
                  child: AnimatedSize(
                    duration: const Duration(milliseconds: 500),
                    reverseDuration: const Duration(milliseconds: 500),
                    child: SizedBox(
                      height: 16,
                      width: index.value == i ? 32 : 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
      body: TabBarView(
          controller: controller,
          children: _items
              .map(
                (e) => Padding(
                  padding: const EdgeInsets.all(24),
                  child: Column(
                    children: [
                      Expanded(
                        flex: 32,
                        child: Image.asset(e.image),
                      ),
                      Text(
                        e.title,
                        style: style.headlineMedium,
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(),
                      Text(
                        e.description,
                        style: style.titleLarge,
                        textAlign: TextAlign.center,
                      ),
                      const Spacer(flex: 4),
                    ],
                  ),
                ),
              )
              .toList()),
    );
  }
}

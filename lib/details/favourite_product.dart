import 'package:flutter/material.dart';

import '../utils/lables.dart';

class FavouriteProduct extends StatelessWidget {
  const FavouriteProduct({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 40),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back_ios_outlined),
          ),
          title: const Text(Lables.favoriteproduct),
        ),
        body: Column(
          children: const [],
        ),
      ),
    );
  }
}

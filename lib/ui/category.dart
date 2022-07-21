import 'package:e_commerce_project/utils/lables.dart';
import 'package:flutter/material.dart';

List<String> ctgName = [
  'Shirt',
  'Bikani',
  'Dress',
  'Work Equipemt',
  'Man Pants',
  'Man Shoes',
  'Man Underwear',
  'Man T-Shirt',
  'Woman Bag',
  'Woman Pants',
  'High Heels',
  'Woman T-Shirt',
  'Skirt',
];

List subimages = [
  "assets/group.png",
  "assets/bikini.png",
  "assets/dress.png",
  "assets/manbag.png",
  "assets/manpants.png",
  "assets/manshoes.png",
  "assets/manunderwear.png",
  "assets/skirt.png",
  "assets/womanbag.png",
  "assets/womanpants.png",
  "assets/womanshoes.png",
  "assets/womantshirt.png",
  "assets/skirt.png"
];

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

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
          title: const Text(Lables.category),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 12),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.all(0),
                itemCount: ctgName.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 16, top: 10),
                    child: ListTile(
                      leading: Image.asset(
                        subimages[index],
                        height: 22,
                        width: 22,
                        alignment: Alignment.centerLeft,
                      ),
                      title: Text(
                        ctgName[index],
                      ),
                    ),
                  );
                },
              ),
              const SizedBox(width: 16),
            ],
          ),
        ),
      ),
    );
  }
}

import 'package:e_commerce_project/details/favourite_product.dart';
import 'package:e_commerce_project/provider/auth_view_model_provider.dart';
import 'package:e_commerce_project/ui/cart_page.dart';
import 'package:e_commerce_project/ui/category.dart';
import 'package:e_commerce_project/details/product_page.dart';
import 'package:e_commerce_project/ui/root.dart';
import 'package:e_commerce_project/utils/assets.dart';
import 'package:e_commerce_project/utils/lables.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

List ctgName = [
  'Shirt',
  'Bikani',
  'Dress',
  'Work Equipemt',
  'Man Pants',
  'Man Shoes',
  'Man Underwear',
  'Man T-Shirt',
  // 'Woman Bag',
  // 'Woman Pants',
  // 'High Heels',
  // 'Woman T-Shirt',
  // 'Skirt',
];

List<String> images = [
  "assets/image_product.png",
  "assets/pimage5.png",
  "assets/product.png",
  "assets/pimage_1.png",
  "assets/pimage8.png",
  "assets/pimage7.png",
];

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final theme = Theme.of(context);
    final style = theme.textTheme;
    return Scaffold(
      appBar: AppBar(
        title: TextFormField(
          decoration: const InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: Lables.searchproduct,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_outline),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
          IconButton(
            onPressed: () async {
              await ref.read(authViewModelProvider).logout();
              Navigator.pushReplacementNamed(context, Root.route);
            },
            icon: const Icon(Icons.logout_outlined),
          )
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          AspectRatio(
            aspectRatio: 1.7,
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    Assets.offerBanner,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              5,
              (index) => const Padding(
                padding: EdgeInsets.all(4),
                child: CircleAvatar(
                  radius: 4,
                  backgroundColor: Color(0xFFEBF0FF),
                ),
              ),
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  Lables.category,
                  style: style.bodyLarge,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8),
                child: TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                      isScrollControlled: true,
                      context: context,
                      builder: (context) => const Category(),
                    );
                  },
                  child: const Text(Lables.morecategory),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          GridView.count(
            primary: false,
            childAspectRatio: 1.1,
            shrinkWrap: true,
            crossAxisSpacing: 8,
            mainAxisSpacing: 10,
            crossAxisCount: 4,
            children: List.generate(
              7,
              (index) {
                return GestureDetector(
                  onTap: () {},
                  child: Column(
                    children: [
                      const CircleAvatar(
                        radius: 25,
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Flexible(
                        child: Text(ctgName[index]),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  Lables.flashsale,
                  style: style.bodyLarge,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(),
                child: TextButton(
                  onPressed: () {
                    showModalBottomSheet(
                        isScrollControlled: true,
                        context: context,
                        builder: (context) => const FavouriteProduct());
                  },
                  child: const Text(Lables.seemore),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                6,
                (index) => Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: SizedBox(
                        width: 141,
                        height: 238,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ProductPage(),
                              ),
                            );
                          },
                          child: Card(
                            color: Color(0xFFFFFFFF),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                    left: 16,
                                    right: 16,
                                    top: 16,
                                    bottom: 8,
                                  ),
                                  child: Container(
                                    width: 109,
                                    height: 109,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                          images[index],
                                        ),
                                      ),
                                      color: Color(0xFFF6F6F6),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                ),
                                Column(
                                  children: [
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 25, right: 16),
                                      child: Text(
                                        'FS - Nike Air Max 270 React...',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 20, right: 60),
                                      child: Text(
                                        "\$299,43",
                                        style: TextStyle(
                                            color: Colors.lightBlueAccent,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    SizedBox(height: 4),
                                    Padding(
                                      padding: const EdgeInsets.all(6),
                                      child: Row(
                                        children: <Widget>[
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(left: 16),
                                            child: Text(
                                              "\$534,33",
                                              style: TextStyle(
                                                  color: Colors.grey.shade500),
                                            ),
                                          ),
                                          const Padding(
                                            padding:
                                                EdgeInsets.only(right: 10.0),
                                          ),
                                          Text(
                                            "24% Off",
                                            style: TextStyle(
                                                color: theme.colorScheme.error,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  Lables.megasale,
                  style: style.bodyLarge,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: TextButton(
                  onPressed: () {},
                  child: const Text(Lables.seemore),
                ),
              ),
            ],
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                6,
                (index) => Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(4),
                      child: SizedBox(
                        width: 141,
                        height: 238,
                        child: Card(
                          color: Color(0xFFFFFFFF),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 16, right: 16, top: 16, bottom: 8),
                                child: Container(
                                  width: 109,
                                  height: 109,
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                        images[index],
                                      ),
                                    ),
                                    color: Color(0xFFF6F6F6),
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                              Column(
                                children: [
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 25, right: 16),
                                    child: Text(
                                      'FS - Nike Air Max 270 React...',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(height: 10),
                                  const Padding(
                                    padding:
                                        EdgeInsets.only(left: 20, right: 60),
                                    child: Text(
                                      "\$299,43",
                                      style: TextStyle(
                                          color: Colors.lightBlueAccent,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Padding(
                                    padding: const EdgeInsets.all(6),
                                    child: Row(
                                      children: <Widget>[
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 16),
                                          child: Text(
                                            "\$534,33",
                                            style: TextStyle(
                                                color: Colors.grey.shade500),
                                          ),
                                        ),
                                        const Padding(
                                          padding: EdgeInsets.only(right: 10.0),
                                        ),
                                        Text(
                                          "24% Off",
                                          style: TextStyle(
                                              color: theme.colorScheme.error,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 9),
          Column(
            children: [
              AspectRatio(
                aspectRatio: 2,
                child: Container(
                  height: 206,
                  width: 343,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      image: AssetImage(Assets.productBanner),
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  width: 150,
                  height: 280,
                  // margin: EdgeInsets.all(8),
                  // margin: const EdgeInsets.only(left: 18),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          "assets/pimage_1.png",
                          width: 120,
                          height: 120,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(6),
                        child: Text(
                          "Nike Air Max 270\nReact ENG",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: List.generate(
                          5,
                          (index) => const Padding(
                            padding: EdgeInsets.only(),
                            child: Icon(
                              Icons.star_outlined,
                              color: Colors.amber,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const SizedBox(
                        height: 18,
                        child: Text(
                          "\$299,43",
                          style: TextStyle(
                              color: Color(0xFF40BFFF),
                              fontWeight: FontWeight.bold,
                              height: 1.8,
                              letterSpacing: 0.5),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: const [
                          SizedBox(
                            height: 14,
                            child: Text(
                              "\$534,33",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                height: 1.5,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          SizedBox(width: 40),
                          Text(
                            "24% Off",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                              letterSpacing: 0.5,
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: Container(
                  width: 150,
                  height: 280,
                  // margin: EdgeInsets.all(8),
                  // margin: const EdgeInsets.only(left: 18),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          "assets/pimage7.png",
                          width: 120,
                          height: 120,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(6),
                        child: Text(
                          "Nike Air Max 270\nReact ENG",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: List.generate(
                          5,
                          (index) => const Padding(
                            padding: EdgeInsets.only(),
                            child: Icon(
                              Icons.star_outlined,
                              color: Colors.amber,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const SizedBox(
                        height: 18,
                        child: Text(
                          "\$299,43",
                          style: TextStyle(
                              color: Color(0xFF40BFFF),
                              fontWeight: FontWeight.bold,
                              height: 1.8,
                              letterSpacing: 0.5),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: const [
                          SizedBox(
                            height: 14,
                            child: Text(
                              "\$534,33",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                height: 1.5,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          SizedBox(width: 40),
                          Text(
                            "24% Off",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                              letterSpacing: 0.5,
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  width: 150,
                  height: 280,
                  // margin: EdgeInsets.all(8),
                  // margin: const EdgeInsets.only(left: 18),
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          "assets/pimage8.png",
                          width: 120,
                          height: 120,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(6),
                        child: Text(
                          "Nike Air Max 270\nReact ENG",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: List.generate(
                          5,
                          (index) => const Padding(
                            padding: EdgeInsets.only(),
                            child: Icon(
                              Icons.star_outlined,
                              color: Colors.amber,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const SizedBox(
                        height: 18,
                        child: Text(
                          "\$299,43",
                          style: TextStyle(
                              color: Color(0xFF40BFFF),
                              fontWeight: FontWeight.bold,
                              height: 1.8,
                              letterSpacing: 0.5),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: const [
                          SizedBox(
                            height: 14,
                            child: Text(
                              "\$534,33",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                height: 1.5,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          SizedBox(width: 40),
                          Text(
                            "24% Off",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                              letterSpacing: 0.5,
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Container(
                  width: 150,
                  height: 280,
                  // margin: EdgeInsets.all(8),
                  // margin: const EdgeInsets.only(left: 18),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          "assets/pimage6.png",
                          width: 120,
                          height: 120,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      const Padding(
                        padding: EdgeInsets.all(6),
                        child: Text(
                          "Nike Air Max 270\nReact ENG",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            height: 1.2,
                            letterSpacing: 0.5,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: List.generate(
                          5,
                          (index) => const Padding(
                            padding: EdgeInsets.only(),
                            child: Icon(
                              Icons.star_outlined,
                              color: Colors.amber,
                              size: 18,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const SizedBox(
                        height: 18,
                        child: Text(
                          "\$299,43",
                          style: TextStyle(
                              color: Color(0xFF40BFFF),
                              fontWeight: FontWeight.bold,
                              height: 1.8,
                              letterSpacing: 0.5),
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Row(
                        children: const [
                          SizedBox(
                            height: 14,
                            child: Text(
                              "\$534,33",
                              style: TextStyle(
                                color: Colors.grey,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                height: 1.5,
                                letterSpacing: 0.5,
                              ),
                            ),
                          ),
                          SizedBox(width: 40),
                          Text(
                            "24% Off",
                            style: TextStyle(
                              color: Colors.red,
                              fontSize: 12,
                              fontWeight: FontWeight.bold,
                              height: 1.5,
                              letterSpacing: 0.5,
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => CartPage(),
            ),
          );
        },
        currentIndex: 0,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: 'Home',
            backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_outlined),
            label: 'Explore',
            backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart_outlined),
            label: 'Cart',
            backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_offer_outlined),
            label: 'Offer',
            backgroundColor: Colors.blueAccent,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outlined),
            label: 'Account',
            backgroundColor: Colors.blueAccent,
          ),
        ],
      ),
    );
  }
}

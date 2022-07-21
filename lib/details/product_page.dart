import 'package:e_commerce_project/utils/assets.dart';
import 'package:e_commerce_project/utils/lables.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ProductPage extends StatelessWidget {
  ProductPage({Key? key}) : super(key: key);

  List<String> images = [
    "assets/image_product.png",
    "assets/pimage5.png",
    "assets/product.png",
    "assets/pimage_1.png",
    "assets/pimage7.png"
  ];

  List size = ['6', '6.5', '7', '7.5', '8', '8.5'];

  List colors = [
    Colors.amberAccent.shade700,
    Colors.lightBlueAccent,
    Colors.red.shade300,
    Colors.teal.shade400,
    Colors.blue,
    const Color.fromARGB(255, 4, 42, 108),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios_outlined),
        ),
        title: Text(
          Lables.nikeairmax270rea,
          style: style.titleLarge,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.search_outlined,
              color: Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.more_vert_outlined,
              color: Colors.grey,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 8, right: 8),
        child: Column(
          children: [
            SizedBox(
              width: 375,
              height: 238,
              child: Image.asset(
                Assets.product,
              ),
            ),
            const SizedBox(height: 40),
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
            const SizedBox(height: 10),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
                  child: Text(
                    Lables.nikeairzoompegasus36,
                    style: style.titleLarge,
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: IconButton(
                        alignment: Alignment.topRight,
                        onPressed: () {},
                        icon: const Icon(Icons.favorite_outline),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    Lables.miami,
                    style: style.titleLarge,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                  5,
                  (index) => const Padding(
                    padding: EdgeInsets.only(),
                    child: Icon(
                      Icons.star_outlined,
                      color: Colors.amber,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30),
                  child: Text(
                    '\$299,43',
                    style: TextStyle(
                      fontSize: 20,
                      color: theme.primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 9),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      Lables.selectSize,
                      style: style.titleLarge,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  6,
                  (index) => Padding(
                    padding: const EdgeInsets.only(left: 16, right: 9),
                    child: CircleAvatar(
                      radius: 25,
                      backgroundColor: Colors.white60,
                      child: Text(
                        size[index],
                        style: const TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 9),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      Lables.selectColor,
                      style: style.titleLarge,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  6,
                  (index) => Padding(
                    padding: const EdgeInsets.only(left: 16, right: 9),
                    child: CircleAvatar(
                      backgroundColor: colors[index],
                      // child: CircleAvatar(
                      //   radius: 6,
                      //   backgroundColor: Colors.white,
                      // ),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 9),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      Lables.specification,
                      style: style.titleLarge,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Container(
              margin: const EdgeInsets.only(top: 12, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(
                    child: Text(
                      Lables.shown,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "Laser\nBlue/Anthracite/Watermel\non/White",
                    style: TextStyle(
                      height: 1.5,
                      color: Color(0xFF9098B1),
                    ),
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              margin: const EdgeInsets.only(top: 12, left: 16, right: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Expanded(
                    child: Text(
                      Lables.style,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Text(
                    "CD0113-400",
                    style: TextStyle(
                      height: 1.5,
                      color: Color(0xFF9098B1),
                    ),
                    textAlign: TextAlign.end,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.only(
                top: 16,
                left: 16,
                right: 16,
              ),
              child: const Text(
                "The Nike Air Max 270 React ENG combines a full-length React foam midsole with a 270 Max Air unit for unrivaled comfort and a striking visual experience.",
                style: TextStyle(
                  fontWeight: FontWeight.w400,
                  height: 1.5,
                  color: Color(0xFF9098B1),
                ),
              ),
            ),
            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(right: 16, left: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      "Review Product",
                      style: style.bodyLarge,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(Lables.seemore),
                  )
                ],
              ),
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 4),
                  child: Row(
                    children: List.generate(
                      5,
                      (index) => const Padding(
                        padding: EdgeInsets.only(),
                        child: Icon(
                          Icons.star_outlined,
                          color: Colors.amber,
                          size: 20,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 8,
                ),
                const Text(
                  "4.5",
                  style: TextStyle(
                    color: Color(0xFF9098B1),
                  ),
                ),
                const SizedBox(width: 5),
                const Text(
                  "(5 Review)",
                  style: TextStyle(
                    color: Color(0xFF9098B1),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 16, right: 8),
                  child: CircleAvatar(
                    radius: 25,
                    backgroundColor: Color(0xFFffcdd2),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "James Lawson",
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 16),
                      ),
                      const SizedBox(height: 4),
                      Row(
                        children: List.generate(
                          5,
                          (index) => const Padding(
                            padding: EdgeInsets.only(),
                            child: Icon(
                              Icons.star_outlined,
                              color: Colors.amber,
                              size: 20,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.only(
                right: 16,
                left: 16,
              ),
              child: const Text(
                "air max are always very comfortable fit, clean and just perfect in every way. just the box was too small and scrunched the sneakers up a little bit, not sure if the box was always this small but the 90s are and will always be one of my favorites.",
                style: TextStyle(
                  color: Color(0xFF9098B1),
                  fontSize: 15,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              children: [
                Container(
                  margin: const EdgeInsets.only(left: 16, right: 8),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage(Assets.pimage2)),
                    color: const Color(0xFFF6F6F6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage(Assets.pimage3),
                    ),
                    color: const Color(0xFFF6F6F6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                const SizedBox(width: 8),
                Container(
                  margin: const EdgeInsets.only(right: 8),
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage(Assets.pimage4),
                    ),
                    color: const Color(0xFFF6F6F6),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              children: const [
                Padding(
                  padding: EdgeInsets.only(left: 16, right: 8),
                  child: Text(
                    "December 10, 2016",
                    style: TextStyle(
                      color: Color(0xFF9098B1),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 23),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    "You Might Also Like",
                    style: style.titleLarge,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 12),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: List.generate(
                  5,
                  (index) => Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(4),
                        child: SizedBox(
                          width: 141,
                          height: 238,
                          child: GestureDetector(
                            onTap: () {},
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
                                        bottom: 8),
                                    child: Container(
                                      width: 109,
                                      height: 109,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: AssetImage(images[index])),
                                        color: const Color(0xFFF6F6F6),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            left: 25, right: 16),
                                        child: Text(
                                          'FS - Nike Air Max 270 React...',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const SizedBox(height: 10),
                                      const Padding(
                                        padding: EdgeInsets.only(
                                            left: 20, right: 60),
                                        child: Text(
                                          "\$299,43",
                                          style: TextStyle(
                                              color: Colors.lightBlueAccent,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      Padding(
                                        padding: const EdgeInsets.all(6),
                                        child: Row(
                                          children: <Widget>[
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 16),
                                              child: Text(
                                                "\$534,33",
                                                style: TextStyle(
                                                    color:
                                                        Colors.grey.shade500),
                                              ),
                                            ),
                                            const Padding(
                                              padding:
                                                  EdgeInsets.only(right: 10.0),
                                            ),
                                            Text(
                                              "24% Off",
                                              style: TextStyle(
                                                  color:
                                                      theme.colorScheme.error,
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
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: MaterialButton(
                      padding: const EdgeInsets.all(16),
                      color: theme.primaryColor,
                      textColor: Colors.white,
                      onPressed: () {},
                      child: const Text('Add To Cart'),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:e_commerce_project/utils/lables.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CartPage extends StatelessWidget {
  CartPage({Key? key}) : super(key: key);

  List<String> images = [
    "assets/pimage_1.png",
    "assets/product.png",
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final style = theme.textTheme;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            Lables.yourcart,
            style: style.titleLarge,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListView.builder(
                itemBuilder: (context, index) {
                  return Card(
                    child: SizedBox(
                      height: 90,
                      child: ListTile(
                        leading: SizedBox(
                          width: 85,
                          child: Container(
                            margin: const EdgeInsets.only(top: 8),
                            height: 72,
                            width: 72,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: const Color(0xFFF6F6F6),
                              image: DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: AssetImage(images[index]),
                              ),
                            ),
                          ),
                        ),
                        title: const SizedBox(
                          height: 40,
                          child: Text(
                            'Nike Air Zoom Pegasus 36 Miami',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ),
                        subtitle: const Text(
                          '\$299,43',
                          style: TextStyle(
                              color: Color(0xFF40BFFF),
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                },
                shrinkWrap: true,
                itemCount: images.length,
                padding: const EdgeInsets.only(left: 16, right: 10, top: 10),
                scrollDirection: Axis.vertical,
              ),
              const SizedBox(height: 32),
              Container(
                margin: const EdgeInsets.only(left: 16),
                width: 343,
                height: 56,
                padding: const EdgeInsets.all(0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    SizedBox(
                      width: (MediaQuery.of(context).size.width - 32) * 0.73,
                      child: const TextField(
                        // controller: couponController,
                        autofocus: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: 'Enter Coupon Code',
                          hintStyle: TextStyle(color: Color(0xFF9098B1)),
                          // isDense: true,
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF9098B1)),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                            ),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Color(0xFF40BFFF)),
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              bottomLeft: Radius.circular(5),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: GestureDetector(
                          child: Container(
                            width: 87,
                            height: 56,
                            decoration: BoxDecoration(
                              color: theme.primaryColor,
                              borderRadius: const BorderRadius.all(
                                Radius.circular(5),
                              ),
                            ),
                            child: const Center(
                              child: Text(
                                'Apply',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Container(
                        margin: const EdgeInsets.all(8),
                        padding: const EdgeInsets.all(8),
                        width: 343,
                        height: 164,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                            color: const Color(0xFFEBF0FF),
                          ),
                        ),
                        child: Column(
                          children: [
                            Row(
                              children: const [
                                Text(
                                  "Items (3)",
                                  style: TextStyle(
                                    height: 1.8,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF9098B1),
                                  ),
                                ),
                                Expanded(child: SizedBox()),
                                Text(
                                  "\$598.86",
                                  style: TextStyle(
                                    height: 1.8,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: const [
                                Text(
                                  "Shipping",
                                  style: TextStyle(
                                    height: 1.8,
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF9098B1),
                                  ),
                                ),
                                Expanded(child: SizedBox()),
                                Text(
                                  "\$40.00",
                                  style: TextStyle(
                                    height: 1.8,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: const [
                                Text(
                                  "Import charges",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Color(0xFF9098B1),
                                    height: 1.8,
                                  ),
                                ),
                                Expanded(child: SizedBox()),
                                Text(
                                  "\$128.00",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Colors.black,
                                    height: 1.8,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 12),
                            const Divider(
                              height: 1,
                              thickness: 1,
                            ),
                            const SizedBox(height: 12),
                            Row(
                              children: [
                                const Expanded(
                                  child: Text(
                                    "Total Price",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w700,
                                      height: 1.5,
                                    ),
                                  ),
                                ),
                                Text(
                                  "\$766.86",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: theme.primaryColor,
                                    height: 1.8,
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
              const SizedBox(height: 8),
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
                        child: const Text('Check Out'),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
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

import 'package:dummy_store/constants/app_theme.dart';
import 'package:dummy_store/models/product_model.dart';
import 'package:dummy_store/providers/cart_provider.dart';
import 'package:dummy_store/services/product_api.dart';
import 'package:badges/badges.dart' as badges;
import 'package:dummy_store/views/cart_screen/cart_screen.dart';
import 'package:dummy_store/views/home_screen/shimmer/product_tile_shimmer.dart';
import 'package:dummy_store/views/home_screen/widgets/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List categories = [
    "All",
    "Electronics",
    "Jewelery",
    "Men's Clothing",
    "Women's Clothing",
  ];

  int selectedIndex = 0;
  late Future<ProductList> productListFuture;

  @override
  void initState() {
    productListFuture = ProductController().getProductData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      maintainBottomViewPadding: true,
      bottom: true,
      child: Scaffold(
        backgroundColor: Colors.grey.shade50,
        body: Container(
          width: MediaQuery.of(context).size.width,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    const Text(
                      'Discover',
                      style: AppTheme.f30wbold,
                    ),
                    const Spacer(),
                    badges.Badge(
                      badgeAnimation: const badges.BadgeAnimation.fade(),
                      badgeContent: Text(
                        '${context.watch<CartProvider>().cartItems.length}',
                        style: AppTheme.f12w400.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w600),
                      ),
                      child: const Icon(
                        Icons.shopping_bag_outlined,
                        color: Colors.black,
                        size: 25,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Search anything',
                          hintStyle: AppTheme.f14w400,
                          contentPadding: EdgeInsets.zero,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(8),
                              borderSide: BorderSide.none),
                          filled: true,
                          fillColor: Colors.grey.shade200,
                          prefixIcon: const Icon(
                            Icons.search_outlined,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Container(
                      width: 40,
                      height: 40,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: Colors.black87),
                      child: const Icon(
                        Icons.filter_list_sharp,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 40,
                  child: ListView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: categories.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                            },
                            child: Chip(
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8)),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 6, vertical: 10),
                                backgroundColor: selectedIndex == index
                                    ? Colors.black87
                                    : Colors.grey.shade200,
                                label: Text(
                                  categories[index],
                                  style: selectedIndex == index
                                      ? AppTheme.f14w400
                                          .copyWith(color: Colors.white)
                                      : AppTheme.f14w400,
                                )),
                          ),
                        );
                      }),
                ),
                const SizedBox(
                  height: 20,
                ),
                FutureBuilder(
                  future: productListFuture,
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const ProductTileShimmer();
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    } else {
                      return ProductTile(
                        productList: snapshot.data!.productList,
                      );
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

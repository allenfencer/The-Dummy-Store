import 'package:dummy_store/providers/cart_provider.dart';
import 'package:dummy_store/views/cart_screen/widget/cart_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../constants/app_theme.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Cart',
                  style: AppTheme.f30wbold,
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: context.watch<CartProvider>().cartItems.length,
                  itemBuilder: (contexxt, index) {
                    return CartCard(
                      index: index,
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:dummy_store/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../constants/app_theme.dart';

class CartCard extends StatelessWidget {
  final int index;
  const CartCard({
    super.key,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            clipBehavior: Clip.antiAlias,
            height: 100,
            width: 100,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Image.network(
              context.read<CartProvider>().cartItems[index].imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              height: 100,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.shade100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    context.read<CartProvider>().cartItems[index].productName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTheme.f14wbold,
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      GestureDetector(
                        onTap: () {
                          final item =
                              context.read<CartProvider>().cartItems[index];
                          context.read<CartProvider>().decrementItemCount(item);
                          print(item.quantity);
                        },
                        child: functionButton(
                          icon: Icons.remove,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        '${context.watch<CartProvider>().cartItems[index].quantity}',
                        style: AppTheme.f30wbold,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      GestureDetector(
                        onTap: () {
                          final item =
                              context.read<CartProvider>().cartItems[index];
                          context.read<CartProvider>().incrementItemCount(item);
                          print(item.quantity);
                        },
                        child: functionButton(
                          icon: Icons.add,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          GestureDetector(
            onTap: () {
              final item = context.read<CartProvider>().cartItems[index];
              context.read<CartProvider>().removeItemFromCart(item);
            },
            child: Container(
                height: 100,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade100),
                child: const Icon(
                  Icons.delete,
                  color: Colors.deepOrange,
                )),
          ),
        ],
      ),
    );
  }
}

Widget functionButton({required IconData icon}) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8), color: Colors.grey.shade300),
    padding: const EdgeInsets.all(5),
    child: Icon(
      icon,
      size: 22,
    ),
  );
}

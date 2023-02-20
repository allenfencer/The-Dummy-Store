import 'package:dummy_store/constants/app_theme.dart';
import 'package:dummy_store/models/cart_model.dart';
import 'package:dummy_store/models/product_model.dart';
import 'package:dummy_store/providers/cart_provider.dart';
import 'package:dummy_store/providers/favourite_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductTile extends StatelessWidget {
  final List<ProductModel> productList;
  const ProductTile({super.key, required this.productList});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: productList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 20,
        crossAxisSpacing: 10,
        childAspectRatio: 1 / 1.55,
      ),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.grey.shade200,
              borderRadius: BorderRadius.circular(8)),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    clipBehavior: Clip.antiAlias,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Image.network(
                      productList[index].imageUrl,
                      fit: BoxFit.cover,
                      width: double.maxFinite,
                      color: Colors.black45,
                      colorBlendMode: BlendMode.darken,
                      height: 140,
                    ),
                  ),
                  Positioned(
                    right: 10,
                    top: 10,
                    child: InkWell(
                      onTap: () {
                        context
                            .read<FavouriteProvider>()
                            .addItemToFavourites(productList[index]);
                      },
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color:context.watch<FavouriteProvider>().isFavourited ? Colors.black87 : Colors.white),
                        child: Icon(
                          context.watch<FavouriteProvider>().isFavourited
                              ? Icons.favorite
                              : Icons.favorite_border,
                          size: 22,
                          color: context.watch<FavouriteProvider>().isFavourited ? Colors.red : null,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              const Spacer(),
              SizedBox(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        productList[index].title,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppTheme.f14wbold,
                      ),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    GestureDetector(
                      onTap: () {
                        final cartItem = CartItemModel(
                            prodId: productList[index].id,
                            price: productList[index].price,
                            productName: productList[index].title,
                            imageUrl: productList[index].imageUrl,
                            description: productList[index].description);
                        context.read<CartProvider>().addItemToCart(cartItem);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.black87),
                        child: Text(
                          'Add To Cart',
                          textAlign: TextAlign.justify,
                          style: AppTheme.f14w400.copyWith(
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}

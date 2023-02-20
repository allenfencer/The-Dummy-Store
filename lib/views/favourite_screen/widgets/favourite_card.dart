import 'package:dummy_store/constants/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/favourite_provider.dart';

class FavouriteCard extends StatelessWidget {
  final int index;
  const FavouriteCard({super.key, required this.index});

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
            height: 80,
            width: 80,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
            child: Image.network(
              context.read<FavouriteProvider>().favList[index].imageUrl,
              fit: BoxFit.cover,
              color: Colors.black45,
              colorBlendMode: BlendMode.darken,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Container(
              height: 80,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Colors.grey.shade100),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.read<FavouriteProvider>().favList[index].title,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: AppTheme.f14wbold,
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    context
                        .read<FavouriteProvider>()
                        .favList[index]
                        .description,
                    overflow: TextOverflow.ellipsis,
                    style: AppTheme.f12w400,
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
              final item = context.read<FavouriteProvider>().favList[index];
              context.read<FavouriteProvider>().removeItemFromFavourites(item);
            },
            child: Container(
                height: 80,
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 12),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.grey.shade100),
                child: const Icon(
                  Icons.close,
                  color: Colors.deepOrange,
                )),
          ),
        ],
      ),
    );
  }
}

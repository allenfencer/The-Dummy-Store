import 'package:dummy_store/constants/app_theme.dart';
import 'package:dummy_store/providers/favourite_provider.dart';
import 'package:dummy_store/views/favourite_screen/widgets/favourite_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

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
                  'Favourites',
                  style: AppTheme.f30wbold,
                ),
                const SizedBox(
                  height: 20,
                ),
                ListView.builder(
                    shrinkWrap: true,
                    itemCount:
                        context.watch<FavouriteProvider>().favList.length,
                    itemBuilder: (context, index) {
                      return FavouriteCard(
                        index: index,
                      );
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

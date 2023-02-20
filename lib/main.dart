import 'package:dummy_store/providers/cart_provider.dart';
import 'package:dummy_store/providers/favourite_provider.dart';
import 'package:dummy_store/views/home_screen/home_screen.dart';
import 'package:dummy_store/views/root_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => CartProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => FavouriteProvider(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'The Dummy Store',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Raleway'),
      home: const RootPage(),
    );
  }
}

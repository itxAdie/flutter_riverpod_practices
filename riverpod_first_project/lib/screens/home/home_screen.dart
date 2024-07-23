import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:riverpod_first_project/providers/product_provider.dart';

import '../../providers/product_provider.dart';
import '../../shared/cart_icon.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProducts = ref.watch(productsProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Simple Shop with Riverpod'),
        actions: const [CartIcon()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: GridView.builder(
          itemCount: allProducts.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 20,
            crossAxisSpacing: 20,
            childAspectRatio: 0.9,
          ),
          itemBuilder: (context, index) {
            return Container(
              padding: const EdgeInsets.all(20),
              color: Colors.blueGrey.withOpacity(0.05),
              child: Column(
                children: [
                  Image.asset(
                    allProducts[index].image,
                    height: 80,
                    width: 80,
                  ),
                  Text(
                    allProducts[index].title,
                  ),
                  Text(
                    'Rs ${allProducts[index].price.toString()}',
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

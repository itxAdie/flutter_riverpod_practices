import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/cart_provider.dart';
import '../../providers/product_provider.dart';
import '../../shared/cart_icon.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final allProducts = ref.watch(productsProvider);
    final cartProducts = ref.watch(cartNotifierProvider);
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
              // height: MediaQuery.sizeOf(context).height * 0.40,
              padding: const EdgeInsets.all(10),
              color: Colors.blueGrey.withOpacity(0.05),
              child: Column(
                children: [
                  Image.asset(
                    allProducts[index].image,
                    height: 60,
                    width: 60,
                  ),
                  Text(
                    allProducts[index].title,
                  ),
                  Text(
                    'Rs ${allProducts[index].price.toString()}',
                  ),
                  const SizedBox(
                    height: 5,
                  ),

                  ///Add or Remove Logic
                  if (cartProducts.contains(allProducts[index]))
                    TextButton(
                      onPressed: () {},
                      child: const Text('Remove'),
                    ),
                  if (!cartProducts.contains(allProducts[index]))
                    TextButton(
                      onPressed: () {},
                      child: const Text('Add to Cart'),
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

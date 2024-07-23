import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../providers/cart_provider.dart';

class CartScreen extends ConsumerStatefulWidget {
  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  bool showCoupon = true;

  @override
  Widget build(BuildContext context) {
    final cartProducts = ref.watch(cartNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Cart'),
        centerTitle: true,
        // actions: [],
      ),
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Column(
                children: cartProducts.map((products) {
              return Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Row(
                  children: [
                    Image.asset(
                      products.image,
                      height: 80,
                      width: 80,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      '${products.title}...',
                    ),
                    const Expanded(child: SizedBox()),
                    Text(
                      'Rs ${products.price.toString()}',
                    ),
                  ],
                ),
              );
            }).toList() // output cart products here
                ),

            // output totals here
          ],
        ),
      ),
    );
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/product.dart';

class CartNotifier extends Notifier<Set<Product>> {
  @override
  Set<Product> build() {
    return {
      const Product(
        id: '6',
        title: 'Blue Suitcase',
        price: 440,
        image: 'products/suitcase.png',
      ),
    };
  }
}

final cartNotifierProvider = NotifierProvider<CartNotifier, Set<Product>>(() {
  return CartNotifier();
});

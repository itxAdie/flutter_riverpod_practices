import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../models/product.dart';
part 'product_provider.g.dart';

const List<Product> allProducts = [
  Product(
    id: '1',
    title: 'Groovy Shorts',
    price: 120,
    image: 'products/shorts.png',
  ),
  Product(
    id: '2',
    title: 'Karati Kit',
    price: 340,
    image: 'products/karati.png',
  ),
  Product(
    id: '3',
    title: 'Denim Jeans',
    price: 540,
    image: 'products/jeans.png',
  ),
  Product(
    id: '4',
    title: 'Red Backpack',
    price: 140,
    image: 'products/backpack.png',
  ),
  Product(
    id: '5',
    title: 'Drum & Sticks',
    price: 290,
    image: 'products/drum.png',
  ),
  Product(
    id: '6',
    title: 'Blue Suitcase',
    price: 440,
    image: 'products/suitcase.png',
  ),
  Product(
    id: '7',
    title: 'Roller Skates',
    price: 520,
    image: 'products/skates.png',
  ),
  Product(
    id: '8',
    title: 'Electric Guitar',
    price: 790,
    image: 'products/guitar.png',
  ),
];

// final productProvider = Provider((ref) {
//   return allProducts;
// });

// final reducedProductProvider = Provider((ref) {
//   return allProducts.where((p) => p.price < 500).toList();
// });

@riverpod
List<Product> products(ref) {
  return allProducts;
}

@riverpod
List<Product> cartProducts(ref) {
  return allProducts.where((p) => p.price < 500).toList();
}

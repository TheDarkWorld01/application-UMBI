// shopping_cart.dart
import 'shopping_cart_item.dart';

class ShoppingCart {
  static List<ShoppingCartItem> cartItems = []; // Daftar item keranjang

  // Metode untuk menambahkan item ke keranjang
  static void addItemToCart(ShoppingCartItem item) {
    cartItems.add(item);
  }

  // Metode untuk menghapus item dari keranjang berdasarkan ID
  static void removeItemFromCart(int itemId) {
    cartItems.removeWhere((item) => item.id == itemId);
  }
}

import 'product.dart';

class ShoppingCart {
  List<Product> cartItems = [];

  void addToCart(Product product) {
    cartItems.add(product);
  }

  void removeFromCart(Product product) {
    cartItems.remove(product);
  }

  void viewProducts(List<Product> products) {
    int index = 1;
    for (var product in products) {
      print(
          '$index. ${product.name} - \$${product.price} - Category: ${product.category.name}');
      index++;
    }
  }

  double calculateTotal() {
    double total = 0.0;
    for (var item in cartItems) {
      total += (item.price * item.quantity);
    }
    return total;
  }
}

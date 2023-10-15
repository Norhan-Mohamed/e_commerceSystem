import 'product.dart';
import 'user.dart';

class Order {
  List<Product> orderedProducts;
  double totalAmount;
  User user;

  Order(this.user, this.orderedProducts, this.totalAmount);

  void displayOrderDetails() {
    print('Order Details:');
    print('User: ${user.name}');
    print('Total Amount: \$${totalAmount}');
    print('Ordered Products:');
    for (var item in orderedProducts) {
      print(
          '${item.name} - \$${item.price} - Quantity: ${item.quantity} - Category: ${item.category.name}');
    }
  }
}

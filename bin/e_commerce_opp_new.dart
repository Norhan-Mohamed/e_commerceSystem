import 'dart:io';

import 'category.dart';
import 'order.dart';
import 'product.dart';
import 'shoppingCart.dart';
import 'user.dart';

void main() {
  User user;

  stdout.write('Are you a customer or a seller? (customer/seller): ');
  String userType = stdin.readLineSync()!.toLowerCase();

  if (userType == 'customer') {
    user = Customer('John Doe', 'john.doe@example.com', '123 Main St');
  } else if (userType == 'seller') {
    user = Seller('Alice Smith', 'alice.smith@example.com', '456 Market St');
  } else {
    print('Invalid user type. Exiting.');
    return;
  }

  Category category1 = Category('Electronics');
  Category category2 = Category('Clothing');
  Product product1 = Product('Laptop', 800.0, 1, category1);
  Product product2 = Product('T-Shirt', 25.0, 3, category2);

  ShoppingCart cart = ShoppingCart();

  print('Available Products:');
  cart.viewProducts([product1, product2]);

  if (user is Seller) {
    (user as Seller).addProduct([product1, product2]);
    print('\nAvailable Products after addition:');
    cart.viewProducts([product1, product2]);
  }

  if (user is Customer) {
    while (true) {
      stdout.write('Enter the product number to add to cart (0 to exit): ');
      int choice = int.parse(stdin.readLineSync()!);

      if (choice == 0) {
        break;
      }

      if (choice < 1 || choice > 2) {
        print('Invalid choice. Please try again.');
        continue;
      }

      if (choice == 1) {
        cart.addToCart(product1);
      } else if (choice == 2) {
        cart.addToCart(product2);
      }

      print('Product added to cart.');
    }

    print('Cart:');
    cart.viewProducts(cart.cartItems);
    print('Total Amount: \$${cart.calculateTotal()}');

    Order order = Order(user, cart.cartItems, cart.calculateTotal());
    print('\nPlacing Order...');
    order.displayOrderDetails();
  }
}

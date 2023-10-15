import 'dart:io';

import 'category.dart';
import 'product.dart';

abstract class User {
  String name;
  String email;
  String address;

  User(this.name, this.email, this.address);

  void displayUserType();
}
//////////////////////////////////

class Customer extends User {
  Customer(String name, String email, String address)
      : super(name, email, address);

  @override
  void displayUserType() {
    print('User Type: Customer');
  }
}

////////////////////////////////

class Seller extends User {
  Seller(String name, String email, String address)
      : super(name, email, address);

  @override
  void displayUserType() {
    print('User Type: Seller');
  }

  void addProduct(List<Product> products) {
    print('Enter product name: ');
    String productName = stdin.readLineSync()!;

    stdout.write('Enter product price: ');
    double productPrice = double.parse(stdin.readLineSync()!);

    stdout.write('Enter product quantity: ');
    int productQuantity = int.parse(stdin.readLineSync()!);

    stdout.write('Enter product category: ');
    String productCategory = stdin.readLineSync()!;

    Category category = Category(productCategory);
    Product product =
        Product(productName, productPrice, productQuantity, category);
    products.add(product);

    print('Product added successfully: $productName');
  }
}

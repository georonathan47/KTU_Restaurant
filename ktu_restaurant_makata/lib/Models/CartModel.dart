import 'package:flutter_cart/flutter_cart.dart';

import 'FoodModel.dart';

class CartClass {
  var cart = FlutterCart();
  final foodDetails = Food();

  void addMultipleItems(String itemName, double itemPrice, String itemImage) {
    cart.addToCart(
      unitPrice: itemPrice,
      productId: foodDetails.dataa.first.id,
      productName: itemName,
    );
  }

  void addItem(index) {
    cart.incrementItemToCart(index);
  }

  void removeItem(index) {
    cart.decrementItemFromCart(index);
  }

  void totalAmount() {
    cart.getTotalAmount();
  }

  void totalQty() {
    cart.getCartItemCount();
  }


}

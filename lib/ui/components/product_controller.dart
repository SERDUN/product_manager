import 'package:flutter/material.dart';
import 'package:flutter_course/repository/dto/ProductDTO.dart';

class ProductController extends StatelessWidget {
  final Function addProduct;
  static const String BUTTON_ADD_PRODUCT_TITLE = "Add task";
  double controllerPadding = 10;

  ProductController(this.addProduct);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(controllerPadding),
      child: RaisedButton(
        color: Theme.of(context).primaryColor,
        onPressed: () {
          handleAdditionProduct();
        },
        child: Text(BUTTON_ADD_PRODUCT_TITLE),
      ),
    );
  }

  void handleAdditionProduct() {
    ProductDTO product =
        ProductDTO(DateTime.now().toIso8601String(), "assets/food.jpg");
    addProduct(product);
  }
}

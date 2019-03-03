import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/repository/dto/ProductDTO.dart';
import 'package:flutter_course/ui/components/products_administration_list.dart';
import 'package:flutter_course/ui/pages/navigation.dart';

class ProductsAdministrationPage extends StatefulWidget {
  ProductsAdministrationState state = new ProductsAdministrationState();
  List<ProductDTO> products;

  ProductsAdministrationPage(this.products);

  @override
  State<StatefulWidget> createState() {
    return state;
  }
}

class ProductsAdministrationState extends State<ProductsAdministrationPage> {
  static const String TEXT_EMPTY_PRODUCT_LIST =
      "Product list is empty,  please add products in products page";

  @override
  Widget build(BuildContext context) {
    return widget.products.isEmpty
        ? _builtMessageEmptyProducts()
        : ProductAdministrationList(
            widget.products, _deleteProduct, _updateProduct);
  }

  _deleteProduct(int index) {
    List<ProductDTO> products = widget.products;
    if (products != null)
      setState(() {
        products.removeAt(index);
      });
  }

  _updateProduct(int index) {
    List<ProductDTO> products = widget.products;
    if (products != null) {
      if (products.length >= index) {
        setState(() {
          products[index].title =
              DateTime.now().toIso8601String() + " : edited ";
        });
      }
    }
  }

  Widget _builtMessageEmptyProducts() {
    return Center(
      child: Text((TEXT_EMPTY_PRODUCT_LIST)),
    );
  }
}

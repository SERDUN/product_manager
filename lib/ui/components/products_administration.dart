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
  @override
  Widget build(BuildContext context) {
    return ProductAdministrationList(
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
}

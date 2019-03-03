import 'package:flutter/material.dart';
import 'package:flutter_course/repository/dto/ProductDTO.dart';
import 'package:flutter_course/ui/components/product_controller.dart';
import 'package:flutter_course/ui/components/product_list.dart';

class ProductManager extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _ProductManagerState();
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<ProductDTO> _products = [];

  void _addProduct(ProductDTO product) {
    setState(() {
      _products.add(product);
    });
    print(_products);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ProductController(_addProduct),
        Expanded(
          child: ProductList(_products, (product) {}, (index) {
            setState(() {
              _products.removeAt(index);
            });
          }),
        )
      ],
    );
  }
}

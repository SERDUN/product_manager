import 'package:flutter/material.dart';
import 'package:flutter_course/repository/dto/ProductDTO.dart';
import 'package:flutter_course/ui/components/product_controller.dart';
import 'package:flutter_course/ui/components/product_list.dart';

class ProductManager extends StatefulWidget {
  _ProductManagerState state = _ProductManagerState();
  final List<ProductDTO> products;

  ProductManager({this.products});

  @override
  State<StatefulWidget> createState() {
    return state;
  }

  List<ProductDTO> getProducts() {
    return state._products;
  }
}

class _ProductManagerState extends State<ProductManager> {
  List<ProductDTO> _products = [];

  @override
  void initState() {
    if (widget.products != null) _products.addAll(widget.products);
    super.initState();
  }

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

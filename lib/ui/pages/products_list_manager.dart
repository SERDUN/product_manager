import 'package:flutter/material.dart';
import 'package:flutter_course/repository/dto/ProductDTO.dart';
import 'package:flutter_course/ui/components/product_controller.dart';
import 'package:flutter_course/ui/components/product_list.dart';

class ProductListManager extends StatefulWidget {
  _ProductListManagerState state = _ProductListManagerState();
  final List<ProductDTO> products;

  ProductListManager({this.products});

  @override
  State<StatefulWidget> createState() {
    return state;
  }

  List<ProductDTO> getProducts() {
    return state._products;
  }
}

class _ProductListManagerState extends State<ProductListManager> {
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

  // ,

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ProductList(_products, (product) {}, (index) {
              setState(() {
                _products.removeAt(index);
              });
            }),
          )
        ],
      ),
      floatingActionButton: ProductController(_addProduct),
    );
  }
}

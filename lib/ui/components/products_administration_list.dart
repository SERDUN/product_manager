import 'package:flutter/material.dart';
import 'package:flutter_course/repository/dto/ProductDTO.dart';
import 'package:flutter_course/ui/pages/product_details.dart';

class ProductAdministrationList extends StatelessWidget {
  final List<ProductDTO> products;
  Function(int) deleteDetailsProduct;
  Function(int) updateItem;

  static const String BUTTON_TEXT_DETAILS = "DELETE";
  static const String BUTTON_NEW_TIME_DETAILS = "GENERATE NEW TIME";
  static const double SPACE_BETWEEN_BUTTONS = 16;


  ProductAdministrationList(this.products, this.deleteDetailsProduct,
      this.updateItem);

  Widget _buildCard(BuildContext context, int index) {
    ProductDTO currentItem = products[index];

    return Card(
      child: Column(
        children: <Widget>[
          Image.asset(currentItem.imgAsset),
          Text(currentItem.title),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton(
                onPressed: () => deleteDetailsProduct(index),
                child: Text(BUTTON_TEXT_DETAILS),
              ),
              FlatButton(
                onPressed: () => updateItem(index),
                child: Text(BUTTON_NEW_TIME_DETAILS),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget productCards = _buildProductsList();

    return productCards;
  }

  Widget _buildProductsList() {
    Widget productCards;

    if (products.length > 0) {
      productCards =
          ListView.builder(itemBuilder: _buildCard, itemCount: products.length);
    } else {
      productCards = Container();
    }
    return productCards;
  }
}

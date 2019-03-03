import 'package:flutter/material.dart';
import 'package:flutter_course/repository/dto/ProductDTO.dart';

class ProductList extends StatelessWidget {
  final List<ProductDTO> products;

  Function openDetailsProduct;
  Function deleteDetailsProduct;

  final String BUTTON_TEXT_DETAILS = "Details";

  ProductList(
      this.products, this.openDetailsProduct, this.deleteDetailsProduct);

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
                onPressed: () => {
                      //openDetailsProduct(products[index])
//                Navigator.push(context,
//                    MaterialPageRoute(builder: (BuildContext context) {
//                      return ProductPage(products[index]);
//                    })).then((value) {
//                  if (value) deleteDetailsProduct(index);
//                })
                    },
                child: Text(BUTTON_TEXT_DETAILS),
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

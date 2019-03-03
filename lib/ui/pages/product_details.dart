import 'package:flutter/material.dart';
import 'package:flutter_course/repository/dto/ProductDTO.dart';

class ProductDetailsPage extends StatelessWidget {
  static const String PAGE_APP_BAR_TITLE = "Task details";
  static const String BUTTON_APP_BACK_TITLE = "Back";
  static const String BUTTON_REMOVE_PRODUCT_TITLE = "Remove";
  static const double TEXT_PADDING = 24;
  static const double SPACE_BETWEEN_BUTTONS = 16;

  ProductDTO product;

  ProductDetailsPage(this.product);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () => _handleOnBackPressed(context),
      child: Scaffold(
        appBar: AppBar(
          title: Text(PAGE_APP_BAR_TITLE),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Image.asset(product.imgAsset),
              buildProductTitle(),
              buildProductController(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildProductController(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        RaisedButton(
          color: Theme.of(context).primaryColor,
          onPressed: () {
            Navigator.pop(context, false);
          },
          child: Text(
            BUTTON_APP_BACK_TITLE,
            style: Theme.of(context).textTheme.button,
          ),
        ),
        Container(
          width: SPACE_BETWEEN_BUTTONS,
        ),
        RaisedButton(
          color: Theme.of(context).primaryColor,
          onPressed: () {
            Navigator.pop(context, true);
          },
          child: Text(
            BUTTON_REMOVE_PRODUCT_TITLE,
            style: Theme.of(context).textTheme.button,
          ),
        )
      ],
    );
  }

  Container buildProductTitle() {
    return Container(
      padding: EdgeInsets.all(TEXT_PADDING),
      child: Text(product.title),
    );
  }

  Future<bool> _handleOnBackPressed(BuildContext context) {
    Navigator.pop(context, false);
    return Future.value(false);
  }
}

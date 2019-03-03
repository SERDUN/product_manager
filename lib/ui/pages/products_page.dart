import 'package:flutter/material.dart';
import 'package:flutter_course/ui/components/product_manager.dart';

class ProductsPage extends StatelessWidget {
  static const String DRAWER_TITLE_APP_BAR = "Chooese task";
  static const String PAGE_TITLE_APP_BAR = "Task liat";
  static const String DRAWER_ITEM_1 = "Choose task";
  static const String DRAWER_ITEM_2 = "NONE";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: Drawer(
          child: Column(
            children: <Widget>[
              AppBar(
                automaticallyImplyLeading: false,
                title: Text(DRAWER_TITLE_APP_BAR),
              ),
              ListTile(
                title: Text(DRAWER_ITEM_1),
                onTap: () {},
              ),
              ListTile(
                title: Text(DRAWER_ITEM_2),
                onTap: () {},
              )
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(PAGE_TITLE_APP_BAR),
        ),
        body: ProductManager());
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_course/repository/dto/ProductDTO.dart';
import 'package:flutter_course/ui/components/products_manager.dart';
import 'package:flutter_course/ui/components/products_administration.dart';

class NavigationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NavigationPageState();
  }
}

class NavigationPageState extends State<NavigationPage> {
  static const String DRAWER_TITLE_APP_BAR = "Chooese task";
  static const String PAGE_TITLE_APP_BAR = "Task liat";
  static const String DRAWER_ITEM_1 = "Choose task";
  static const String DRAWER_ITEM_2 = "NONE";

  Widget currentPage = ProductManager();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: buildDrawer(),
        appBar: AppBar(
          title: Text(PAGE_TITLE_APP_BAR),
        ),
        body: currentPage);
  }

  Drawer buildDrawer() {
    return Drawer(
      child: Column(
        children: <Widget>[
          AppBar(
            automaticallyImplyLeading: false,
            title: Text(DRAWER_TITLE_APP_BAR),
          ),
          ListTile(
            title: Text(DRAWER_ITEM_1),
            onTap: () {
              List<ProductDTO> products = List();
              if (currentPage is ProductsAdministrationPage) {
                ProductsAdministrationPage manager = currentPage;
                products.addAll(manager.products);
              }

              setState(() {
                currentPage = ProductManager(
                  products: products,
                );
              });
              Navigator.pop(context);
            },
          ),
          ListTile(
            title: Text(DRAWER_ITEM_2),
            onTap: () {
              List<ProductDTO> products = List();
              if (currentPage is ProductManager) {
                ProductManager manager = currentPage;
                products.addAll(manager.getProducts());
              }
              setState(() {
                currentPage = ProductsAdministrationPage(products);
              });
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_course/repository/dto/ProductDTO.dart';
import 'package:flutter_course/ui/pages/products_list_manager.dart';
import 'package:flutter_course/ui/pages/products_administration.dart';

class NavigationPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return NavigationPageState();
  }
}

class NavigationPageState extends State<NavigationPage> {
  static const String DRAWER_TITLE_APP_BAR = "Chooese products action";
  static const String PAGE_TITLE_APP_BAR = "Product list";
  static const String DRAWER_ITEM_1 = "Choose product";
  static const String DRAWER_ITEM_2 = "Products administration";

  Widget currentPage = ProductListManager();

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
              _showProductManagerPage();
            },
          ),
          ListTile(
            title: Text(DRAWER_ITEM_2),
            onTap: () {
              showAdministrationPage();
            },
          )
        ],
      ),
    );
  }

  void showAdministrationPage() {
    List<ProductDTO> products = List();
    if (currentPage is ProductListManager) {
      ProductListManager manager = currentPage;
      products.addAll(manager.getProducts());
      Navigator.pop(context);
    } else {
      Navigator.pop(context);
      return;
    }
    setState(() {
      currentPage = ProductsAdministrationPage(products);
    });
  }

  void _showProductManagerPage() {
    List<ProductDTO> products = List();
    if (currentPage is ProductsAdministrationPage) {
      ProductsAdministrationPage manager = currentPage;
      products.addAll(manager.products);
    } else {
      Navigator.pop(context);
      return;
    }

    setState(() {
      currentPage = ProductListManager(
        products: products,
      );
    });
    Navigator.pop(context);
  }
}

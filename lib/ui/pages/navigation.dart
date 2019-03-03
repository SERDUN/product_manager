import 'package:flutter/material.dart';
import 'package:flutter_course/ui/pages/products.dart';
import 'package:flutter_course/ui/pages/products_administration.dart';

class NavigationPage extends StatelessWidget {
  static const String DRAWER_TITLE_APP_BAR = "Chooese task";
  static const String PAGE_TITLE_APP_BAR = "Task liat";
  static const String DRAWER_ITEM_1 = "Choose task";
  static const String DRAWER_ITEM_2 = "NONE";

  Widget currentPage = ProductsAdministrationPage();

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

              },
            ),
            ListTile(
              title: Text(DRAWER_ITEM_2),
              onTap: () {},
            )
          ],
        ),
      );
  }
}

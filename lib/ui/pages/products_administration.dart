import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/ui/pages/navigation.dart';

class ProductsAdministrationPage extends StatelessWidget {
  static const String TEXT_PAGE_TITLE = "Task manager";
  static const String BUTTON_SIGN_IN_TITLE = "Sign in";
  static const double TEXT_PAGE_TITLE_BOTTOM_PADING = 32;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("products administration "),
      ),
      body: Center(
        child: Text("Admin"),
      ),
    );
  }
}

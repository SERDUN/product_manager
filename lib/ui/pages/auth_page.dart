import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_course/ui/pages/products_page.dart';

class AuthPage extends StatelessWidget {
  static const String TEXT_PAGE_TITLE = "Task manager";
  static const String BUTTON_SIGN_IN_TITLE = "Sign in";
  static const double TEXT_PAGE_TITLE_BOTTOM_PADING = 32;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(bottom: TEXT_PAGE_TITLE_BOTTOM_PADING),
              child: Text(
                TEXT_PAGE_TITLE,
                style: Theme.of(context).accentTextTheme.display1,
              ),
            ),
            buildSignInButton(context),
          ],
        ),
      ),
    );
  }

  RaisedButton buildSignInButton(BuildContext context) {
    return RaisedButton(
      color: Theme.of(context).primaryColor,
      child: Text(BUTTON_SIGN_IN_TITLE),
      onPressed: () {
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext app) {
          return ProductsPage();
        }));
      },
    );
  }
}

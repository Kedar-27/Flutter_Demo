import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AdaptiveFlatButton extends StatelessWidget {
  //region Variables
  final String title;
  final Function completionHandler;
  //endregion

  const AdaptiveFlatButton({this.title, this.completionHandler});

  @override
  Widget build(BuildContext context) {
    return Platform.isIOS
        ? CupertinoButton(
            onPressed: this.completionHandler,
            child: Text(
              this.title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ))
        : FlatButton(
            onPressed: this.completionHandler,
            textColor: Theme.of(context).primaryColor,
            child: Text(
              this.title,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          );
  }
}

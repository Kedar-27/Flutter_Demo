import 'package:flutter/material.dart';

class Category{
  //region Properties
  final String title;
  final String id;
  final Color color;
  //endregion
  const Category({
    @required this.title,
    @required this.id,
    this.color = Colors.orange}
    );


}
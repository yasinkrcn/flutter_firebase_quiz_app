import 'package:flutter/material.dart';

class CategoryModel {
 final String categoryName;
 final Color categoryColor;
 final Color textColor;
 final String image;

 const CategoryModel({
    required this.categoryName,
    required this.categoryColor,
    required this.textColor,
    required this.image,
  });
}

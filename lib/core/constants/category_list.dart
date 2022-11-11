import 'package:flutter/material.dart';
import 'package:flutter_firebase_quiz_app/core/constants/assets_paths.dart';
import 'package:flutter_firebase_quiz_app/features/home/data/model/category_model.dart';

List<CategoryModel> categoryList = [
  CategoryModel(
    categoryName: 'Math',
    categoryColor: Colors.amber,
    image: AssetsPath().mathSVG,
    textColor: Colors.black,
  ),
  CategoryModel(
    categoryName: 'Entertainment',
    categoryColor: Colors.red,
    image: AssetsPath().entertainmentSVG,
    textColor: Colors.white,
  ),
  CategoryModel(
    categoryName: 'Sport',
    categoryColor: Colors.green,
    image: AssetsPath().sportSVG,
    textColor: Colors.white,
  ),
  CategoryModel(
    categoryName: 'General',
    categoryColor: Colors.blue,
    image: AssetsPath().generalSVG,
    textColor: Colors.black,
  ),
  CategoryModel(
    categoryName: 'Geography',
    categoryColor: Colors.orange,
    image: AssetsPath().geographySVG,
    textColor: Colors.black,
  ),
  CategoryModel(
    categoryName: 'History',
    categoryColor: Colors.brown,
    image: AssetsPath().historySVG,
    textColor: Colors.white,
  ),
];

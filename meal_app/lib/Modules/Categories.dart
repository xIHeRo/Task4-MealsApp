// It is not a widget it is just a class
// which contain certain infomation that i will use later

// ignore_for_file: file_names
// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class Category {
  final String id;
  final String title;
  final Color color;
// the constructor to that class
  const Category({
    required this.id,
    required this.title,
    this.color = Colors.orange,
  });
}

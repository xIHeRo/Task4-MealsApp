// ignore_for_file: prefer_const_constructors
// ignore_for_file: file_names

import 'package:flutter/material.dart';
import '../Widgets/Category_item.dart';
import '../dummy_data.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(title: Text("meal")),
      body: GridView(
        padding: EdgeInsets.all(25),
        /**
         * 1) Mistake I fall in was : Children [] is FALSE!! --> Children: TRUE!
         * 2) catData is variable will be passed to DummyCategories and move on all elements inside it
         * 3) Since the return will be a widget which has alot of specs
         *  we will make it indiviually in Widgets Folder a widget called CategoryItem
         * 
         * 
         */
        children: DUMMY_CATEGORIES
            .map((catData) => CategroyItem(
                  id: catData.id,
                  title: catData.title,
                  color: catData.color,
                ))
            .toList(),
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200, // The maximum width of the the grid
          childAspectRatio: 1.25, // Ration between the Height to width
          crossAxisSpacing: 50, // The Hoizontal distance between each grid
          mainAxisSpacing: 20, // The Vertical distance between each grid
        ),
      ),
    );
  }
}

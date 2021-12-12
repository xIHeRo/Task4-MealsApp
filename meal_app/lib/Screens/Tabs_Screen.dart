// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors
// ignore_for_file: file_names

//******************** Home Page that can navigate to both CategoryScreen and favorite **** */
import 'package:flutter/material.dart';
import 'package:meal_app/Widgets/main_drawer.dart';
import 'Favorite_Screen.dart';
import 'categoriesScreen.dart';

//************ This Widget is for the Bottom Navigation Bar ************ */
class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int _selectedPageIndex = 0;
//-----------------------------------------------------//
// List of maps To Hold The Widgets
//of Both Categories & Favorites
// Kant<String, Object> 5laetha <String, dynamic>
  final List<Map<String, dynamic>> _pages = [
    {
      'page': CategoriesScreen(),
      'title': 'Categoires',
    },
    {
      'page': FavoriteScreen(),
      'title': 'Favorites',
    },
  ];
//-----------------------------------------------------//
//Function that holds the index of the page
//Activated when user press the button in Navigation bar
  void _selectPage(int value) {
    setState(
      () {
        _selectedPageIndex = value;
      },
    );
  }
  //-----------------------------------------------------//

//******************************************* //
  @override
  Widget build(BuildContext context) {
//******************************************* //
    return Scaffold(
      appBar: AppBar(
        // title is got from the list of map by the
        // index we made then we select the key title
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
//******************************************* //
      // Page is got from the list of map by the
      // index we made then we select the key title
      body: _pages[_selectedPageIndex]['page'],
//******************************************* //
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        //-----------------------------------------------------//
        //3 Important attributes in the Navigation bar
        selectedItemColor: Theme.of(context).primaryColor,
        // ignore: deprecated_member_use
        unselectedIconTheme:
            IconThemeData(color: Theme.of(context).canvasColor),
        currentIndex: _selectedPageIndex,
        //-----------------------------------------------------//
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          //----------------------------------//
          BottomNavigationBarItem(
            icon: Icon(Icons.star_rate_outlined),
            label: 'Favorite',
          ),
          //----------------------------------//
        ],
      ),
//******************************************* //
//The Drawer which made its specifiaction in external widget
      drawer: MainDrawer(),
    );
  }
}

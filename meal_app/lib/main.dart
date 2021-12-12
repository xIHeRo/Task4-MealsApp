// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';
import './Screens/Cateogry_meals_screen.dart';
import './Screens/Tabs_Screen.dart';
import './Screens/categoriesScreen.dart';
import './Screens/filters_screen.dart';
import './Screens/meal_details_screen.dart';
import 'package:meal_app/Modules/meal.dart';

// ignore_for_file: prefer_const_constructors
void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegeterian': false,
  };
  List<Meal> _availableMeal = DUMMY_MEALS;

  void _setFilters(Map<String, bool> _filterData) {
    setState(() {
      _filters = _filterData;
      _availableMeal = DUMMY_MEALS.where((meal) {
        if (_filters['gluten']! && !meal.isGlutenFree) {
          return false;
        }
        ;
        if (_filters['lactose']! && !meal.isLactoseFree) {
          return false;
        }

        if (_filters['vegan']! && !meal.isVegan) {
          return false;
        }

        if (_filters['vegetarian']! && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
//************************************************************ */
      // To remobe the demo which was on the top right of the sceen
      debugShowCheckedModeBanner: false,
//************************************************************ */
      title: 'Meal App',
//************************************************************ */
      theme: ThemeData(
        // It appears in the appbar
        primarySwatch: Colors.green,
        // ignore: deprecated_member_use
        accentColor: Colors.green,
        //It appears in the background Color
        canvasColor: Color.fromRGBO(216, 191, 216, 1),
        //-----------------------------------//
        //to Adjust the Text Styling
        // The next line is standard
        textTheme: ThemeData.light().textTheme.copyWith(
              /**
                * Body1 -> BodyText2 ( the Color of Text in the body of the app)
                * Body2 -> BodyText1
                * title -> headline6
                */
              bodyText1: TextStyle(color: Color.fromRGBO(190, 1, 300, 1)),
              bodyText2: TextStyle(color: Color.fromRGBO(102, 0, 0, 1)),
              //For the Appbar for example
              headline6: TextStyle(
                color: Color.fromRGBO(192, 0, 0, 1),
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.w700,
              ),
            ),
      ),
//************************************************************ */

      routes: {
        // I Send the app to the Tab Screen as Home page
        '/': (context) => TabsScreen(),
        // this equivalant to ---> home: Tab Screen());
//----------------------------------------------------//
        //*** The Screen of Meals in one Category  ***/
        CategoryMealScreen.routeName: (context) =>
            CategoryMealScreen(_availableMeal),
        //when it is  moved to that routename it will move you to CategoryMealScreen
//----------------------------------------------------//
        // *** Each Meal Detials ***//
        MealDetail.RouteName: (context) => MealDetail(),
        //when it is  moved to that routename it will move you to MealDetail
//----------------------------------------------------//
        //**** Filters Screen  ***/
        FiltersScreen.routeName: (context) =>
            FiltersScreen(_filters, _setFilters),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meal App44'),
      ),
      body: null,
    );
  }
}

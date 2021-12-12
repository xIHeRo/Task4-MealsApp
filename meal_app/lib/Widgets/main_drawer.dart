import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_app/Screens/filters_screen.dart';
//import 'package:flutter/rendering.dart';

// ignore_for_file: prefer_const_literals_to_create_immutables
// ignore_for_file: prefer_const_constructors
// ignore_for_file: file_names
class MainDrawer extends StatelessWidget {
// We make a widget that makes a listtile

  Widget BuildListtile(String title, IconData icon, Function TabHandler) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.symmetric(vertical: 5),
          decoration: BoxDecoration(
            color: Colors.grey,
            border: Border.all(color: Colors.red),
            borderRadius: BorderRadius.circular(60),
          ),
          child: ListTile(
            leading: Icon(icon, size: 30),
            title: Text(
              title,
              style: TextStyle(
                  fontSize: 20,
                  fontFamily: 'RobotoCondendsed',
                  fontWeight: FontWeight.w800),
            ),
            //I Had aproblem here for 1 hour :)

            onTap: () => {TabHandler()},
            //onTap: () => TabHandler(),
          ),
        ),
        Divider(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    // what appears on the Right Screen
    return Drawer(
      child: Column(
        children: [
          //-----------------------------------//
          // THis for the Top Text
          Container(
            height: 100,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.topCenter,
            color: Theme.of(context).primaryColor,
            child: Positioned(
              //Leh M4 48ala
              bottom: 10,
              left: 10,
              child: Text(
                "Settings",
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w800,
                    color: Theme.of(context).canvasColor),
              ),
            ),
          ),
          //-----------------------------------//
          //To leave a space
          SizedBox(height: 40),
          //-----------------------------------//
          // TO make listTile for Meals
          // Carry Navigator to Home screen
          BuildListtile("Meals", Icons.restaurant_rounded, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          //-----------------------------------//
          // TO make listTile for Settings
          // Carry Navigator to Settings screen
          BuildListtile("Filters", Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}

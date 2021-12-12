// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: file_names
import 'package:flutter/material.dart';
import '../Screens/Cateogry_meals_screen.dart';

//********************** THIS FILE IS FOR THE CATEGORIES AND THEIR SPECS **************** */
//***********************Inside it also a navigator to make us move to the Each type of meals (Itlaian - Geramn) ************ */ */

class CategroyItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategroyItem({
    required this.id,
    required this.title,
    required this.color,
  });
// it is for the navigator where when the user press
  void selectcategory(BuildContext ctx) {
    //Navigator of the accepeted parmter CTX then push to the routname
    // deeh bet5leek tro7 3la kol no3 (Italian - German )
    Navigator.of(ctx).pushNamed(
        CategoryMealScreen
            .routeName, // what is inside the pushNamed (ROUTENAME)

        // to identify which screen it will appear to we must set certain parameters
        arguments: {
          'id': id,
          'title': title,
        });
  }

  // Here we will set the specs of the return widget which will be inserted in the gridview
  Widget build(BuildContext context) {
//************************************************************ */
    //Somehting like a button which will have an action when we tap on it
    return InkWell(
      // when user press it will excute that function which is the navigator
      onTap: () => selectcategory(context),
      // to make an effect of presseing on in ( The filling the grid with certain color)
      splashColor: Theme.of(context).primaryColor,
      //To make the Grid itself has Cirular edge
      borderRadius: BorderRadius.circular(50),
//************************************************************ */
      child: Container(
        padding: EdgeInsets.all(10),
        child: Text(
          title,
          //Took its style from the theme of headline6
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          // Dh 3l4an n3ml tadarog fy el alwan
          gradient: LinearGradient(
            //List must have 2 colors at least
            colors: [
              color.withOpacity(0.6),
              color,
            ],
            //to set the Begging and the End
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          //to give it the cicular border
          borderRadius: BorderRadius.circular(50),
        ),
      ),
//************************************************************ */
    );
//************************************************************ */
  }
}

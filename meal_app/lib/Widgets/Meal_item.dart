// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../Screens/meal_details_screen.dart';
import '../Modules/meal.dart';
// ignore_for_file: prefer_const_constructors_in_immutables
// ignore_for_file: file_names

class MealItem extends StatelessWidget {
  @override
//------------------------------------------------------//
//We will accept the parameters from the Meals
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItem;
// optional but in the same time it is required
  const MealItem({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.duration,
    required this.complexity,
    required this.affordability,
    required this.removeItem,
  });
//------------------------------------------------------//
//To Get the Value of the Complexity in a string called
//complexityText from complexity which is in the DummyMeals

  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      default:
        return 'Unknown';
        break;
    }
  }
//------------------------------------------------------//
//To Get the Value of the Affordabilithy in a string called
//AffordableText from complexity which is in the DummyMeals

  String get AffordableText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
        break;
      case Affordability.Luxurious:
        return 'Luxurious';
        break;
      case Affordability.Pricey:
        return 'Pricey';
        break;
      default:
        return 'Unknown';
        break;
    }
  }

//------------------------------------------------------//
//                    Navigation
//------------------------------------------------------//
  void selectMeal(BuildContext ctx) {
    //pushNamed( RouteName : THE PAGE WE WANT TO MOVE TO,,,, argument : SPECIFIC ID TO HAVE )
    // to identify which on will have it
    Navigator.of(ctx)
        .pushNamed(
      MealDetail.RouteName,
      arguments: id,
    ) // to accept the returned value after the pop
        // check first that it doesnot equal null before delete
        .then((result) {
      if (result != null) {
        removeItem(result);
      }
    });
  }

//------------------------------------------------------//
//------------------------------------------------------//
  Widget build(BuildContext context) {
    // Widget wil have inkwell which like a button to be pressed on
    return InkWell(
      // On Tap will perform the selectMeal function
      onTap: () => selectMeal(context),
      child: Card(
//------------------------------------------------------//
// Just simple specs for the card:
        margin: EdgeInsets.all(15),
        elevation: 4,
        // To have Rectangular shape but in the same time with circular border
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
//------------------------------------------------------//
        child: Column(
          children: [
//------------------------------------------------------//
//What the Inkwell Actually contain
// it contain Stack that have the image with the text on it
            Stack(
              children: [
//------------------------------------------------------//
// First the Image
                //ClipRRect wil force the image to have a certain boder radius
                ClipRRect(
                  // But in the same time i want to have the border at top right and left only not all so we use :

                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  //some specs for the image
                  child: Image.network(
                    imageUrl,
                    height: 220,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
//------------------------------------------------------//
//Poistioned is a widget to identify the place of what inside it(Here is bottom and left)
                Positioned(
                  bottom: 10,
                  left: 10,
// We raped it inside certain container to Get it in one place (without it the text get out the picture)
// We specified the width and the Background color
                  child: Container(
                    width: 200,
                    color: Colors.white54,
//Padding just for space around the text
                    padding: EdgeInsets.symmetric(vertical: 8, horizontal: 5),
                    child: Text(
                      title,
                      style: TextStyle(
                          fontSize: 22,
                          color: Colors.black87,
                          fontStyle: FontStyle.italic,
                          fontWeight: FontWeight.bold),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
//------------------------------------------------------//
//what is below the image itself
//we have A Row of items
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
// The Row itself contain 3 rows
                children: [
//------------------------------------------------------//
//First Element
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      //to Separate the distance between the Icon and text
                      SizedBox(
                        width: 5,
                      ),
                      Text("$duration min")
                    ],
                  ),
//------------------------------------------------------//
//Second Element
                  Row(
                    children: [
                      Icon(Icons.work),
                      //to Separate the distance between the Icon and text
                      SizedBox(
                        width: 5,
                      ),
                      Text("$complexityText")
                    ],
                  ),
//------------------------------------------------------//
// Third Element
                  Row(
                    children: [
                      Icon(Icons.monetization_on_sharp),
                      //to Separate the distance between the Icon and text
                      SizedBox(
                        width: 5,
                      ),
                      Text("$AffordableText")
                    ],
                  )
//------------------------------------------------------//
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

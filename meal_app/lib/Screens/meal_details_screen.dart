// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:meal_app/dummy_data.dart';

//***************************** WIDGET FOR DEATAILS OF CERTAIN MEAL ************************/
class MealDetail extends StatelessWidget {
  static const RouteName = 'meal_detail';

  @override
  Widget build(BuildContext context) {
//------------------------------------------------------//
// to accept the id of each meal and The Widget itself to be special
// as string beacuse it is only one argument
    final mealId = ModalRoute.of(context)!.settings.arguments as String;
//------------------------------------------------------//
//To  Pass throught the whole Dummy Meal

//Make a list of selectedMeal which will be the same as DummyMeals having
//variable called meal that navigate thorugh it once it verifies the condition it returens
//with it
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

//------------------------------------------------------//
//------------------------------------------------------//
// We will make a funtion that will return a widget
//That Retruns the Section Title Text(Either Ingredients or Steps)
    Widget BuildSectionTitle(BuildContext context, String text) {
      return Container(
        //to leave upper distance from the image itself
        margin: EdgeInsets.symmetric(vertical: 10),
        child: Text(
          text,
          style: Theme.of(context).textTheme.headline6,
        ),
      );
    }

//------------------------------------------------------//
//------------------------------------------------------//
// This function Returns a widget of container that have certain specs
// and return a child to this widget
    Widget BuildSection(Widget child) {
      return Container(
        //we must specify the height and the width of the container
        height: 300,
        width: 250,
        margin: EdgeInsets.all(15),
        padding: EdgeInsets.all(15),
//------------------------------------------------------//
        //  Decoration BOX of the whole Container
        decoration: BoxDecoration(
          color: Colors.black12,
          //External border
          //identify the color
          border: Border.all(color: Colors.black45),
          //identify the shape of the border
          borderRadius: BorderRadius.circular(15),
        ),
        child: child,
      );
    }

//------------------------------------------------------//
//------------------------------------------------------//
/***************************************************************** */
    return Scaffold(
        appBar: AppBar(
          title: Text(
            selectedMeal.title,
            style: TextStyle(fontSize: 20),
          ),
        ),
//------------------------------------------------------//
// To allow the page to Be scolable
        body: SingleChildScrollView(
          child: Column(
            children: [
              /***************************************************************** */
              //First We show the image in the the top of the page
              Container(
                height: 250,
                width: double.infinity,
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.fill,
                ),
              ),
              /***************************************************************** */
              // Second we show the word ( Ingredients )
              // We Used a Fucntion we made in the top of the code
              BuildSectionTitle(context, "Ingredients"),
              /***************************************************************** */
              // Third we show the Ingredients itself
              // we emebeded it inside listview but inside a
              //container to avoid the problem of infinit heigt
              // The Container is ideintified in the funciton
              BuildSection(
                ListView.builder(
                  // the list view that have the ingredients
                  // As we know that the item builder take function whose parameters are the ctx & index and return widget here it is card
                  itemBuilder: (ctx, index) =>
                      //------------------------------------------------------//
                      Card(
                    color: Color.fromRGBO(255, 228, 181, 1),
                    child:
                        //------------------------------------------------------//
                        Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.red),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 15,
                      ),
                      child: Text(selectedMeal.ingredients[index]),
                    ),
                    //------------------------------------------------------//
                  ),
                  //------------------------------------------------------//S
                  itemCount: selectedMeal.ingredients.length,
                ),
              ),
              /***************************************************************** */
              // Fourth we show the Steps word
              BuildSectionTitle(context, "Steps"),
              /***************************************************************** */
              // Fifth we show the Steps itself
              BuildSection(
                ListView.builder(
                  // the list view that have the Steps
                  // As we know that the item builder take function whose parameters are the ctx & index and return widget here it is ListView
                  itemBuilder: (ctx, index) =>
                      //------------------------------------------------------//
                      //Since we use the Single Scrollablechild
                      //we can use listTile to show the steps
                      // we only wraped it inside the Column to have a divider
                      Column(
                    children: [
                      ListTile(
                        //Each Step text
                        title: Text(selectedMeal.steps[index]),
                        // Showing Index 1,2,3
                        leading: CircleAvatar(
                          child: Text("#${index + 1}"),
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                  //------------------------------------------------------//

                  itemCount: selectedMeal.steps.length,
                ),
                /***************************************************************** */
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.of(context).pop(mealId);
          },
          child: Icon(Icons.delete),
        ));
  }
}

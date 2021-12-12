// ignore_for_file: prefer_const_constructors
// ignore_for_file: file_names
import 'package:flutter/material.dart';
import 'package:meal_app/Modules/meal.dart';
import 'package:meal_app/main.dart';
import '../Widgets/Meal_item.dart';
import '../dummy_data.dart';

class CategoryMealScreen extends StatefulWidget {
  //name of the widget hold inside a variable to be called easier
  // call : NAME OF CLASS .  NAME OF VAIRABLE
  static const routeName = 'category_meals';
  List<Meal> availableMeals;
  CategoryMealScreen(this.availableMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

//He Tried to insert it inside Intit State but i couldnot do it
class _CategoryMealScreenState extends State<CategoryMealScreen> {
  @override
//****************************************************************************** */
  Widget build(BuildContext context) {
    // To accept the id and title from the navigator in the Category item
    final routeArg =
        ModalRoute.of(context)!.settings.arguments as Map<String, String>;
    final categoryId = routeArg['id'];
    final categoryTitle = routeArg['title'];
//**************************************************************************** */
    /**Now we want to get the meals to be in the meals screen
     * the problem is that meals have id and categories , but categories (c1,c2) for example
     * exist in both dummy meals and dummy categories so we need to filter them
     * we make List categoryMeals that hold the Dummymeals certain item , which we will 
     * get by using where function then return to convert it into list by (toList())
     */
    // Where -> kol lma yla2y el elment yb3th, hy3di 3leehom kolhm
    final categoryMeals = widget.availableMeals.where((meal) {
      // meal is a variable that will move through whole Meals in the DummyMeals Class
      // Bndor 3la el categories b2a gwa el meal
      // fy nafs el wa2t ykon feeha nafs el id
      return meal.categories.contains(categoryId);
    }).toList();

//**************************************************************************** */
//****************************************************************************** */
//function of the Remove
    void _removeMeal(String mealId) {
      setState(() {
        categoryMeals.removeWhere((meal) => meal.id == mealId);
      });
    }

//****************************************************************************** */
//------------------------------------------------------//
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle!),
      ),
//------------------------------------------------------//
      body: ListView.builder(
        itemBuilder: (ctx, index) {
// since the Wideget inside the meals screen needs alot of
// specs we make it in a separate file called (MealsItems)

// We passed the ImageUrl from CategroyMeals by its index to MealItem
// (The widget that conntain the specs of each meals inside the meal screen)
          return MealItem(
            id: categoryMeals[index].id,
            title: categoryMeals[index].title,
            imageUrl: categoryMeals[index].imageUrl,
            duration: categoryMeals[index].duration,
            complexity: categoryMeals[index].complexity,
            affordability: categoryMeals[index].affordability,
            removeItem: _removeMeal,
          );
        },
//------------------------------------------------------//
// it is the second thing must be identified in the listviewBuilder (Their Number)
        itemCount: categoryMeals.length,
      ),
//------------------------------------------------------//
    );
  }
}

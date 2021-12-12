import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:meal_app/Widgets/main_drawer.dart';

// ignore_for_file: prefer_const_constructors
// ignore_for_file: file_names
class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';
  Function SaveFilters;

  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.SaveFilters);

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _GlutenFree = false;
  bool _LactoseFree = false;
  bool _Vegetarian = false;
  bool _Vegan = false;

  @override
  initState() {
    _GlutenFree = widget.currentFilters['gluten']!;
    _LactoseFree = widget.currentFilters['lactose']!;
    _Vegetarian = widget.currentFilters['vegerarian']!;
    _Vegan = widget.currentFilters['vegan']!;
    super.initState();
  }

  Widget buildSwitchListTile(String title, String description,
      bool CurrentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(title),
      value: CurrentValue,
      subtitle: Text(description),
      onChanged: (val) => {updateValue(val)},
    );
  }

  @override
  Widget build(BuildContext context) {
//************************************************ */
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: [
          IconButton(
            onPressed: () {
              final Map<String, bool> selectedFilters = {
                'gluten': _GlutenFree,
                'lactose': _LactoseFree,
                'vegan': _Vegan,
                'vegeterian': _Vegetarian,
              };
              widget.SaveFilters();
            },
            icon: Icon(Icons.save),
          )
        ],
      ),
//************************************************ */
      body: Column(
        children: [
          //--------------------//
          Container(
            padding: EdgeInsets.all(20),
            //--------------------//
            child: Text(
              'Adjust your Filters',
              style: Theme.of(context).textTheme.headline6,
            ),
            //--------------------//
          ),
          //--------------------//
          Expanded(
            child: ListView(
              children: [
                //--------------------------------------//
                buildSwitchListTile('GlutenFree',
                    'Only Include Glutten-Free Meals', _GlutenFree, (newValue) {
                  setState(
                    () {
                      _GlutenFree = newValue;
                    },
                  );
                }),

                //--------------------------------------//
                buildSwitchListTile(
                    'Lactose_Free',
                    'Only Include Lactose_Free Meals',
                    _LactoseFree, (newValue) {
                  setState(
                    () {
                      _LactoseFree = newValue;
                    },
                  );
                }),

                //--------------------------------------//
                buildSwitchListTile(
                    'Vegetarian', 'Only Include Vegetarian Meals', _Vegetarian,
                    (newValue) {
                  setState(
                    () {
                      _Vegetarian = newValue;
                    },
                  );
                }),
                //--------------------------------------//
                buildSwitchListTile('Vegan', 'Only Include Vegan Meals', _Vegan,
                    (newValue) {
                  setState(
                    () {
                      _Vegan = newValue;
                    },
                  );
                }),
                //--------------------//
              ],
            ),
            //--------------------//
          )
        ],
      ),
//************************************************ */
      drawer: MainDrawer(),
    );
  }
}

import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static String routeName = '/filters';

  final Function _saveFilters;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this._saveFilters);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () => widget._saveFilters({
              'gluten': _glutenFree,
              'vegetarian': _vegetarian,
              'vegan': _vegan,
              'lactose': _lactoseFree,
            }),
          )
        ],
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text('Adjust meal selection.',
                style: Theme.of(context).textTheme.title),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'Gluten-Free',
                  'Only include gluten-free meals.',
                  _glutenFree,
                  (newValue) => _glutenFree = newValue,
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  'Only include vegetarian meals.',
                  _vegetarian,
                  (newValue) => _vegetarian = newValue,
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only include vegan meals.',
                  _vegan,
                  (newValue) => _vegan = newValue,
                ),
                _buildSwitchListTile(
                  'Lactose-Free',
                  'Only include lactose-free meals.',
                  _lactoseFree,
                  (newValue) => _lactoseFree = newValue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _glutenFree = widget.currentFilters['gluten'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    _lactoseFree = widget.currentFilters['lactose'];
  }

  Widget _buildSwitchListTile(String title, String description,
      bool currentValue, Function updateValue) {
    return SwitchListTile(
      title: Text(
        title,
      ),
      value: currentValue,
      subtitle: Text(description),
      onChanged: (newValue) {
        setState(() {
          updateValue(newValue);
        });
      },
    );
  }
}

import 'package:flutter/material.dart';
// import 'package:meals/screens/tabs.dart';
// import 'package:meals/widgets/main_drawer.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FilterScreen extends StatefulWidget {
  const FilterScreen({required this.currentFilters, super.key});

  final Map<Filter, bool> currentFilters;

  @override
  State<FilterScreen> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FilterScreen> {
  // were in the state class and not the widget class so we access it using w
  var _glutenFreeFilter = false;
  var _lactoseFreeFilter = false;
  var _vegetarianFilter = false;
  var _veganFilter = false;

// we are ovveriding the values above
  @override
  void initState() {
    super.initState();
    _glutenFreeFilter = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilter = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianFilter = widget.currentFilters[Filter.vegetarian]!;
    _veganFilter = widget.currentFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      // drawer: MainDrawer(
      //   onSelectScreen:(identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == 'meals') {
      //       Navigator.of(context)
      //       .pushReplacement(MaterialPageRoute(builder: (context) => const TabsScreen(),),);
      //     }
      //   },
      // ),
      body: WillPopScope(
        onWillPop: () async {
          Navigator.of(context).pop({
            // passing this data back to tabs screen so user selected data is passed
            Filter.glutenFree: _glutenFreeFilter,
            Filter.lactoseFree: _lactoseFreeFilter,
            Filter.vegetarian: _vegetarianFilter,
            Filter.vegan: _veganFilter
          });
          return false;
        },
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilter,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFilter = isChecked;
                });
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include gluten-free meals',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _lactoseFreeFilter,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilter = isChecked;
                });
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include lactose-free meals',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _vegetarianFilter,
              onChanged: (isChecked) {
                setState(() {
                  _vegetarianFilter = isChecked;
                });
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include vegetarian meals',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
            SwitchListTile(
              value: _veganFilter,
              onChanged: (isChecked) {
                setState(() {
                  _veganFilter = isChecked;
                });
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              subtitle: Text(
                'Only include vegan meals',
                style: Theme.of(context).textTheme.titleMedium!.copyWith(
                      color: Theme.of(context).colorScheme.onBackground,
                    ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left: 34, right: 22),
            ),
          ],
        ),
      ),
    );
  }
}

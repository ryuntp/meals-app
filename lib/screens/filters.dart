import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:meals/screens/tabs.dart';
// import 'package:meals/widgets/main_drawer.dart';
import 'package:meals/providers/filters_provider.dart';

class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier) {
      //     Navigator.pop(context);
      //     if (identifier == 'meals') {
      //       Navigator.of(context).pushReplacement( // doesn't stack screens, replace instead
      //         MaterialPageRoute(
      //           builder: (ctx) {
      //             return const TabsScreen();
      //           },
      //         ),
      //       );
      //     }
      //   },
      // ),
      body: Column(
        children: [
          SwitchListTile(
            value: activeFilters[Filter.glutenFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.glutenFree, isChecked);
            },
            title: Text(
              'Gluten-free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              'Only include gluten-free meals',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.lactoseFree]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.lactoseFree, isChecked);
            },
            title: Text(
              'Lactose-free',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              'Only include lactose-free meals',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegetarian]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegetarian, isChecked);
            },
            title: Text(
              'Vegetarian',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              'Only include vegetarian meals',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegan]!,
            onChanged: (isChecked) {
              ref
                  .read(filtersProvider.notifier)
                  .setFilter(Filter.vegan, isChecked);
            },
            title: Text(
              'Vegan',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            subtitle: Text(
              'Only include vegan meals',
              style: Theme.of(context)
                  .textTheme
                  .labelMedium!
                  .copyWith(color: Theme.of(context).colorScheme.onSurface),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}


// body: PopScope(
//         canPop: false,
//         onPopInvoked: (bool didPop) {
//           if (didPop) return;
//           ref.read(filtersProvider.notifier).setFilters({
//             Filter.glutenFree: _glutenFreeFilterSet,
//             Filter.lactoseFree: _lactoseFreeFilterSet,
//             Filter.vegetarian: _vegetarianFilterSet,
//             Filter.vegan: _veganFilterSet,
//           });

//           Navigator.of(context).pop();
//           // return true;
//         },
//         child: Column(
//           children: [
//             SwitchListTile(
//               value: _glutenFreeFilterSet,
//               onChanged: (isChecked) {
//                 setState(() {
//                   _glutenFreeFilterSet = isChecked;
//                 });
//               },
//               title: Text(
//                 'Gluten-free',
//                 style: Theme.of(context)
//                     .textTheme
//                     .titleLarge!
//                     .copyWith(color: Theme.of(context).colorScheme.onSurface),
//               ),
//               subtitle: Text(
//                 'Only include gluten-free meals',
//                 style: Theme.of(context)
//                     .textTheme
//                     .labelMedium!
//                     .copyWith(color: Theme.of(context).colorScheme.onSurface),
//               ),
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               contentPadding: const EdgeInsets.only(left: 34, right: 22),
//             ),
//             SwitchListTile(
//               value: _lactoseFreeFilterSet,
//               onChanged: (isChecked) {
//                 setState(() {
//                   _lactoseFreeFilterSet = isChecked;
//                 });
//               },
//               title: Text(
//                 'Lactose-free',
//                 style: Theme.of(context)
//                     .textTheme
//                     .titleLarge!
//                     .copyWith(color: Theme.of(context).colorScheme.onSurface),
//               ),
//               subtitle: Text(
//                 'Only include lactose-free meals',
//                 style: Theme.of(context)
//                     .textTheme
//                     .labelMedium!
//                     .copyWith(color: Theme.of(context).colorScheme.onSurface),
//               ),
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               contentPadding: const EdgeInsets.only(left: 34, right: 22),
//             ),
//             SwitchListTile(
//               value: _vegetarianFilterSet,
//               onChanged: (isChecked) {
//                 setState(() {
//                   _vegetarianFilterSet = isChecked;
//                 });
//               },
//               title: Text(
//                 'Vegetarian',
//                 style: Theme.of(context)
//                     .textTheme
//                     .titleLarge!
//                     .copyWith(color: Theme.of(context).colorScheme.onSurface),
//               ),
//               subtitle: Text(
//                 'Only include vegetarian meals',
//                 style: Theme.of(context)
//                     .textTheme
//                     .labelMedium!
//                     .copyWith(color: Theme.of(context).colorScheme.onSurface),
//               ),
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               contentPadding: const EdgeInsets.only(left: 34, right: 22),
//             ),
//             SwitchListTile(
//               value: _veganFilterSet,
//               onChanged: (isChecked) {
//                 setState(() {
//                   _veganFilterSet = isChecked;
//                 });
//               },
//               title: Text(
//                 'Vegan',
//                 style: Theme.of(context)
//                     .textTheme
//                     .titleLarge!
//                     .copyWith(color: Theme.of(context).colorScheme.onSurface),
//               ),
//               subtitle: Text(
//                 'Only include vegan meals',
//                 style: Theme.of(context)
//                     .textTheme
//                     .labelMedium!
//                     .copyWith(color: Theme.of(context).colorScheme.onSurface),
//               ),
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               contentPadding: const EdgeInsets.only(left: 34, right: 22),
//             ),
//           ],
//         ),
//       ),
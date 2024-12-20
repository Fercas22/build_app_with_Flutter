import 'package:codelab/presentation/pages/favorites_page.dart';
import 'package:codelab/presentation/pages/generator_page.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    Widget page;
    switch (selectedIndex) {
      case 0:
        page = GeneratorPage();
        break;
      case 1:
        page = FavoritesPage();
        break;
      default:
        throw UnimplementedError('no widget for $selectedIndex');
    }

    var mainArea = ColoredBox(
      color: colorScheme.surfaceVariant,
      child: AnimatedSwitcher(
        duration: Duration(milliseconds: 200),
        child: page,
      ),
    );

    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth < 450) {
            return SafeArea(
              child: Column(
                children: [
                  Expanded(child: mainArea),
                  BottomNavigationBar(
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home),
                        label: 'Home',
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.favorite),
                        label: 'Favorites',
                      ),
                    ],
                    currentIndex: selectedIndex,
                    onTap: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                  )
                ],
              ),
            );
          } else {
            return Row(
              children: [
                SafeArea(
                  child: NavigationRail(
                    extended: constraints.maxWidth >= 600,
                    destinations: [
                      NavigationRailDestination(
                        icon: Icon(Icons.home),
                        label: Text('Home'),
                      ),
                      NavigationRailDestination(
                        icon: Icon(Icons.favorite),
                        label: Text('Favorites'),
                      ),
                    ],
                    selectedIndex: selectedIndex,
                    onDestinationSelected: (value) {
                      setState(() {
                        selectedIndex = value;
                      });
                    },
                  ),
                ),
                Expanded(child: mainArea),
              ],
            );
          }
        },
      ),
    );
    // return LayoutBuilder(
    //   builder: (context, constraints) {
    //     return Scaffold(
    //       body: Row(
    //         children: [
    //           SafeArea(
    //             child: NavigationRail(
    //               extended: constraints.maxWidth >= 600,
    //               destinations: [
    //                 NavigationRailDestination(
    //                   icon: Icon(Icons.home),
    //                   label: Text('Home'),
    //                 ),
    //                 NavigationRailDestination(
    //                   icon: Icon(Icons.favorite),
    //                   label: Text('Favorites'),
    //                 ),
    //               ],
    //               selectedIndex: selectedIndex,
    //               onDestinationSelected: (value) {
    //                 setState(() {
    //                   selectedIndex = value;
    //                 });
    //               },
    //             ),
    //           ),
    //           Expanded(
    //             child: Container(
    //               color: Theme.of(context).colorScheme.primaryContainer,
    //               child: page,
    //             ),
    //           ),
    //         ],
    //       ),
    //     );
    //   },
    // );
  }
}

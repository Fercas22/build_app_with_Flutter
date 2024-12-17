import 'package:codelab/aplication/my_app_state.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final appState = context.watch<MyAppState>();
    final favorites = appState.favorites;
    final favoritesLength = appState.favorites.length;

    if (appState.favorites.isEmpty) {
      return Center(
        child: Text('No favorites yet.'),
      );
    }

    final List<Widget> favoritesList = favorites.map((item) {
      return ListTile(
        title: Text(item.asLowerCase),
        leading: const Icon(Icons.favorite),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            appState.deleteFavorite(item);
          },
        ),
      );
    }).toList();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('You have $favoritesLength favorites:'),
          Expanded(
            child: ListView(
              children: favoritesList,
            ),
          ),
        ],
      ),
    );
  }

  // return ListView(
  //   children: [
  //     Padding(
  //       padding: const EdgeInsets.all(20),
  //       child: Text('You have '
  //           '${appState.favorites.length} favorites:'),
  //     ),
  //     for (var pair in appState.favorites)
  //       ListTile(
  //         leading: Icon(Icons.favorite),
  //         title: Text(pair.asLowerCase),
  //       ),
  //   ],
  // );
}

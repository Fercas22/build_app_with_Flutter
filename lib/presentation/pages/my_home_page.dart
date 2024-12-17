import 'package:codelab/aplication/my_app_state.dart';
import 'package:codelab/presentation/widgets/big_card.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var pair = appState.current;

    IconData icon;
    if (appState.favorites.contains(pair)) {
      icon = Icons.favorite;
    } else {
      icon = Icons.favorite_border;
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            BigCard(pair: pair),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                ElevatedButton.icon(
                  icon: Icon(icon),
                  label: Text('Like'),
                  onPressed: () {
                    appState.toggleFavorite();
                  },
                ),
                SizedBox(width: 10),
                SizedBox(width: 10),
                ElevatedButton(
                  child: Text('Next'),
                  onPressed: () {
                    appState.getNext();
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

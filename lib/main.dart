import 'package:english_words/english_words.dart' as prefix0;
import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

import 'Widgets/MainWidget.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Startup Name Generator',
      home: MainWidget(RandomWords()),
      theme: ThemeData(primaryColor: Colors.white),
    );
  }
}

class RandomWordsState extends State<RandomWords> {
  final _suggestions = <WordPair>[];
  final _saved = Set<WordPair>();
  final _biggerFont = const TextStyle(fontSize: 18.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Startup Name Generator'), actions: <Widget>[
          IconButton(
            icon: Icon(Icons.list),
            onPressed: _pushSaved,
          ),
          IconButton(
              icon: Icon(Icons.image),
              onPressed: _pushImageLayout)
        ]),
        body: _buildSuggestions());
  }

  void _pushSaved() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      final Iterable<ListTile> tiles = _saved.map((WordPair pair) {
        return ListTile(title: Text(pair.asPascalCase, style: _biggerFont));
      });
      final List<Widget> divided =
          ListTile.divideTiles(context: context, tiles: tiles).toList();

      return Scaffold(
          appBar: AppBar(title: Text('Saved Suggestions')),
          body: ListView(children: divided));
    }));
  }

  void _pushImageLayout() {
    Navigator.of(context)
        .push(MaterialPageRoute<void>(builder: (BuildContext context) {
      return Scaffold(
          appBar: AppBar(title: Text('Layout Tutorial')),
          body: Column(
            mainAxisSize: MainAxisSize.min,
            children: List<Widget>.filled(
                3,
                Expanded(
                    child: Center(
                  child: Image.asset('images/lake.jpg'),
                )),
                growable: true)
              ..add(Expanded(
                  child: Row(
                children: [
                  Expanded(child: Image.asset('images/lake.jpg')),
                  Expanded(
                    flex: 2,
                    child: Image.asset('images/lake.jpg'),
                  ),
                  Expanded(child: Image.asset('images/lake.jpg'))
                ],
              ))),
          ));
    }));
  }

  Widget _buildSuggestions() {
    return ListView.builder(
        padding: const EdgeInsets.all(0),
        itemBuilder: (context, i) {
          if (i.isOdd) return Divider();

          final index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(prefix0.generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        });
  }

  Widget _buildRow(WordPair pair) {
    final bool alreadySaved = _saved.contains(pair);

    return ListTile(
        title: Text(pair.asPascalCase, style: _biggerFont),
        trailing: Icon(alreadySaved ? Icons.favorite : Icons.favorite_border,
            color: alreadySaved ? Colors.red : null),
        onTap: () {
          setState(() {
            if (alreadySaved)
              _saved.remove(pair);
            else
              _saved.add(pair);
          });
        });
  }
}

class RandomWords extends StatefulWidget {
  @override
  RandomWordsState createState() => RandomWordsState();
}

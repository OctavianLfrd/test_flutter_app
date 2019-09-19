import 'package:flutter/material.dart';

class IconScreen extends StatelessWidget {

  final IconData _iconData;

  IconScreen(this._iconData);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search')),
      body: Center(
        child: Icon(_iconData, size: 200, color: Colors.black45,),
      ),
    );
  }
}
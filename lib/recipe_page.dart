import 'package:flutter/material.dart';

class RecipeDetails extends StatefulWidget {
  RecipeDetails({Key key, this.title}) : super(key: key);
  final String title;

  @override
  RecipeDetailsState createState() => RecipeDetailsState();
}

class RecipeDetailsState extends State<RecipeDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),

    );
  }
}

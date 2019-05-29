import 'package:flutter/material.dart';

class AddRecipe extends StatefulWidget {
  @override
  AddRecipeState createState() => AddRecipeState();
}

class AddRecipeState extends State<AddRecipe> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add new recipe'),
      ),
    );
  }
}


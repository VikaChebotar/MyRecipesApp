import 'package:flutter/material.dart';
import 'package:my_recipes_app/recipe_page.dart';

class MyHomePage extends StatefulWidget {
  @override
  MyHomePageState createState() => MyHomePageState();
}

class MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Recipes'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddRecipe()),
          );
        },
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
    );
  }
}

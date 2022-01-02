import 'package:flutter/material.dart';
//Models
import '../models/recipe_api.dart';
import '../models/recipe.dart';
//Custom widget
import 'package:myapp/views/widgets/recipe_card.dart';


class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Recipe> _recipes;
  bool _isLoading=true;

  Future<void> getRecipes()async{
    _recipes=await RecipeApi.getRecipe();
    setState(() {
      _isLoading=false;
    });
    print(_recipes);
  }

  @override
  void initState() {
    super.initState();
    getRecipes();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.restaurant_menu),
            SizedBox(width: 10,),
            Text(
              'Food Recipes'
              ),
          ],
        ),
      ),
      body: _isLoading
      ?Center(child: CircularProgressIndicator()):
      ListView.builder(
        itemCount: _recipes.length,
        itemBuilder: (context, index){
          return RecipeCard(
            title: _recipes[index].name, 
            rating: _recipes[index].rating.toString(), 
            cookTime: _recipes[index].totalTime, 
            thumbnailUrl: _recipes[index].images,
            );
        }
        )
    );
  }
}
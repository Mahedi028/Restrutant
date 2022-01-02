import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/recipe.dart';
// import 'package:flutter/services.dart' show rootBundle;

class RecipeApi{
  static Future<List<Recipe>> getRecipe()async{
       var uri=Uri.https('yummly2.p.rapidapi.com', '/feeds/list',
    {"limit": "18", "start": "0", "tag": "list.recipe.popular"}
    );
    final response=await http.get(uri, headers: {
      'x-rapidapi-key': '1a5ef178bfmsh2a73cc77eee2b83p15019fjsn266f55cf6429',
      'x-rapidapi-host': 'yummly2.p.rapidapi.com',
      "useQueryString":"true",
    });
    
    var data=jsonDecode(response.body);
    print(data);

    var _temp=[];
    for(var i in data['feed']){
      _temp.add(i['content']['details']);
    }
    return Recipe.recipesFromSnapshot(_temp);
    }
    
    }
   

   
  


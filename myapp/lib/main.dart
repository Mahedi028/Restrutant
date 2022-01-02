import 'package:flutter/material.dart';

//Pages
import 'package:myapp/views/home.dart';


void main()=>runApp(MyApp());

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sanny Restrutant',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        primaryColor: Colors.white,
        textTheme: TextTheme(
          bodyText2: TextStyle(
            color: Colors.white,
          )
        )
      ),
      home: HomePage(),
    );
  }
}
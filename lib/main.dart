import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../controllers/likes_controller.dart';
import '../controllers/movie_controller.dart';
import '../pages/home_page.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LikesController()),
        ChangeNotifierProvider(create: (_) => MovieController()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

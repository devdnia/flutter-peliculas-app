import 'package:flutter/material.dart';
import 'package:peliculas_app/screens/screens.dart';
import 'package:peliculas_app/themes/app_theme.dart';
import 'package:provider/provider.dart';
import 'package:peliculas_app/providers/movies_provider.dart';

void main() => runApp(const AppState());


class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // lazy: true, tan pronto es creado lo inicializa
        ChangeNotifierProvider(create: ( _ ) => MoviesProvider(), lazy: false, ),
      ], 
      child: const MyApp(),
      
    );
  }
}

class MyApp extends StatelessWidget {

  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Películas',
      initialRoute: 'home',
      routes: {
        'home'    : ( _ ) => const HomeScreen(),
        'details' : ( _ ) => const DetailsScreen()
      },
      // Personalizcaión del tema de la app, llamamos a nuestra clase AppTheme
      theme: AppTheme.lightTheme,
    );
  }
}
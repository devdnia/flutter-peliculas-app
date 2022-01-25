import 'package:flutter/material.dart';
import 'package:peliculas_app/providers/movies_provider.dart';
import 'package:peliculas_app/widgets/widgets.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final moviesProvider = Provider.of<MoviesProvider>(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Películas en cines'),
          actions: [
            IconButton(
              icon: const Icon(Icons.search_outlined),
              onPressed: () {}
              
              // => showSearch(
              //   context: context, 
              //   delegate: delegate
              //   ),
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              // Tarjetas principales
              CardSwiper(movies: moviesProvider.onDisplayMovies),

              // Slider de peliculas
              MovieSlider(
                  movies: moviesProvider.popularMovies,
                  title: 'Populares',
                  onNextPage: () => moviesProvider.getPopularMovies(),
                  ),
            ],
          ),
        ));
  }
}

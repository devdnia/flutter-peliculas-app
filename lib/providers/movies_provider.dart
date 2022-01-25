import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:peliculas_app/models/models.dart';

class MoviesProvider extends ChangeNotifier {
  final String _apiKey = 'fea69a9e754c432ccfcd19325a63a24f';
  final String _baseUrl = 'api.themoviedb.org';
  final String _language = 'es-ES';

  List<Movie> onDisplayMovies = [];
  List<Movie> popularMovies = [];

  Map<int, List<Cast>> moviesCast = {};

  int _popularPage = 0;

  MoviesProvider() {
    getOnDisplayMovies();
    getPopularMovies();
  }

  Future<String> _getJsonData(String endpoint, [int page = 1]) async {
    final Uri url = Uri.https(_baseUrl, endpoint, {
      'api_key': _apiKey,
      'language': _language,
      'page': '$page',
    });

    final response = await http.get(url);

    return response.body;
  }

  getOnDisplayMovies() async {
    final jsonData = await _getJsonData('3/movie/now_playing');

    // Convertir en mapa para manejar los datos
    final nowPlayingResponse = NowPlayingResponse.fromJson(jsonData);

    // Asigno el resultado https a la lista de movies
    onDisplayMovies = nowPlayingResponse.results;

    // Redibujar widgets necesarios
    notifyListeners();
  }

  getPopularMovies() async {
    _popularPage++;

    final jsonData = await _getJsonData('3/movie/popular', _popularPage);
    // Convertir en mapa para manejar los datos
    final popularResponse = PopularResponse.fromJson(jsonData);
    // Asigno el resultado https a la lista de movies
    popularMovies = [...popularMovies, ...popularResponse.results];
    // Redibujar widgets necesarios
    notifyListeners();
  }

  Future<List<Cast>> getMovieCast(int movieId) async {
    
    // Si ya existe devuevlo la lista con ese ID y solo hace la petición una vez
    if (moviesCast.containsKey(movieId)) return moviesCast[movieId]!;
    

    final jsonData = await _getJsonData('3/movie/$movieId/credits');
    final creditsResponse = CreditsReponse.fromJson(jsonData);

    moviesCast[movieId] = creditsResponse.cast;

    return creditsResponse.cast;
  }
}

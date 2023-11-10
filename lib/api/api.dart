import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies2/widget/constants.dart';
import '../models/movie.dart';

class Api {
  static const _trendingUrl =
      "https://api.themoviedb.org/3/discover/movie?api_key=${Constants.apiKey}";
  static const _topRatedUrl =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}";
  static const _upcomingMoviesUrl =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}";
  static const _tvEpisodes=
  "https://api.themoviedb.org/3/discover/tv?api_key=${Constants.apiKey}";
  static const _nowPlaying=
  "https://api.themoviedb.org/3/movie/now_playing?api_key=${Constants.apiKey}";


  Future<List<Movie>> getTrendingMovies()async{
    final response= await http.get(Uri.parse(_trendingUrl));
    if(response.statusCode==200){
      var decodedData=json.decode(response.body)['results']as List;
      return decodedData.map((movie)=>Movie.fromJson(movie)).toList();
    }else{
      throw Exception('Something happend');
    }
  }
  Future<List<Movie>> getTopRatedMovies()async{
    final response= await http.get(Uri.parse(_topRatedUrl));
    if(response.statusCode==200){
      var decodedData=json.decode(response.body)['results']as List;
      return decodedData.map((movie)=>Movie.fromJson(movie)).toList();
    }else{
      throw Exception('Something happend');
    }
  }
  Future<List<Movie>> getUpcomingMovies()async{
    final response= await http.get(Uri.parse(_upcomingMoviesUrl));
    if(response.statusCode==200){
      var decodedData=json.decode(response.body)['results']as List;
      return decodedData.map((movie)=>Movie.fromJson(movie)).toList();
    }else{
      throw Exception('Something happend');
    }
  }
  Future<List<Movie>> getTvEpisodes()async{
    final response= await http.get(Uri.parse(_tvEpisodes));
    if(response.statusCode==200){
      var decodedData=json.decode(response.body)['results']as List;
      return decodedData.map((movie)=>Movie.fromJson(movie)).toList();
    }else{
      throw Exception('Something happend');
    }
  }
  Future<List<Movie>> getNowPlaying()async{
    final response= await http.get(Uri.parse(_nowPlaying));
    if(response.statusCode==200){
      var decodedData=json.decode(response.body)['results']as List;
      return decodedData.map((movie)=>Movie.fromJson(movie)).toList();
    }else{
      throw Exception('Something happend');
    }
  }
}
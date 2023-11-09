import 'package:flutter/material.dart';
import 'package:movies2/models/movie.dart';
import 'package:movies2/screens/detailesscreen.dart';

class Movieslider extends StatelessWidget {
  Movieslider({super.key, required this.TopratedMovies});

  List<Movie>? TopratedMovies;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemCount: TopratedMovies!.length,
        itemBuilder: (context, index) {
          final movie = TopratedMovies![index].posterPath;
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: (){
                Navigator.push(
                  context, MaterialPageRoute(
                  builder: (context) => DetailsScreen(movie:TopratedMovies![index],
                  ),
                ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: SizedBox(
                  height: 200,
                  width: 150,
                  child: Image.network( 'https://image.tmdb.org/t/p/original${movie}',
                      filterQuality: FilterQuality.high,
                      fit: BoxFit.cover),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
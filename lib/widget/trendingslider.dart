import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movies2/models/movie.dart';
import 'package:movies2/screens/detailesscreen.dart';

class TrendingSlider extends StatelessWidget {
  final List<Movie>? Discovermovies;

  TrendingSlider({required this.Discovermovies});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      // this is dependency it is the slider motion
      child: CarouselSlider.builder(
        itemCount:Discovermovies!.length,
        options: CarouselOptions(
            height: 400,
            autoPlay: true,
            viewportFraction: 0.55,

            // it is the the container enlarged

            enlargeCenterPage: true,
            pageSnapping: true,
            autoPlayCurve: Curves.fastOutSlowIn,
            autoPlayAnimationDuration: Duration(seconds: 1)
        ),
        itemBuilder: (context,itemIndex,pageViewIndex){
          // class orooo index call cheythh movie name store
          final movie = Discovermovies![itemIndex];
          // clipRReact is the the container is circular

          return GestureDetector(
            onTap: (){
              Navigator.push(
                context, MaterialPageRoute(
                builder: (context) => DetailsScreen(movie:Discovermovies![itemIndex],
                ),
              ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Column(
                children: [
                  Container(
                    height: 300,
                    width: 200,
                    decoration: BoxDecoration(

                      image: DecorationImage(
                        image: NetworkImage(

                          'https://image.tmdb.org/t/p/original${movie.posterPath}',
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),

                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
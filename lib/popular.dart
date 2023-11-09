import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies2/models/movie.dart';
import 'package:movies2/screens/detailesscreen.dart';

class Popular extends StatelessWidget {
  final List<Movie>? Popularmovie;
  const Popular({super.key, required this.Popularmovie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(
          child: Text(
            "Populllllar Movies",
            style: GoogleFonts.abhayaLibre(
                color: Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.bold,
                letterSpacing: 2),
          ),
        ),
      ),
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
                scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                itemCount: Popularmovie!.length,
                itemBuilder: (context, index) {
                  final movie = Popularmovie![index].posterPath;
                  return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => DetailsScreen(
                              movie: Popularmovie![index],
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
                                      'https://image.tmdb.org/t/p/original${movie}',
                                    ),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),

                            ],
                          ),
                        ),
                      ));
                }),
      )
      );
  }
}

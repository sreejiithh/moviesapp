import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies2/api/api.dart';
import 'package:movies2/models/movie.dart';
import 'package:movies2/popular.dart';
import 'package:movies2/tvepisodes.dart';
import 'package:movies2/widget/loadingskeleton.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'colors.dart';
import 'movieslider.dart';
import 'trendingslider.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late Future<List<Movie>> discoverMovies;
  late Future<List<Movie>> topRatedMovies;
  late Future<List<Movie>> upComingMovies;
  late Future<List<Movie>> tvEpisode;
  late Future<List<Movie>> popularmovie;

  @override
  initState() {
    super.initState();
    discoverMovies = Api().getTrendingMovies();
    topRatedMovies = Api().getTopRatedMovies();
    upComingMovies = Api().getUpcomingMovies();
    tvEpisode = Api().getTvEpisodes();
    popularmovie = Api().getPopular();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          title: Center(
            child: Text(
              "Film Flix",
              style: GoogleFonts.abhayaLibre(
                  fontSize: 26, fontWeight: FontWeight.bold),
            ),
          )),
      drawer: Drawer(
          backgroundColor: Colors.black,
          surfaceTintColor: Colors.white,
          child: Column(
            children: [
              DrawerHeader(
                  child: Text(
                "Film Flix",
                style: GoogleFonts.abhayaLibre(
                    fontSize: 26, fontWeight: FontWeight.bold),
              )),
            FutureBuilder(future: tvEpisode, builder: (context,snapshot){
              final Tvepisode= snapshot.data;
              return   ListTile(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Tvepisodes(TvEpisode: Tvepisode,),));
                },
                leading: Icon(
                  Icons.tv,
                ),
                title: Text(
                  "TV Episodes",
                  style: GoogleFonts.aBeeZee(fontSize: 16,letterSpacing: 2),
                ),
              );
            }),
             FutureBuilder(future: popularmovie, builder: (context,snapshot){
               final Popularmovie=snapshot.data;
               return  ListTile(
                 onTap: () {
                   Navigator.push(context, MaterialPageRoute(builder: (context) => Popular(Popularmovie: Popularmovie,),));
                 },
                 leading: Icon(
                   Icons.trending_up,
                 ),
                 title: Text(
                   "Popular",
                   style: GoogleFonts.aBeeZee(fontSize: 16,letterSpacing: 2),
                 ),
               );
             })
            ],
          )),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Trending Movies", style: GoogleFonts.aBeeZee(fontSize: 25)),
              SizedBox(
                height: 32,
              ),
              //create a class

              FutureBuilder<List<Movie>>(
                future: discoverMovies,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      // Handle error
                      return Text("Error: ${snapshot.error}");
                    }
                    final movieList = snapshot.data;
                    return TrendingSlider(
                      Discovermovies: movieList,
                    );
                  } else {
                    // Show a loading indicator or placeholder widget
                    return Skeletonizer(child: LoadingSkeleton(),
                    enabled: true,);
                  }
                },
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                "Top Rated Movies",
                style: GoogleFonts.aBeeZee(
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 32,
              ),

              FutureBuilder<List<Movie>>(
                future: topRatedMovies,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      // Handle error
                      return Text("Error: ${snapshot.error}");
                    }
                    final topRatedMovies = snapshot.data;
                    return Movieslider(
                      TopratedMovies: topRatedMovies,
                    );
                  } else {
                    // Show a loading indicator or placeholder widget
                    return LoadingSkeleton();
                  }
                },
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                "upcoming Movies",
                style: GoogleFonts.aBeeZee(
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 32,
              ),

              FutureBuilder<List<Movie>>(
                future: upComingMovies,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      // Handle error
                      return Text("Error: ${snapshot.error}");
                    }
                    final upcomingmovies = snapshot.data;
                    return Movieslider(
                      TopratedMovies: upcomingmovies,
                    );
                  } else {
                    // Show a loading indicator or placeholder widget
                    return LoadingSkeleton();
                  }
                },
              ),
              SizedBox(
                height: 32,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

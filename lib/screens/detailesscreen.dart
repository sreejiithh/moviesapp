import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movies2/models/movie.dart';
import 'package:movies2/widget/colors.dart';


class DetailsScreen extends StatelessWidget {
  const DetailsScreen({super.key, required this.movie});

  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.scaffoldBgcolor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            leading: BackButton(),
            backgroundColor:  Colours.scaffoldBgcolor,
            expandedHeight: 400,
            pinned: true,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text(
                movie.title,
                style: GoogleFonts.belleza(
                    fontSize: 17, fontWeight: FontWeight.w800),
              ),
              background: ClipRRect(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(24),
                    bottomRight: Radius.circular(24)),
                child: Image.network(
                  'https://image.tmdb.org/t/p/original${movie.backDropPath}',
                  filterQuality: FilterQuality.high,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Overview",
                    style: GoogleFonts.openSans(
                        fontSize: 30, fontWeight: FontWeight.w800),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(
                    movie.overview,
                    style: GoogleFonts.roboto(
                        fontSize: 25, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    child: Column(

                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            width: 400,
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(movie!.releaseDate!="No Data Available" ?
                              "Release date : ${movie!.releaseDate}" :
                                 movie!.mediaType=="No Data Available"? "Media Type : No Data Available ":"Media Type : ${movie.mediaType}"  ,
                                  style: GoogleFonts.roboto(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold)),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Container(
                            decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("Rating : ${movie.voteAverge.toStringAsFixed(1)}/10",
                                      style: GoogleFonts.roboto(
                                          fontSize: 17,
                                          fontWeight: FontWeight.bold)),
                                ),
                                Icon(
                                  Icons.star,
                                  color: Colors.amberAccent,
                                ),

                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
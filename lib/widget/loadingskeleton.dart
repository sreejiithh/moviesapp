import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class LoadingSkeleton extends StatelessWidget {
  const LoadingSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
          itemCount: 10,
          options: CarouselOptions(
              height: 400,
              autoPlay: true,
              viewportFraction: 0.55,
              enlargeCenterPage: true,
              pageSnapping: true,
              autoPlayCurve: Curves.fastOutSlowIn,
              autoPlayAnimationDuration: Duration(seconds: 1)),
      itemBuilder: (context,itemIndex,pageViewIndex){
            return ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Column(
                children: [
                  Container(
                    height: 300,
                    width: 200,
                  )
                ],
              ),
            );
      },
      ),
    );
  }
}

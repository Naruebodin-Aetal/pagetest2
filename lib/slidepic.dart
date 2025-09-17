import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SlidePic extends StatelessWidget {
  const SlidePic({super.key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 200.0,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 5),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        enlargeCenterPage: true,
        viewportFraction: 0.8,
        aspectRatio: 16 / 9,
        initialPage: 0,
      ),
      items: [
        'assets/images/slide1.jpg',
        'assets/images/slide2.jpg',
        'assets/images/slide3.jpg',
      ].map((i) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5.0),
              decoration: BoxDecoration(
                color: Colors.amber,
              ),
              child: Image.asset(i, fit: BoxFit.cover),
            );
          },
        );
      }).toList(),
    );
  }
}
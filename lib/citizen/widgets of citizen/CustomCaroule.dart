import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'quotes.dart';

class CustomCaroule extends StatelessWidget {
  const CustomCaroule({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 350,
      child: CarouselSlider(
        options: CarouselOptions(
          aspectRatio: 1.0,
          autoPlay: true,
          enlargeCenterPage: true,
        ),
        items: List.generate(imageSliders.length,
              (index) => Card(
            elevation: 5.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20)
            ),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(imageSliders[index])
                ),
              ),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(colors: [
                    Colors.black.withOpacity(0.5),
                    Colors.transparent,
                  ]),
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 8,left: 8),
                    child: Text(
                      articleTitle[index],
                      style:GoogleFonts.laila(fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width*0.05,
                      ) ,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
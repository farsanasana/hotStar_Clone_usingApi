import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';
import 'package:newwhost/Api_function/Function.dart';

class SlideScreen extends StatefulWidget {
  const SlideScreen({super.key});

  @override
  _SlideScreenState createState() => _SlideScreenState();
}

class _SlideScreenState extends State<SlideScreen> {
  List<dynamic> movies = [];

  @override
  void initState() {
    super.initState();
    fetchUpComing();
  }

  Future<void> fetchUpComing() async {
    try {
      final url =
          'https://api.themoviedb.org/3/movie/upcoming?api_key=$apikey&language=en-US&page=1';

      final uri = Uri.parse(url);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final body = response.body;
        final items = jsonDecode(body);
        setState(() {
          movies = items['results']; // Update the movies list in the state
        });
      } else {
        // Handle error if the response status code is not 200
        throw Exception('Failed to load movies');
      }
    } catch (error) {
      // Handle any errors that occur during the fetchMovies operation
      stdout.write('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: movies.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SizedBox(
              child: CarouselSlider.builder(
                itemCount: movies.length,
                itemBuilder: (BuildContext context, int index, int realIndex) {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Expanded(
                        child: Image.network(
                          'https://image.tmdb.org/t/p/w500${movies[index]['poster_path']}',
                          fit: BoxFit.fill,
                          width: double.infinity,
                        ),
                      ),
                      // SizedBox(height: 10),
                      Text(
                        movies[index]['title'],
                        style: const TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                      // SizedBox(height: 5),
                      // Text(
                      //   movies[index]['overview'],
                      //   textAlign: TextAlign.center,
                      // ),
                    ],
                  );
                },
                options: CarouselOptions(
                  aspectRatio: 14 / 12,
                  viewportFraction: 0.8,
                  height: 350,

                  // initialPage: 0,
                  // enableInfiniteScroll: true,
                  // reverse: false,
                  autoPlay: true,
                  autoPlayInterval: const Duration(seconds: 3),
                  autoPlayAnimationDuration: const Duration(milliseconds: 800),
                  autoPlayCurve: Curves.fastOutSlowIn,
                  enlargeCenterPage: true,
                  scrollDirection: Axis.horizontal,
                ),
              ),
            ),
    );
  }
}

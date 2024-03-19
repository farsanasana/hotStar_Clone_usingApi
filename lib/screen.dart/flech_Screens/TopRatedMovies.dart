import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'package:newwhost/Api_function/Function.dart';
import 'package:newwhost/screen.dart/flech_Screens/detailedScreen.dart';

// ignore: must_be_immutable
class TopRatedMovies extends StatefulWidget {
  TopRatedMovies({
    super.key,
  });

  @override
  _TopRatedMoviesState createState() => _TopRatedMoviesState();
}

class _TopRatedMoviesState extends State<TopRatedMovies> {
  List<dynamic> TopRated = [];

  @override
  void initState() {
    super.initState();
    flechTopRated();
  }

  Future<void> flechTopRated() async {
    try {
      final url =
          'https://api.themoviedb.org/3/movie/top_rated?api_key=$apikey&language=en-US';
      final uri = Uri.parse(url);
      final response = await http.get(uri);
      if (response.statusCode == 200) {
        final body = response.body;
        final items = jsonDecode(body);
        setState(() {
          TopRated = items['results']; // Update the movies list in the state
        });
      } else {
        // Handle error if the response status code is not 200
        throw Exception('Failed to load movies');
      }
    } catch (error) {
      // Handle any errors that occur during the flechTopRated operation
      stdout.write('Error: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 250,
      padding: const EdgeInsets.all(8.0),
      child: TopRated.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: TopRated.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 6),
                  child: GestureDetector(
                    child: SizedBox(
                      width: 150,
                      child: Image.network(
                        'https://image.tmdb.org/t/p/w500${TopRated[index]['poster_path']}',
                        fit: BoxFit.cover,
                        // width: double.infinity,
                        // height: 300, // Adjust the height as needed
                      ),
                    ),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ViewScreen(
                                details: TopRated[index],
                              )));
                    },
                  ),
                );
              },
            ),
    );
  }
}

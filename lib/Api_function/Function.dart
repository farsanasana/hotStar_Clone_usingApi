import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

// ValueNotifier<List<dynamic>> MoviesList = ValueNotifier([]);
// ValueNotifier<List<dynamic>> latestRelesenoti = ValueNotifier([]);

String apikey = "b92609503dd6f9c41732337cbe67321b";
String imageUrl = "https://image.tmdb.org/t/p/w500";
String acesstokenauth =
    "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiOTI2MDk1MDNkZDZmOWM0MTczMjMzN2NiZTY3MzIxYiIsInN1YiI6IjY1ZjJiMGJhNDcwZWFkMDE2MjlkN2E5MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.nPA6czU6WV1pvVhMh0tygJRzS_n7JodgrxgrRRaIFF8";
ValueNotifier<bool> isLoading = ValueNotifier(false);
ValueNotifier<List<dynamic>> searchMovieTitles = ValueNotifier([]);
ValueNotifier<List<dynamic>> TopRated = ValueNotifier([]);
ValueNotifier<List<dynamic>> horrotmovies = ValueNotifier([]);

mediaqueryheight(double size, BuildContext context) {
  return MediaQuery.of(context).size.height * size;
}

mediaquerywidth(double size, BuildContext context) {
  return MediaQuery.of(context).size.width * size;
}

// ignore: must_be_immutable
class Profile extends StatelessWidget {
  final String imageurl;
  final String name;
  const Profile({
    super.key,
    required this.imageurl,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            ClipOval(
              child: Image.network(
                imageurl,
                width: 60,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 12,
        ),
        Text(
          name,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}

topratedmovies() async {
  try {
    final url =
        'https://api.themoviedb.org/3/movie/top_rated?api_key=$apikey&language=en-US';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final items = jsonDecode(body);
      TopRated.value = items["results"];
      stdout.write(TopRated.value);
    }
  } catch (error) {
    stdout.write('Error :$error');
  }
}

loadhorror() async {
  try {
    final url =
        'https://api.themoviedb.org/3/trending/movie/week?api_key=$apikey&language=en-US&page=1';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final body = response.body;
      final items = jsonDecode(body);
      horrotmovies.value = items["results"];
      stdout.write(horrotmovies.value);
    }
  } catch (error) {
    stdout.write('Error :$error');
  }
}

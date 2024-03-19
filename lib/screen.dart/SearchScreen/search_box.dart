import 'dart:convert';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:newwhost/Api_function/Function.dart';

class Debouncer {
  final Duration delay;
  Timer? _timer;

  Debouncer({required this.delay});

  void run(VoidCallback callback) {
    _timer?.cancel();
    _timer = Timer(delay, callback);
  }
}

final Debouncer _debouncer = Debouncer(delay: Duration(milliseconds: 500));

Padding searchBox(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5),
    child: Container(
      width: double.infinity,
      height: mediaqueryheight(0.06, context),
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        children: [
          SizedBox(
            width: mediaquerywidth(0.05, context),
          ),
          const Icon(Icons.search),
          SizedBox(
            width: mediaquerywidth(0.05, context),
          ),
          Expanded(
            child: TextField(
              onChanged: (value) {
                isLoading.value = true;
                _debouncer.run(() {
                  searchMoviesAndTvShows(value);
                });
              },
              showCursor: true,
              textAlign: TextAlign.start,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: "Search games, shows, movies...",
              ),
            ),
          ),
          SizedBox(width: mediaquerywidth(0.05, context)),
          const Icon(Icons.mic),
          SizedBox(
            width: mediaquerywidth(0.05, context),
          ),
        ],
      ),
    ),
  );
}

searchMoviesAndTvShows(String query) async {
  isLoading.value = true;
  searchMovieTitles.value.clear();
  final url =
      "https://api.themoviedb.org/3/search/multi?query=$query&api_key=$apikey&include_adult=false&language=en-US";
  final uri = Uri.parse(url);
  final res = await http.get(uri);
  if (res.statusCode == 200) {
    final body = res.body;
    final items = jsonDecode(body);
    searchMovieTitles.value = items['results'];
    // print("shadin${searchMovieTitles.value}");
    // ignore: invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member
    searchMovieTitles.notifyListeners();
    isLoading.value = false;
    // ignore: invalid_use_of_protected_member, invalid_use_of_visible_for_testing_member
    isLoading.notifyListeners();
  }
}

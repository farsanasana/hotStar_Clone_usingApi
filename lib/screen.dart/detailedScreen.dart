import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:newwhost/screen.dart/flech_movies/leatestRelease.dart';
import 'package:newwhost/screen.dart/homepage.dart';

class ViewScreen extends StatefulWidget {
  final dynamic details;

  const ViewScreen({Key? key, required this.details}) : super(key: key);

  @override
  _ViewScreenState createState() => _ViewScreenState();
}

class _ViewScreenState extends State<ViewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 240, // Provide a fixed height for the container
              child: Stack(
                children: [
                  Image.network(
                    'https://image.tmdb.org/t/p/w500${widget.details['poster_path']}',
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                  ),
                  Positioned(
                    top: 40,
                    right: 14,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(Icons.cancel, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            Text(
              widget.details['title'] ?? widget.details['name'],
              style: const TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 10),
            Column(
              children: [
                Text(
                    'Released Date :   ${widget.details['release_date'] ?? 'Released Soon'}',
                    style: TextStyle(color: Colors.white)),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'LanguageS :  ${widget.details['original_language'] ?? 'Released Soon'}  | HINDI | TAMIL | MALAYALAM',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                height: 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    Text(
                      'Subcribe to Watch',
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
            ),
            const Text(
              '| ACTION | DRAMA | THRILLER | FRIENDSHIP |',
              overflow: TextOverflow.ellipsis,
              style: TextStyle(color: Colors.white),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(6.0),
              child: Text(
                widget.details['overview'] ?? 'Details will not be provided',
                style: const TextStyle(color: Colors.white54),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  children: [
                    Icon(Icons.add, size: 30, color: Colors.white),
                    Text(
                      'Watchlist',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.share, size: 30, color: Colors.white),
                    Text('Share', style: TextStyle(color: Colors.white)),
                  ],
                ),
                Column(
                  children: [
                    Icon(Icons.download_sharp, size: 30, color: Colors.white),
                    Text('Download', style: TextStyle(color: Colors.white)),
                  ],
                )
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            const Padding(
              padding: EdgeInsets.only(right: 200),
              child: Text(
                'More Like This',
                style: TextStyle(
                    fontWeight: FontWeight.normal,
                    fontSize: 23,
                    color: Colors.white),
              ),
            ),
            const SizedBox(height: 400, child: HomeScreen()),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}

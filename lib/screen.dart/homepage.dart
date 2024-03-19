import 'package:flutter/material.dart';
import 'package:newwhost/Api_function/Function.dart';
import 'package:newwhost/screen.dart/flech_Screens/PopularMovies.dart';
import 'package:newwhost/screen.dart/flech_Screens/TopRatedMovies.dart';
import 'package:newwhost/screen.dart/flech_Screens/leatestRelease.dart';
import 'package:newwhost/screen.dart/flech_Screens/slideScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                const SlideScreen(),
                Column(
                  children: [
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Image.asset(
                          'assets/hot.png',
                          height: 100,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(right: 30),
                          child: Icon(
                            Icons.cast,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(136, 76, 75, 75),
                    ),
                    height: 50,
                    width: 230,
                    child: const Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.play_arrow_rounded,
                            color: Colors.white,
                          ),
                          Text(
                            'Watch Now',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                InkWell(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(136, 76, 75, 75),
                    ),
                    height: 50,
                    width: 50,
                    child: const Center(
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                          Icon(
                            Icons.add_rounded,
                            color: Colors.white,
                          ),
                        ])),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Latest Releases',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white),
                ),
                Icon(Icons.keyboard_arrow_right_outlined)
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            LetestReleaseScreen(),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Top Rated Movies ',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white),
                ),
                Icon(Icons.keyboard_arrow_right_outlined)
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            TopRatedMovies(),
            const SizedBox(
              height: 10,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular Movies',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                      color: Colors.white),
                ),
                Icon(Icons.keyboard_arrow_right_outlined)
              ],
            ),
            const SizedBox(
              height: 8,
            ),
            PopularMovies(),
          ],
        ),
      ),
    );
  }
}

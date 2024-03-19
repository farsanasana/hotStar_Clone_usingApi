// ignore_for_file: avoid_unnecessary_containers

import 'package:flutter/material.dart';
import 'package:newwhost/Api_function/Function.dart';

// ignore: must_be_immutable
class ComingsoonScreen extends StatelessWidget {
  Future<void> futurefunction;
  ValueNotifier<List<dynamic>> valueNotifier;

  ComingsoonScreen({
    super.key,
    required this.futurefunction,
    required this.valueNotifier,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: FutureBuilder(
        future: futurefunction,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Text('error: ${snapshot.error}');
          } else {
            return Expanded(
              child: ListView.builder(
                itemCount: valueNotifier.value.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Container(
                        height: 300,
                        color: Colors.grey,
                        child: Image.network(
                          imageUrl +
                              valueNotifier.value[index]['backdrop_path'],
                          fit: BoxFit.cover,
                        ),
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 180),
                            child: Text(
                              valueNotifier.value[index]['title'],
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 28,
                                  color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(6.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Language : ${valueNotifier.value[index]['original_language']}',
                                  style: TextStyle(color: Colors.white),
                                ),
                                Text(
                                    'Released Date : ${valueNotifier.value[index]['release_date']}',
                                    style: TextStyle(color: Colors.white))
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(4.0),
                            child: Text(
                              valueNotifier.value[index]['overview'],
                              maxLines: 2,
                              style: const TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.white),
                            ),
                          ),
                          const SizedBox(
                            height: 25,
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
                                    'Watch Now',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      )
                    ],
                  );
                },
              ),
            );
          }
        },
      ),
    );
  }
}

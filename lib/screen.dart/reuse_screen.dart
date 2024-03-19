// import 'package:flutter/material.dart';

// ValueNotifier<List<dynamic>> latestrelease = ValueNotifier([]);

// // ignore: must_be_immutable
// class Latestrelease extends StatelessWidget {
//   Future<void> futurefunction;
//   ValueNotifier<List<dynamic>> valueNotifier;

//   Latestrelease(
//       {super.key, required this.valueNotifier, required this.futurefunction});

//   @override
//   Widget build(BuildContext context) {
//     return FutureBuilder(
//         future: futurefunction,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const CircularProgressIndicator();
//           } else if (snapshot.hasError) {
//             return Text('error :${snapshot.error}');
//           } else {
//             return Container(
//               height: 250,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(12),
//               ),
//               child: ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: valueNotifier.value.length,
//                 itemBuilder: (context, index) {
//                   return GestureDetector(
//                     child: Padding(
//                       padding: const EdgeInsets.only(right: 6),
//                       child: Container(
//                         color: Colors.grey,
//                         child: Image.network(
//                           imageUrl + valueNotifier.value[index]['poster_path'],
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                     ),
//                     onTap: () {
//                       Navigator.of(context).push(MaterialPageRoute(
//                           builder: (context) => ViewScreen(
//                                 index: index,
//                                 valueNotifier: valueNotifier,
//                               )));
//                     },
//                   );
//                 },
//               ),
//             );
//           }
//         });
//   }
// }

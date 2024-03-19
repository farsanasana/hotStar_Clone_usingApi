import 'package:flutter/material.dart';
import 'package:newwhost/Api_function/Function.dart';
import 'package:newwhost/screen.dart/SearchScreen/search_box.dart';
import 'package:newwhost/screen.dart/SearchScreen/searchdisplay_screen.dart';
import 'package:newwhost/screen.dart/flech_Screens/detailedScreen.dart';

class searchscreen extends StatelessWidget {
  const searchscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back,
              color: Colors.white,
            )),
        actions: [
          const Icon(
            Icons.cast,
            size: 20,
            color: Colors.white,
          ),
          SizedBox(
            width: mediaqueryheight(0.02, context),
          ),
        ],
      ),
      body: SafeArea(
          child: Column(
        children: [
          searchBox(context),
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: mediaqueryheight(
                    0.02,
                    context,
                  ),
                  vertical: mediaqueryheight(0.0, context)),
              child: ValueListenableBuilder(
                valueListenable: searchMovieTitles,
                builder: (context, value, child) {
                  return isLoading.value == true
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : value.isEmpty
                          ? const Expanded(
                              child: Center(
                              child: Text(
                                "No results found",
                                style: TextStyle(
                                    fontSize: 16, color: Colors.white),
                              ),
                            ))
                          : ListView.builder(
                              itemCount: searchMovieTitles.value.length,
                              itemBuilder: (context, index) {
                                String title = value[index]['title'] ??
                                    value[index]['name'];
                                late String? url;
                                if (value[index]["poster_path"] != null) {
                                  url = value[index]["poster_path"];
                                } else {
                                  url = value[index]["backdrop_path"];
                                }

                                String urls = url != null
                                    ? imageUrl + url
                                    : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcThW3vszDScLtuavCM31FfcECi3KJ9-wo2HqnX1wB0ewQ&s";

                                return SizedBox(
                                  height: mediaqueryheight(0.1, context),
                                  child: GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                              builder: (context) => ViewScreen(
                                                    details: searchMovieTitles,
                                                  )));
                                    },
                                    child: SearchListTileDisplay(
                                        urls: urls, title: title),
                                  ),
                                );
                              },
                            );
                },
              ),
            ),
          )
        ],
      )),
    );
  }
}

import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:newwhost/screen.dart/slideScreen.dart';
import 'package:http/http.dart ' as http;

ValueNotifier<List<dynamic>> MoviesList = ValueNotifier([]);
ValueNotifier<List<dynamic>> latestRelesenoti = ValueNotifier([]);
ValueNotifier<List<dynamic>> romanticmovie = ValueNotifier([]);
String apikey = "b92609503dd6f9c41732337cbe67321b";

String acesstokenauth =
    "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJiOTI2MDk1MDNkZDZmOWM0MTczMjMzN2NiZTY3MzIxYiIsInN1YiI6IjY1ZjJiMGJhNDcwZWFkMDE2MjlkN2E5MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.nPA6czU6WV1pvVhMh0tygJRzS_n7JodgrxgrRRaIFF8";

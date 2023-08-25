import 'dart:convert';

import 'package:cricket_score/api.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

Future<List<CricScores>> fetchCricScore() async {
  var result = await http.get(Uri.parse(ApiConstants.cricScores));
  if (result.statusCode == 200) {
    return compute(parseCricScore, result.body);
  } else {
    throw Exception('Failed to load album');
  }
}

List<CricScores> parseCricScore(String responseBody) {
  final parsed = jsonDecode(responseBody)['data'].cast<Map<String, dynamic>>();
  return parsed.map<CricScores>((json) => CricScores.fromJson(json)).toList();
}

class CricScores {
  final String id;
  final String matchType;
  final String status;
  final String t1;
  final String t2;
  final String t1s;
  final String t2s;
  final String t1img;
  final String t2img;

  const CricScores({
    required this.id,
    required this.matchType,
    required this.status,
    required this.t1,
    required this.t2,
    required this.t1s,
    required this.t2s,
    required this.t1img,
    required this.t2img,
  });

  factory CricScores.fromJson(Map<String, dynamic> json) {
    return CricScores(
      id: json['id'] as String,
      matchType: json['matchType'] as String,
      status: json['status'] as String,
      t1: json['t1'] as String,
      t2: json['t2'] as String,
      t1s: json['t1s'].toString().isEmpty ? "0(0)" : json['t1s'].toString(),
      t2s: json['t2s'].toString().isEmpty ? "0(0)" : json['t2s'].toString(),
      t1img: json['t1img'] != null
          ? json['t1img'] as String
          : "https://h.cricapi.com/img/icon512.png",
      t2img: json['t2img'] != null
          ? json['t2img'] as String
          : "https://h.cricapi.com/img/icon512.png",
    );
  }
}

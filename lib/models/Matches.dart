import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

import '../api.dart';

Future<List<Matches>> fetchCurrentMatches() async {
  var result = await http.get(Uri.parse(ApiConstants.currentMatches));
  if (result.statusCode == 200) {
    return compute(parseCurrentMatches, result.body);
  } else {
    throw Exception('Failed to load album');
  }
}

List<Matches> parseCurrentMatches(String responseBody) {
  final parsed = jsonDecode(responseBody)["data"].cast<Map<String, dynamic>>();
  return parsed.map<Matches>((json) => Matches.fromJson(json)).toList();
}

class Matches {
  final String id;
  final String name;
  final String status;
  final List teams;
  final List score;
  final teamInfo;

  const Matches({
    required this.id,
    required this.name,
    required this.status,
    required this.teams,
    required this.score,
    required this.teamInfo,
  });

  factory Matches.fromJson(Map<String, dynamic> json) {
    return Matches(
      id: json['id'] as String,
      name: json['name'] as String,
      status: json['status'] as String,
      teams: json['teams'] as List,
      score: json['score'] as List,
      teamInfo: json['teamInfo'],
    );
  }
}

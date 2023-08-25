import 'package:cricket_score/Widgets/cricScoresPanel.dart';
import 'package:cricket_score/api.dart';
import 'package:cricket_score/models/CricScores.dart';
import 'package:cricket_score/models/Matches.dart';
import 'package:flutter/material.dart';

import 'Widgets/currentMatchesPanel.dart';
import 'consts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Live Cricket Score"),
        ),
        body: SafeArea(
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20.0,
                ),
                child: Row(
                  children: [
                    TextButton(
                      onPressed: () {},
                      child: Text('Current Matches'),
                      style: TextButton.styleFrom(
                        side: matchesButtonStyle,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text('CricScores'),
                      style: TextButton.styleFrom(
                        side: matchesButtonStyle,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: ApiConstants.matchType
                      ? fetchCurrentMatches()
                      : fetchCricScore(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: Colors.lightBlueAccent,
                        ),
                      );
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }

                    return ApiConstants.matchType
                        ? currentMatchesPanel(
                            snapshot: snapshot.data,
                          )
                        : cricScoresPanel(
                            snapshot: snapshot.data,
                          );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

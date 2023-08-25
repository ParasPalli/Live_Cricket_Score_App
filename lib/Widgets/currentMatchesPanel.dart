import 'package:cricket_score/Widgets/singleTeam.dart';
import 'package:cricket_score/utils/color.dart';
import 'package:flutter/material.dart';

import '../models/Matches.dart';

class currentMatchesPanel extends StatelessWidget {
  final List<Matches> snapshot;

  const currentMatchesPanel({super.key, required this.snapshot});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
      child: ListView.builder(
        // shrinkWrap: true,
        itemCount: snapshot.length,
        itemBuilder: (context, int index) {
          return matchesPanel(
            snapshot: snapshot[index],
          );
        },
      ),
    );
  }
}

class matchesPanel extends StatelessWidget {
  final Matches snapshot;
  const matchesPanel({
    super.key,
    required this.snapshot,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 35,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                top: Radius.circular(5),
              ),
              color: grey,
            ),
            child: Padding(
              padding: const EdgeInsets.only(
                left: 20.0,
                top: 8,
                bottom: 8,
              ),
              child: Text(
                snapshot.name,
                style: const TextStyle(
                  fontSize: 15,
                ),
              ),
            ),
          ),
          Container(
            width: double.infinity,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(5),
              ),
              color: Colors.white,
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 15,
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      singleTeam(
                        teamName: snapshot.teams[0],
                        img: snapshot.teamInfo.toList()[0]['img'].toString(),
                        score: snapshot.score.isNotEmpty
                            ? "${snapshot.score[0]['r'].toString()} (${snapshot.score[0]['w'].toString()})"
                            : "No Score",
                      ),
                      const Text("Vs"),
                      singleTeam(
                        teamName: snapshot.teams[1],
                        img: snapshot.teamInfo[1]['img'].toString(),
                        score: snapshot.score.length > 1
                            ? "${snapshot.score[1]['r'].toString()} (${snapshot.score[1]['w'].toString()})"
                            : "No Score",
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    snapshot.status,
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                    textAlign: TextAlign.center,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    softWrap: true,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

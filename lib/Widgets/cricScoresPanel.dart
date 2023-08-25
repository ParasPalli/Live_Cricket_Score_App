import 'package:cricket_score/Widgets/singleTeam.dart';
import 'package:cricket_score/models/CricScores.dart';
import 'package:cricket_score/utils/color.dart';
import 'package:flutter/material.dart';

class cricScoresPanel extends StatelessWidget {
  final List<CricScores> snapshot;

  const cricScoresPanel({super.key, required this.snapshot});

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
  final CricScores snapshot;
  const matchesPanel({
    super.key,
    required this.snapshot,
  });

  String getTeam(String teamName) {
    String team = teamName.split(' ').last;
    return team.substring(1, team.length - 1);
  }

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
                snapshot.matchType.toUpperCase(),
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
                        teamName: getTeam(snapshot.t1),
                        img: snapshot.t1img,
                        score: snapshot.t1s,
                      ),
                      const Text("Vs"),
                      singleTeam(
                        teamName: getTeam(snapshot.t2),
                        img: snapshot.t2img,
                        score: snapshot.t2s,
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

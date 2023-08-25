import 'package:flutter/cupertino.dart';

class singleTeam extends StatelessWidget {
  final String teamName;
  final String score;
  final String img;

  const singleTeam({
    super.key,
    required this.teamName,
    required this.score,
    required this.img,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: Image.network(
              img,
              height: 55.0,
              width: 55.0,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            teamName,
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            maxLines: 2,
          ),
          Text(
            score,
            style: TextStyle(fontSize: 12),
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            softWrap: true,
            maxLines: 2,
          ),
        ],
      ),
    );
  }
}

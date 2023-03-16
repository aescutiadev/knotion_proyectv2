import 'package:flutter/material.dart';

class EpisodeCardWidget extends StatelessWidget {
  final void Function()? onTap;
  final String cover;
  final String name;

  const EpisodeCardWidget({
    Key? key,
    required this.cover,
    required this.name,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 5, left: 5),
        child: Stack(
          alignment: AlignmentDirectional.bottomStart,
          children: [
            SizedBox(
              width: 250,
              height: 200,
              child: Image.network(
                cover,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 250,
              padding: const EdgeInsets.all(15),
              height: 200,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment
                      .topCenter, // 10% of the width, so there are ten blinds.
                  colors: <Color>[
                    Colors.black,
                    Colors.transparent
                  ], // red to yellow
                  tileMode:
                      TileMode.repeated, // repeats the gradient over the canvas
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class RatingModel extends StatelessWidget {
  const RatingModel({
    super.key, required this.averageRating, required this.pageCount,
  });
  final num averageRating;
  final int pageCount;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Icon(
          Icons.star_rate_rounded,
          color: Colors.yellow,
        ),
        Text(
          "$averageRating",
          style: const TextStyle(
            fontSize: 18,
          ),
        ),
        const SizedBox(
          width: 2,
        ),
        Text(
          "($pageCount)",
          style: const TextStyle(
            fontSize: 15,
            color: Colors.grey,
          ),
        ),
      ],
    );
  }
}

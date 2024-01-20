import 'package:flutter/material.dart';

class BookTitle extends StatelessWidget {
  const BookTitle({
    super.key, required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.5,
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 20,
          fontFamily: "GT Sectra Fine",
        ),
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class PictureItem extends StatelessWidget {
  const PictureItem({
    super.key,
    required this.imageUrl,
  });

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
          aspectRatio: 2.7 / 4,
          child: CachedNetworkImage(
            fit: BoxFit.fill,
            imageUrl: imageUrl,
            errorWidget: (context, url, error) =>
                const Icon(Icons.error_outline),
          ),
        ),
      ),
    );
  }
}

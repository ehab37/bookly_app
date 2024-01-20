import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:my_bookly/core/utils/app_router.dart';
import 'package:my_bookly/features/home/data/models/book_item_model/book_item_model/book_item_model.dart';
import 'book_title.dart';
import 'picture_item.dart';
import 'rating_model.dart';

class NewestItem extends StatelessWidget {
  const NewestItem({
    super.key,
    required this.book,
  });

  final BookItemModel book;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(
          AppRouter.detailsView,
          extra: book,
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        child: Row(
          children: [
            SizedBox(
              height: 125,
              child: PictureItem(
                  imageUrl: book.volumeInfo!.imageLinks!.thumbnail.toString()),
            ),
            const SizedBox(
              width: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BookTitle(title: book.volumeInfo!.title.toString()),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  book.volumeInfo!.authors![0],
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Row(
                  children: [
                    const Text(
                      "Free",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    RatingModel(
                      averageRating: book.volumeInfo!.averageRating ?? 4,
                      pageCount: book.volumeInfo!.pageCount ?? 400,
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}

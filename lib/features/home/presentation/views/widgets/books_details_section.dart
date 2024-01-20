import 'package:flutter/material.dart';
import 'package:my_bookly/features/home/data/models/book_item_model/book_item_model/book_item_model.dart';
import 'picture_item.dart';
import 'rating_model.dart';

class BooksDetailsSection extends StatelessWidget {
  const BooksDetailsSection({Key? key, required this.book}) : super(key: key);
  final BookItemModel book;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height / 3.2,
          child: PictureItem(
              imageUrl:
                  book.volumeInfo!.imageLinks!.thumbnail!),
        ),
        const SizedBox(
          height: 40,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.6,
          child: Text(
            textAlign: TextAlign.center,
            book.volumeInfo!.title!,
            style: const TextStyle(
              fontSize: 25,
              fontFamily: "GT Sectra Fine",
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(
          height: 4,
        ),
        Text(
          book.volumeInfo!.authors![0],
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.grey,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        RatingModel(
          pageCount: book.volumeInfo!.pageCount ?? 400,
          averageRating: book.volumeInfo!.averageRating ?? 4,
        ),
      ],
    );
  }
}

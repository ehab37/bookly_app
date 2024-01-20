import 'package:flutter/material.dart';
import 'package:my_bookly/features/home/data/models/book_item_model/book_item_model/book_item_model.dart';
import 'books_action_section.dart';
import 'books_details_section.dart';
import 'details_appbar.dart';
import 'similar_books_list_view.dart';

class BookDetailsBody extends StatelessWidget {
  const BookDetailsBody({super.key, required this.book});
  final BookItemModel book;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            child: Column(
              children: [
                const DetailsAppbar(),
                BooksDetailsSection(book: book,),
                const SizedBox(height: 30),
                BooksActionSection(book: book,),
                const SizedBox(height: 50),
                const SimilarBooksListView(),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

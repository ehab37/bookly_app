import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookly/features/home/data/models/book_item_model/book_item_model/book_item_model.dart';
import 'package:my_bookly/features/home/presentation/manager/similar_books_cubit.dart';
import 'widgets/book_details_body.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({Key? key, required this.book}) : super(key: key);
  final BookItemModel book;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context)
        .fetchSimilarBooks(category: widget.book.volumeInfo!.categories![0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BookDetailsBody(
      book: widget.book,
    );
  }
}

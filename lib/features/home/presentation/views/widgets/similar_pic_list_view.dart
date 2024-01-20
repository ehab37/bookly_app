import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_bookly/features/home/presentation/manager/similar_books_cubit.dart';
import 'picture_item.dart';

class SimilarPicListView extends StatelessWidget {
  const SimilarPicListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: 250,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return PictureItem(
                  imageUrl: state.books[index].volumeInfo!.imageLinks!.thumbnail
                      ?? "",
                );
              },
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return Text(state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

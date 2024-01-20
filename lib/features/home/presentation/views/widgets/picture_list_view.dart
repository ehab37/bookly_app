import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_bookly/core/utils/app_router.dart';
import 'package:my_bookly/features/home/presentation/manager/all_books_cubit.dart';
import 'picture_item.dart';

class PictureListView extends StatelessWidget {
  const PictureListView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AllBooksCubit, AllBooksState>(
      builder: (context, state) {
        if (state is AllBooksSuccess) {
          return SizedBox(
            height: 250,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    GoRouter.of(context).push(AppRouter.detailsView,extra: state.books[index]);
                  },
                  child: PictureItem(
                    imageUrl: state.books[index].volumeInfo!.imageLinks!.thumbnail
                        .toString(),
                  ),
                );
              },
            ),
          );
        } else if (state is AllBooksFailure) {
          return Text(state.errMessage);
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

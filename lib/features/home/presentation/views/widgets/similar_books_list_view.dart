import 'package:flutter/material.dart';
import 'package:my_bookly/features/home/presentation/views/widgets/similar_pic_list_view.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Align(
            alignment: AlignmentDirectional.centerStart,
            child: Text("You can also like")),
        SizedBox(height: 15),
        SizedBox(
          height: 120,
          child: SimilarPicListView(),
        ),
      ],
    );
  }
}

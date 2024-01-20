import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:my_bookly/features/home/data/models/book_item_model/book_item_model/book_item_model.dart';
import 'package:my_bookly/features/home/data/repos/home_repo.dart';
part 'all_books_state.dart';

class AllBooksCubit extends Cubit<AllBooksState> {
  AllBooksCubit(this.homeRepo) : super(AllBooksInitial());
  final HomeRepo homeRepo;

  Future<void> fetchAllBooks() async {
    emit(AllBooksLoading());
    var result = await homeRepo.fetchAllBooks();
    result.fold(
      (failure) {
        emit(AllBooksFailure(failure.errMessage));
      },
      (books) {
        emit(AllBooksSuccess(books));
      },
    );
  }
}

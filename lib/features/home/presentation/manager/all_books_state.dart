part of 'all_books_cubit.dart';

@immutable
abstract class AllBooksState {}

class AllBooksInitial extends AllBooksState {}

class AllBooksLoading extends AllBooksState {}

class AllBooksSuccess extends AllBooksState {
  final List<BookItemModel> books;

  AllBooksSuccess(this.books);
}

class AllBooksFailure extends AllBooksState {
  final String errMessage;

  AllBooksFailure(this.errMessage);
}

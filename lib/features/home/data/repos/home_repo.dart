import 'package:dartz/dartz.dart';
import 'package:my_bookly/core/errors/errors.dart';
import 'package:my_bookly/features/home/data/models/book_item_model/book_item_model/book_item_model.dart';

abstract class HomeRepo{
  Future<Either<Failure,List<BookItemModel>>> fetchAllBooks();
  Future<Either<Failure,List<BookItemModel>>> fetchNewestBooks();
  Future<Either<Failure,List<BookItemModel>>> fetchSimilarBooks({required String category});
}
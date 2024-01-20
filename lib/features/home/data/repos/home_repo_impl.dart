import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:my_bookly/core/errors/errors.dart';
import 'package:my_bookly/core/utils/api_service.dart';
import 'package:my_bookly/features/home/data/models/book_item_model/book_item_model/book_item_model.dart';
import 'package:my_bookly/features/home/data/repos/home_repo.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookItemModel>>> fetchAllBooks() async {
    try {
      List<BookItemModel> books = [];
      var data = await apiService.get(endPoint: "volumes?q=programming");
      for (var i in data["items"]){
        books.add(BookItemModel.fromJson(i));
      }
      return right(books);
    } on Exception catch (e) {
      if(e is DioException){
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookItemModel>>> fetchNewestBooks() async {
    try {
      List<BookItemModel> books = [];
      var data = await apiService.get(endPoint: "volumes?q=programming&orderBy=newest");
      for (var i in data["items"]){
        books.add(BookItemModel.fromJson(i));
      }
      return right(books);
    } on Exception catch (e) {
      if(e is DioException){
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookItemModel>>> fetchSimilarBooks({required String category}) async {
    try {
      List<BookItemModel> books = [];
      var data = await apiService.get(endPoint: "volumes?q=programming&orderBy=relevance");
      for (var i in data["items"]){
        books.add(BookItemModel.fromJson(i));
      }
      return right(books);
    } on Exception catch (e) {
      if(e is DioException){
        return Left(ServerFailure.fromDioException(e));
      }
      return Left(ServerFailure(e.toString()));
    }
  }
}

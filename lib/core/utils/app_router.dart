import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:my_bookly/core/utils/service_locator.dart';
import 'package:my_bookly/features/home/data/models/book_item_model/book_item_model/book_item_model.dart';
import 'package:my_bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:my_bookly/features/home/presentation/manager/similar_books_cubit.dart';
import 'package:my_bookly/features/home/presentation/views/home_view.dart';
import 'package:my_bookly/features/home/presentation/views/book_details_view.dart';
import 'package:my_bookly/features/search/search_view.dart';
import 'package:my_bookly/features/splash/views/splash_view.dart';

abstract class AppRouter {
  static const homeView = "/homeView";
  static const detailsView = "/detailsView";
  static const searchView = "/searchView";
  static final router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashView(),
      ),
      GoRoute(
        path: homeView,
        builder: (context, state) => const HomeView(),
      ),
      GoRoute(
        path: detailsView,
        builder: (context, state) => BlocProvider(
          create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImpl>()),
          child: BookDetailsView(book: state.extra as BookItemModel),
        ),
      ),
      GoRoute(
        path: searchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}

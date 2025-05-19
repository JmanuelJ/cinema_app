import 'package:cinema_app/presentation/providers/providers.dart';
import 'package:cinema_app/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> {
  @override
  void initState() {
    super.initState();

    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage();
    ref.read(popularMoviesProvider.notifier).loadNextPage();
    ref.read(upcomingMoviesProvider.notifier).loadNextPage();
    ref.read(topRetedMoviesProvider.notifier).loadNextPage();
  }

  @override
  Widget build(BuildContext context) {
    final initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) return const FullScreenLoader();

    final slideShowMovies = ref.watch(moviesSlidesShowProvider);
    final nowPlayingMovies = ref.watch(nowPlayingMoviesProvider);
    final popularMovies = ref.watch(popularMoviesProvider);
    final upcomingMovies = ref.watch(upcomingMoviesProvider);
    final topRatedMovies = ref.watch(topRetedMoviesProvider);

    return CustomScrollView(
      slivers: [
        const SliverAppBar(
          floating: true,
          flexibleSpace: FlexibleSpaceBar(
            title: CustomAppbar(),
          ),
        ),
        SliverList(
            delegate: SliverChildBuilderDelegate((context, index) {
          return Column(
            children: [
              MoviesSlideshow(movies: slideShowMovies),
              MovieHorizontalListview(
                movies: nowPlayingMovies,
                title: 'En cines',
                subtitle: 'Lunes 20',
                loadNextPage: () =>
                    ref.read(nowPlayingMoviesProvider.notifier).loadNextPage,
              ),
              MovieHorizontalListview(
                movies: upcomingMovies,
                title: 'Próximamente',
                subtitle: 'En este mes',
                loadNextPage: () =>
                    ref.read(upcomingMoviesProvider.notifier).loadNextPage,
              ),
              MovieHorizontalListview(
                movies: popularMovies,
                title: 'Populares',
                loadNextPage: () =>
                    ref.read(popularMoviesProvider.notifier).loadNextPage,
              ),
              MovieHorizontalListview(
                movies: topRatedMovies,
                title: 'Mejor Calificadas',
                subtitle: 'Desde siempre',
                loadNextPage: () =>
                    ref.read(topRetedMoviesProvider.notifier).loadNextPage,
              ),
              const SizedBox(
                height: 10,
              )
            ],
          );
        }, childCount: 1))
      ],
    );
  }
}

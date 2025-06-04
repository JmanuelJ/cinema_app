import 'package:cinema_app/domain/datasources/local_storage_datasource.dart';
import 'package:cinema_app/domain/entities/movie.dart';
import 'package:cinema_app/domain/repositories/local_storage_repository.dart';

class LocalStorageRepositoryImpl extends LocalStorageRepository {
  final LocalStorageDatasource datasource;

  LocalStorageRepositoryImpl(this.datasource);

  @override
  Future<bool> isMovieFavorite(int movieId) {
    return datasource.isMovieFavorite(movieId);
  }

  @override
  Future<List<Movie>> loadMovie({int limit = 10, offset = 0}) {
    return datasource.loadMovies();
  }

  @override
  Future<void> toggleFavorite(Movie movie) {
    return datasource.toggleFavorite(movie);
  }
}

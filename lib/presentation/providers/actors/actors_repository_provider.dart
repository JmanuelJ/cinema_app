import 'package:cinema_app/infrastructure/datasorces/actor_moviedb_datasource.dart';
import 'package:cinema_app/infrastructure/repositories/actor_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final actorsRepositoryProvider = Provider((ref) {
  return ActorRepositoryImpl(ActorMoviedbDatasource());
});

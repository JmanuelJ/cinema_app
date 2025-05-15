import 'package:cinema_app/domain/entities/actor.dart';
import 'package:cinema_app/infrastructure/models/moviedb/credits_response.dart';

class ActorMapper {
  static Actor castToEntity(Cast cast) => Actor(
      id: cast.id,
      name: cast.name,
      profilePath: cast.profilePath != null
          ? 'https://image.tmdb.org/t/p/w500${cast.profilePath}'
          : 'https://cdn-icons-png.flaticon.com/512/8188/8188362.png',
      character: cast.character);
}

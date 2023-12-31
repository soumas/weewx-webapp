import 'package:weewx_pwa/domain/entities/main_screen_data_entity.dart';
import 'package:weewx_pwa/domain/repositories/weewx_station_repository.dart';

class ChangeStationUsecase {
  final WeewxStationRepository repository;

  ChangeStationUsecase({
    required this.repository,
  });

  Future<MainScreenDataEntity> execute(String endpoint) async {
    return MainScreenDataEntity(
      settings: await repository.loadSettings(endpoint),
      weather: await repository.loadWeather(endpoint),
      images: await repository.loadImages(endpoint),
    );
  }
}

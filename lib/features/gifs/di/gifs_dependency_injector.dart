import '../../../core/config/remote_api_constants.dart';
import '../../../core/di_manager/di_manager.dart';
import '../../../core/http/data/http_proxy_impl.dart';
import '../data/data_source/gifs_remote_data_source.dart';
import '../data/repositories/gifs_impl_repository.dart';
import '../domain/repositories/get_data_gifs_contract.dart';
import '../domain/use_cases/get_search_gifs_use_case.dart';
import '../domain/use_cases/get_trend_gifs_use_case.dart';
import '../presentation/manager/gifs_cubit/gifs_cubit.dart';

abstract class GifsDependencyInjector {
  static bool _alreadyInit = false;

  static Future<void> initializeDependencies() async {
    if (_alreadyInit) {
      return;
    }

    DIManager.getIt.registerSingleton(HttpImpl());

    DIManager.getIt.registerSingleton(GifsRemoteDatasource(
      DIManager.getIt<HttpImpl>(),
      RemoteApiConstants.getTrendGifs,
      RemoteApiConstants.apiKeyGiphy,
      RemoteApiConstants.getSearchGifs,
    ));

    DIManager.getIt.registerSingleton<GifsDataContract>(
      GifsImplRepository(
        DIManager.getIt<GifsRemoteDatasource>(),
      ),
    );

    DIManager.getIt.registerSingleton(
      GetTrendGifsUseCase(
        DIManager.getIt<GifsDataContract>(),
      ),
    );

    DIManager.getIt.registerSingleton(
      GetSearchGifUseCase(
        DIManager.getIt<GifsDataContract>(),
      ),
    );

    DIManager.getIt.registerFactory(
      () => GifCubit(
        getTrendsUseCase: DIManager.getIt<GetTrendGifsUseCase>(),
        getSearchGifUseCase: DIManager.getIt<GetSearchGifUseCase>(),
      ),
    );

    _alreadyInit = true;
  }
}

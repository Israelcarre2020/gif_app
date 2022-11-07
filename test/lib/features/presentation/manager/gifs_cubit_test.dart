import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:summer_app/core/di_manager/di_manager.dart';
import 'package:summer_app/features/gifs/domain/use_cases/get_search_gifs_use_case.dart';
import 'package:summer_app/features/gifs/domain/use_cases/get_trend_gifs_use_case.dart';
import 'package:summer_app/features/gifs/presentation/manager/gifs_cubit/gifs_cubit.dart';

import '../../test_utils/fake_responses/gif_fake_responses.dart';
import '../../test_utils/mocks/gif_test_mocks.dart';
import '../../test_utils/mocks/http_mocks.dart';

void main() {
  late GifsDataContractMock repository;

  late GetTrendGifsUseCase getTrendUseCase;
  late GetSearchGifUseCase getSearchUseCase;

  late GifsDataContractMock repositoryErrortests;

  late GetTrendGifsUseCase getTrendUseCaseErrorTests;
  late GetSearchGifUseCase getSearchUseCaseErrorTests;
  late Response response;

  var isInjected = false;

  setUp(() {
    repository = GifsDataContractMock();
    getTrendUseCase = GetTrendGifsUseCase(repository);
    getSearchUseCase = GetSearchGifUseCase(repository);

    if (!isInjected) {
      when(() => repository.getSearchGifs(any(that: isNotNull)))
          .thenAnswer((_) async => listSearchFake);

      when(() => repository.getTrendGifs())
          .thenAnswer((_) async => listTrendFake);

      DIManager.getIt
          .registerFactory<GetTrendGifsUseCase>(() => getTrendUseCase);

      DIManager.getIt
          .registerFactory<GetSearchGifUseCase>(() => getSearchUseCase);

      isInjected = true;
    }
  });

  group('Cubit Gifs Tests', () {
    test('Obtener Trend Gifs', () async {
      await cubitOkTests.getTrendGifs();
      expect(cubitOkTests.state, GifState.trendGifs(listTrendFake));
    });

    test('Buscar Gifs', () async {
      await cubitOkTests.searchGifs('query');
      expect(cubitOkTests.state, GifState.searchedGifs(listSearchFake));
    });
  });

  group('Con errores', () {
    setUp(() async {
      repositoryErrortests = GifsDataContractMock();
      response = MockDioResponse();

      getTrendUseCaseErrorTests = GetTrendGifsUseCase(repositoryErrortests);
      getSearchUseCaseErrorTests = GetSearchGifUseCase(repositoryErrortests);

      await DIManager.getIt.reset();

      when(() => response.statusCode).thenReturn(401);
      when(() => response.statusMessage).thenReturn('Token no válido');
      when(() => repositoryErrortests.getSearchGifs(any(that: isNotNull)))
          .thenAnswer((_) async => throw DioError(
              response: response,
              error: response.statusMessage,
              requestOptions: RequestOptions(path: '')));

      when(() => repositoryErrortests.getTrendGifs()).thenAnswer((_) async =>
          throw DioError(
              response: response,
              error: response.statusMessage,
              requestOptions: RequestOptions(path: '')));

      DIManager.getIt.registerFactory<GetTrendGifsUseCase>(
          () => getTrendUseCaseErrorTests);

      DIManager.getIt.registerFactory<GetSearchGifUseCase>(
          () => getSearchUseCaseErrorTests);
    });

    test('Obtener trend, error de petición de datos', () async {
      await cubitErrorTests.getTrendGifs();
      expect(cubitErrorTests.state, const GifState.error('Token no válido'));
    });

    test('Obtener Busqueda de gifs, error de petición de datos', () async {
      await cubitErrorTests.searchGifs('query');
      expect(cubitErrorTests.state, const GifState.error('Token no válido'));
    });
  });
}

final cubitOkTests = GifCubit(
  getSearchGifUseCase: DIManager.getIt.get<GetSearchGifUseCase>(),
  getTrendsUseCase: DIManager.getIt.get<GetTrendGifsUseCase>(),
);

final cubitErrorTests = GifCubit(
  getSearchGifUseCase: DIManager.getIt.get<GetSearchGifUseCase>(),
  getTrendsUseCase: DIManager.getIt.get<GetTrendGifsUseCase>(),
);

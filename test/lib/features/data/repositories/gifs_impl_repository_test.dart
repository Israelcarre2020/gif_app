import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:summer_app/features/gifs/data/repositories/gifs_impl_repository.dart';
import 'package:summer_app/features/gifs/domain/entities/gif_model.dart';
import 'package:summer_app/features/gifs/domain/repositories/get_data_gifs_contract.dart';

import '../../test_utils/fake_responses/gif_fake_responses.dart';
import '../../test_utils/mocks/gif_test_mocks.dart';

void main() {
  late GifsDataContract repository;
  late GifsRemoteDatasourceMock remoteDataSource;

  setUp(() {
    remoteDataSource = GifsRemoteDatasourceMock();
    repository = GifsImplRepository(remoteDataSource);
  });

  group('Obtener Gifs - Sin excepciones', () {
    test('Obtener Trend Gifs', () async {
      when(() => remoteDataSource.getTrendGifs()).thenAnswer(
          (_) async => GifAllDataModel.fromJson(gifsFakeResponseTrend).data!);

      final response = await repository.getTrendGifs();

      expect(response[0], isA<GifModelBase>());
    });

    test('Buscar Gifs', () async {
      when(() => remoteDataSource.getSearchGifs(any(that: isNotNull)))
          .thenAnswer((_) async =>
              GifAllDataModel.fromJson(gifsFakeResponseSearch).data!);

      final response = await repository.getSearchGifs('query');

      expect(response[0], isA<GifModelBase>());
    });
  });

  group('Obtener Gifs - Con excepciones', () {
    test('Obtener Trend Gifs, debe lanzar excepción', () async {
      when(() => remoteDataSource.getTrendGifs()).thenAnswer((_) async =>
          throw DioError(requestOptions: RequestOptions(path: '')));

      try {
        await repository.getTrendGifs();
      } catch (e) {
        expect(
          e,
          isA<DioError>(),
        );
      }
    });

    test('Buscar Gifs', () async {
      when(() => remoteDataSource.getSearchGifs(any(that: isNotNull)))
          .thenAnswer((_) async =>
              throw DioError(requestOptions: RequestOptions(path: '')));

      try {
        await repository.getSearchGifs('query');
      } catch (e) {
        expect(
          e,
          isA<DioError>(),
        );
      }
    });
  });
}

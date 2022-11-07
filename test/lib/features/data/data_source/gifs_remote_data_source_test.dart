import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:summer_app/features/gifs/data/data_source/gifs_remote_data_source.dart';
import 'package:summer_app/features/gifs/domain/entities/gif_model.dart';

import '../../test_utils/fake_responses/gif_fake_responses.dart';
import '../../test_utils/mocks/http_mocks.dart';

void main() {
  late GifsRemoteDatasource remoteDataSource;
  late MockHttpImpl httpClient;
  late Dio dio;
  late Response response;
  const requestUlr = 'https://fakeurl.com';

  setUp(() {
    dio = MockDio();
    response = MockDioResponse();
    httpClient = MockHttpImpl();

    remoteDataSource =
        GifsRemoteDatasource(httpClient, requestUlr, requestUlr, '');
  });

  group('Obtener datos de API', () {
    test('Obtener los gif Trend, No Debe lanzar ninguna excepción', () async {
      when(() => httpClient.instance()).thenReturn(dio);
      when(() => response.statusCode).thenReturn(200);
      when(() => response.data).thenReturn(gifsFakeResponseTrend);
      when(() => dio.get(any(), queryParameters: any(named: 'queryParameters')))
          .thenAnswer((_) async => response);
      final result = await remoteDataSource.getTrendGifs();
      expect(result[0], isA<GifModelBase>());
    });

    test('Buscar gifs, No Debe lanzar ninguna excepción', () async {
      when(() => httpClient.instance()).thenReturn(dio);
      when(() => response.statusCode).thenReturn(200);
      when(() => response.data).thenReturn(gifsFakeResponseSearch);
      when(() => dio.get(any(), queryParameters: any(named: 'queryParameters')))
          .thenAnswer((_) async => response);

      final result = await remoteDataSource.getSearchGifs('anyValue');

      expect(result[0], isA<GifModelBase>());
    });

    test('Debe lanzar una excepción de DIO al obtener los Trend Gifs',
        () async {
      when(() => httpClient.instance()).thenReturn(dio);
      when(() => response.statusCode).thenReturn(401);
      when(() => response.statusMessage).thenReturn('El token no es válido');
      when(() => dio.get(any(), queryParameters: any(named: 'queryParameters')))
          .thenThrow(DioError(
        response: response,
        error: response.statusMessage,
        requestOptions: RequestOptions(path: ''),
      ));

      try {
        await remoteDataSource.getTrendGifs();
      } catch (e) {
        expect(
          e,
          isA<DioError>(),
        );
      }
    });

    test('Debe lanzar una excepción de DIO al buscar Gifs', () async {
      when(() => httpClient.instance()).thenReturn(dio);
      when(() => response.statusCode).thenReturn(401);
      when(() => response.statusMessage).thenReturn('El token no es válido');
      when(() => dio.get(any(), queryParameters: any(named: 'queryParameters')))
          .thenThrow(DioError(
        response: response,
        error: response.statusMessage,
        requestOptions: RequestOptions(path: ''),
      ));

      try {
        await remoteDataSource.getSearchGifs('query');
      } catch (e) {
        expect(
          e,
          isA<DioError>(),
        );
      }
    });
  });
}

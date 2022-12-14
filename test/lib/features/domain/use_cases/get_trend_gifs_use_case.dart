import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:summer_app/features/gifs/domain/entities/gif_model.dart';
import 'package:summer_app/features/gifs/domain/use_cases/get_trend_gifs_use_case.dart';

import '../../test_utils/fake_responses/gif_fake_responses.dart';
import '../../test_utils/mocks/gif_test_mocks.dart';

void main() {
  late GifsDataContractMock repository;
  late GetTrendGifsUseCase useCase;

  setUp(() {
    repository = GifsDataContractMock();
    useCase = GetTrendGifsUseCase(repository);
  });

  test('Obtener trends', () async {
    when(() => repository.getTrendGifs()).thenAnswer(
        (_) async => GifAllDataModel.fromJson(gifsFakeResponseTrend).data!);

    final response = await useCase(null);

    expect(response[0], isA<GifModelBase>());
  });
}

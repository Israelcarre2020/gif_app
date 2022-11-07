import '../../../../core/use_case_generic/use_case.dart';
import '../entities/gif_model.dart';
import '../repositories/get_data_gifs_contract.dart';

class GetSearchGifUseCase
    implements UseCase<Future<List<GifModelBase>>, String> {
  GetSearchGifUseCase(this.repository);

  final GifsDataContract repository;

  @override
  Future<List<GifModelBase>> call(String query) async {
    return repository.getSearchGifs(query);
  }
}

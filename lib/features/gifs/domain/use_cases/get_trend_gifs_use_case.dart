import '../../../../core/use_case_generic/use_case.dart';
import '../entities/gif_model.dart';
import '../repositories/get_data_gifs_contract.dart';

class GetTrendGifsUseCase implements UseCase<Future<List<GifModelBase>>, void> {
  GetTrendGifsUseCase(this.repository);

  final GifsDataContract repository;

  @override
  Future<List<GifModelBase>> call(_) async {
    return repository.getTrendGifs();
  }
}

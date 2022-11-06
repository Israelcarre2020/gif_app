import '../../../../core/use_case_generic/use_case.dart';
import '../entities/gif_model.dart';
import '../repositories/get_data_gifs_contract.dart';

class GetGifsUseCase implements UseCase<Future<List<GifModel>>, void> {
  GetGifsUseCase(this.repository);

  final GifsDataContract repository;

  @override
  Future<List<GifModel>> call(_) async {
    return repository.getGifs();
  }
}

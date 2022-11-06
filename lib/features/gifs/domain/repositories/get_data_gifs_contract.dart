import '../entities/gif_model.dart';

abstract class GifsDataContract {
  Future<List<GifModelBase>> getTrendGifs();
  Future<List<GifModelBase>> getSearchGifs(String query);
}

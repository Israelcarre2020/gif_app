import '../entities/gif_model.dart';

abstract class GifsDataContract {
  Future<List<GifModelBase>> getGifs();
}

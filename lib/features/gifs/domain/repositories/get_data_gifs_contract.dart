import '../entities/gif_model.dart';

abstract class GifsDataContract {
  Future<List<GifModel>> getGifs();
}

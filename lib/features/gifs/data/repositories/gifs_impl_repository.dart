import '../../domain/entities/gif_model.dart';
import '../../domain/repositories/get_data_gifs_contract.dart';
import '../data_source/gifs_remote_data_source.dart';

class GifsImplRepository implements GifsDataContract {
  final GifsRemoteDatasource _getDataUsersRemoteDatasource;

  GifsImplRepository(this._getDataUsersRemoteDatasource);

  @override
  Future<List<GifModelBase>> getTrendGifs() async {
    return _getDataUsersRemoteDatasource.getTrendGifs();
  }

  @override
  Future<List<GifModelBase>> getSearchGifs(String query) {
    return _getDataUsersRemoteDatasource.getSearchGifs(query);
  }
}

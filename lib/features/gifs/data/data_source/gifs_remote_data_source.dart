import '../../../../core/http/data/http_proxy_impl.dart';
import '../../domain/entities/gif_model.dart';

class GifsRemoteDatasource {
  final HttpImpl _httpImpl;
  final String _giphyUrl;
  final String _giphtToken;

  GifsRemoteDatasource(this._httpImpl, this._giphyUrl, this._giphtToken);

  Future<List<GifModelBase>> getGifs() async {
    final http = _httpImpl.instance();
    final params = {'api_key': _giphtToken};
    final response = await http.get(_giphyUrl, queryParameters: params);
    final model = GifAllDataModel.fromJson(response.data);
    return model.data!;
  }
}

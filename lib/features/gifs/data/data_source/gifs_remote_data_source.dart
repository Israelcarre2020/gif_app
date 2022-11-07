import '../../../../core/http/data/http_proxy_impl.dart';
import '../../domain/entities/gif_model.dart';

class GifsRemoteDatasource {
  final HttpImpl _httpImpl;
  final String _gifTrendUrl;
  final String _searchGiphyUrl;
  final String _giphtToken;

  GifsRemoteDatasource(this._httpImpl, this._gifTrendUrl, this._giphtToken,
      this._searchGiphyUrl);

  Future<List<GifModelBase>> getTrendGifs() async {
    final http = _httpImpl.instance();
    final params = {'api_key': _giphtToken};
    final response = await http.get(_gifTrendUrl, queryParameters: params);
    return GifAllDataModel.fromJson(response.data).data!;
  }

  Future<List<GifModelBase>> getSearchGifs(String query) async {
    final http = _httpImpl.instance();
    final params = {'api_key': _giphtToken, 'q': query};
    final response = await http.get(_searchGiphyUrl, queryParameters: params);
    return GifAllDataModel.fromJson(response.data).data!;
  }
}

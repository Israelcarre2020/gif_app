import 'package:dio/dio.dart';

import '../../../../core/http/data/http_proxy_impl.dart';
import '../../domain/entities/gif_model.dart';

class GifsRemoteDatasource {
  final HttpImpl _httpImpl;
  final String _giphyUrl;

  GifsRemoteDatasource(this._httpImpl, this._giphyUrl);

  Future<List<GifModel>> getGifs() async {
    final http = _httpImpl.instance();
    Response response;
    response = await http.get(_giphyUrl);

    List<GifModel> list = [];

    return list;
  }
}

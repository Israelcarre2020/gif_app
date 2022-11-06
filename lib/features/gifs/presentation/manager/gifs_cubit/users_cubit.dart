import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/gif_model.dart';
import '../../../domain/use_cases/get_search_gifs_use_case.dart';
import '../../../domain/use_cases/get_trend_gifs_use_case.dart';

part 'gifs_cubit_state.dart';
part 'users_cubit.freezed.dart';

class GifCubit extends Cubit<GifState> {
  final GetTrendGifsUseCase _getTrendGifsUseCase;
  final GetSearchGifUseCase _getSearchGifUseCase;

  GifCubit({
    required GetTrendGifsUseCase getAllPostsUseCase,
    required GetSearchGifUseCase getSearchGifUseCase,
  })  : _getTrendGifsUseCase = getAllPostsUseCase,
        _getSearchGifUseCase = getSearchGifUseCase,
        super(const GifState.init());

  List<GifModelBase> allGifs = [];
  List<GifModelBase> filterGifs = [];

  Future<void> getTrendGifs() async {
    try {
      emit(const GifState.loading());
      allGifs = await _getTrendGifsUseCase(null);
      emit(GifState.trendGifs(allGifs));
    } on DioError catch (e) {
      emit(GifState.error(e.error.toString()));
    } catch (e) {
      emit(GifState.error(e.toString()));
    }
  }

  Future<void> searchGifs(String query) async {
    try {
      emit(const GifState.loading());
      filterGifs = await _getSearchGifUseCase(query);
      emit(GifState.searchedGifs(allGifs));
    } on DioError catch (e) {
      emit(GifState.error(e.error.toString()));
    } catch (e) {
      emit(GifState.error(e.toString()));
    }
  }

  void searchGif(String value) {}
}

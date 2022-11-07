import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/gif_model.dart';
import '../../../domain/use_cases/get_search_gifs_use_case.dart';
import '../../../domain/use_cases/get_trend_gifs_use_case.dart';

part 'gifs_cubit_state.dart';
part 'gifs_cubit.freezed.dart';

class GifCubit extends Cubit<GifState> {
  final GetTrendGifsUseCase _getTrendGifsUseCase;
  final GetSearchGifUseCase _getSearchGifUseCase;

  GifCubit({
    required GetTrendGifsUseCase getTrendsUseCase,
    required GetSearchGifUseCase getSearchGifUseCase,
  })  : _getTrendGifsUseCase = getTrendsUseCase,
        _getSearchGifUseCase = getSearchGifUseCase,
        super(const GifState.loading());

  List<GifModelBase> allGifs = [];
  List<GifModelBase> searchedGifs = [];
  String title = 'Trend Gifs';

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

  Future<void> initialState() async {
    emit(const GifState.init());
    await getTrendGifs();
  }

  Future<void> searchGifs(String query) async {
    try {
      emit(const GifState.loading());
      searchedGifs = await _getSearchGifUseCase(query);
      emit(GifState.searchedGifs(searchedGifs));
    } on DioError catch (e) {
      emit(GifState.error(e.error.toString()));
    } catch (e) {
      emit(GifState.error(e.toString()));
    }
  }

  Future<void> searchGif(String value) async {
    if (value.isNotEmpty) {
      await searchGifs(value);
      title = value;
    }
  }
}

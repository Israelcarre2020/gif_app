import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../domain/entities/gif_model.dart';
import '../../../domain/use_cases/get_gifs_use_case.dart';

part 'gifs_cubit_state.dart';
part 'users_cubit.freezed.dart';

class GifCubit extends Cubit<GifState> {
  final GetGifsUseCase _getGisUseCase;

  GifCubit({
    required GetGifsUseCase getAllPostsUseCase,
  })  : _getGisUseCase = getAllPostsUseCase,
        super(const GifState.syncFinished());

  List<GifModelBase> allGifs = [];
  List<GifModelBase> filterGifs = [];

  Future<void> getTrendGifs() async {
    try {
      emit(const GifState.loading());
      allGifs = await _getGisUseCase(null);
      emit(GifState.trendGifs(allGifs));
    } on DioError catch (e) {
      emit(GifState.error(e.error.toString()));
    } catch (e) {
      emit(GifState.error(e.toString()));
    }
  }

  void searchGif(String value) {}
}

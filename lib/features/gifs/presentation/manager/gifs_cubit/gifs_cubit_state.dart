part of 'gifs_cubit.dart';

@freezed
abstract class GifState with _$GifState {
  const factory GifState.loading() = _Loading;
  const factory GifState.init() = _Init;
  const factory GifState.trendGifs(List<GifModelBase> trendGifs) = _TrendGifs;
  const factory GifState.searchedGifs(List<GifModelBase> searchedGifs) =
      _SearchedGifs;
  const factory GifState.error(String message) = _Error;
}

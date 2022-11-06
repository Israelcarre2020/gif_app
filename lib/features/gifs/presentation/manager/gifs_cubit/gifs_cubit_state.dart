part of 'users_cubit.dart';

@freezed
abstract class GifState with _$GifState {
  const factory GifState.loading() = _Loading;
  const factory GifState.trendGifs(List<GifModelBase> trendGifs) = _TrendGifs;
  const factory GifState.savedPosts() = _SavedPosts;
  const factory GifState.savedUsers() = _SavedUsers;
  const factory GifState.syncFinished() = _SyncFinished;
  const factory GifState.error(String message) = _Error;
}

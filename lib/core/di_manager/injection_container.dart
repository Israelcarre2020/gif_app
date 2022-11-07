import '../../features/gifs/di/gifs_dependency_injector.dart';

Future<void> injectionDependencies() async {
  await GifsDependencyInjector.initializeDependencies();
}

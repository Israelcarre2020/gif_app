import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di_manager/di_manager.dart';
import '../../../domain/use_cases/get_search_gifs_use_case.dart';
import '../../../domain/use_cases/get_trend_gifs_use_case.dart';
import '../../manager/gifs_cubit/users_cubit.dart';
import '../../widgets/body_widget.dart';

class ListGifPage extends StatelessWidget {
  const ListGifPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GifCubit(
        getAllPostsUseCase: DIManager.getIt<GetTrendGifsUseCase>(),
        getSearchGifUseCase: DIManager.getIt<GetSearchGifUseCase>(),
      ),
      child: const UsersListPageView(),
    );
  }
}

class UsersListPageView extends StatefulWidget {
  const UsersListPageView({super.key});

  @override
  State<UsersListPageView> createState() => _UsersListPageViewState();
}

class _UsersListPageViewState extends State<UsersListPageView> {
  final searchController = TextEditingController();

  @override
  void initState() {
    context.read<GifCubit>().initialState();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
        appBar: AppBar(
          title: const Text('Gif App'),
          centerTitle: true,
        ),
        body: BlocConsumer<GifCubit, GifState>(listener: (_, state) {
          state.maybeWhen(
            error: (message) {
              showDialog(
                  context: context,
                  builder: (_) {
                    return AlertDialog(
                      title: const Text('Error al obtener los datos'),
                      content: Text(message),
                    );
                  });
            },
            orElse: () {},
          );
        }, builder: (_, state) {
          return state.maybeWhen(loading: () {
            return BodyWidgetGifs(
                gifList: context.read<GifCubit>().allGifs,
                theme: theme,
                state: state,
                textController: searchController);
          }, trendGifs: (trendGifs) {
            return BodyWidgetGifs(
                gifList: trendGifs,
                theme: theme,
                state: state,
                textController: searchController);
          }, searchedGifs: (searchedGifs) {
            return BodyWidgetGifs(
                gifList: searchedGifs,
                theme: theme,
                state: state,
                textController: searchController);
          }, error: (error) {
            return Center(
              child: _refresh(context),
            );
          }, orElse: () {
            return BodyWidgetGifs(
                gifList: context.read<GifCubit>().allGifs,
                theme: theme,
                state: state,
                textController: searchController);
          });
        }));
  }

  Widget _refresh(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
            onPressed: () => context.read<GifCubit>().getTrendGifs(),
            child: const Text('Cargar nuevamente')),
      ],
    );
  }
}

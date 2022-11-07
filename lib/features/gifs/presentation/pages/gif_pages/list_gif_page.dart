import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../../core/di_manager/di_manager.dart';
import '../../../../../shared/theme/app_colors_theme.dart';
import '../../../domain/entities/gif_model.dart';
import '../../../domain/use_cases/get_search_gifs_use_case.dart';
import '../../../domain/use_cases/get_trend_gifs_use_case.dart';
import '../../manager/gifs_cubit/users_cubit.dart';
import '../../widgets/custom_card.dart';

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
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

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
            return _body(
                context.read<GifCubit>().allGifs, theme, state, height, width);
          }, trendGifs: (trendGifs) {
            return _body(trendGifs, theme, state, height, width);
          }, searchedGifs: (searchedGifs) {
            return _body(searchedGifs, theme, state, height, width);
          }, error: (error) {
            return Center(
              child: _searchTest(context),
            );
          }, orElse: () {
            return _body(
                context.read<GifCubit>().allGifs, theme, state, height, width);
          });
        }));
  }

  Widget _searchGifField() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: searchController,
        decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: searchController.clear,
              icon: const Icon(
                Icons.clear,
                size: 30,
              )),
          prefixIcon: IconButton(
              onPressed: () {
                context.read<GifCubit>().searchGif(searchController.text);
              },
              icon: const Icon(
                Icons.search,
                size: 30,
              )),
          border: const OutlineInputBorder(),
          contentPadding: const EdgeInsets.all(5),
          hintText: 'Buscar Gif',
        ),
      ),
    );
  }

  Widget _searchTest(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
            onPressed: () => context.read<GifCubit>().getTrendGifs(),
            child: const Text('Cargar nuevamente')),
      ],
    );
  }

  Widget _body(List<GifModelBase> gifList, ThemeData theme, GifState state,
      double height, double width) {
    return Column(
      children: [
        _searchGifField(),
        Center(
            child: Text(
          context.read<GifCubit>().title,
          style: theme.textTheme.headline1!
              .copyWith(color: AppColorsTheme.primary),
        )),
        if (gifList.isEmpty && !(state == const GifState.loading()))
          Container(
              margin: const EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  Text(
                    'Sin resultados',
                    style: theme.textTheme.caption,
                  ),
                  const Icon(Icons.data_array)
                ],
              ))
        else
          state == const GifState.loading()
              ? Container(
                  margin: const EdgeInsets.only(top: 200),
                  child: const CircularProgressIndicator())
              : Expanded(
                  child: SingleChildScrollView(
                    child: StaggeredGrid.count(
                      crossAxisCount: 2,
                      children: gifList
                          .map((gif) => CustomCard(
                              height: height, width: width, gif: gif))
                          .toList(),
                    ),
                  ),
                ),
      ],
    );
  }
}

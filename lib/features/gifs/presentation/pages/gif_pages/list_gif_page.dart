import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../../core/di_manager/di_manager.dart';
import '../../../domain/entities/gif_model.dart';
import '../../../domain/use_cases/get_search_gifs_use_case.dart';
import '../../../domain/use_cases/get_trend_gifs_use_case.dart';
import '../../manager/gifs_cubit/users_cubit.dart';

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
  @override
  void initState() {
    context.read<GifCubit>().getTrendGifs();
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
          return state.maybeWhen(
              trendGifs: (trendGifs) {
                return _body(trendGifs, theme, state, height, width);
              },
              searchedGifs: (searchedGifs) =>
                  _body(searchedGifs, theme, state, height, width),
              error: (error) {
                return Center(
                  child: _searchTest(context),
                );
              },
              orElse: () {
                return _body(context.read<GifCubit>().allGifs, theme, state,
                    height, width);
              });
        }));
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
        searchField(),
        if (gifList.isEmpty)
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
                      children:
                          gifList.map((e) => cajita(height, width, e)).toList(),
                    ),
                  ),
                ),
      ],
    );
  }

  Widget cajita(double height, double width, GifModelBase gif) {
    return Padding(
      padding: const EdgeInsets.all(7),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: FadeInImage.assetNetwork(
            width: width * 0.4,
            height: double.parse(gif.images!.original!.height!),
            fit: BoxFit.cover,
            placeholder: 'assets/images/loading.gif',
            image: gif.images!.original!.url!),
      ),
    );
  }

  Widget searchField() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search),
          border: OutlineInputBorder(),
          contentPadding: EdgeInsets.all(5),
          hintText: 'Buscar Gif',
        ),
        onChanged: (value) {
          context.read<GifCubit>().searchGif(value);
        },
      ),
    );
  }
}

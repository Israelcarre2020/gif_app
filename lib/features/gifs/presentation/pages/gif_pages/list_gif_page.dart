import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return Scaffold(
        appBar: AppBar(
          title: const Text('Usuarios'),
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
                return _body(trendGifs, theme, state);
              },
              searchedGifs: (searchedGifs) => _body(searchedGifs, theme, state),
              error: (error) {
                return Center(
                  child: _searchTest(context),
                );
              },
              orElse: () {
                return _body(context.read<GifCubit>().allGifs, theme, state);
              });
        }));
  }

  Widget _searchTest(BuildContext context) {
    return Column(
      children: [
        TextButton(
            onPressed: () => context.read<GifCubit>().getTrendGifs(),
            child: Text('Buscar Trend Gifs')),
        TextButton(
            onPressed: () => context.read<GifCubit>().searchGifs('dog'),
            child: Text('Buscar específico')),
      ],
    );
  }

  Widget _body(List<GifModelBase> gifList, ThemeData theme, GifState state) {
    print('XXX tamaño de lista: ${gifList.length}');
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
                  child: ListView.builder(
                      itemCount: gifList.length,
                      itemBuilder: (context, index) {
                        return Container(
                          child: Text(gifList[index].images!.original!.height!),
                        );
                      }),
                )
      ],
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

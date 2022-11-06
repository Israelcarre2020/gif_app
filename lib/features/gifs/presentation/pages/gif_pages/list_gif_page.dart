import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/di_manager/di_manager.dart';
import '../../../domain/entities/gif_model.dart';
import '../../../domain/use_cases/get_gifs_use_case.dart';
import '../../manager/gifs_cubit/users_cubit.dart';

class ListGifPage extends StatelessWidget {
  const ListGifPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GifCubit(
        getAllPostsUseCase: DIManager.getIt<GetGifsUseCase>(),
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
          return state.maybeWhen(loading: () {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }, error: (error) {
            return Center(
              child: _searchTest(context),
            );
          }, orElse: () {
            return _searchTest(context);
          });
        }));
  }

  Widget _searchTest(BuildContext context) {
    return TextButton(
        onPressed: () => context.read<GifCubit>().getTrendGifs(),
        child: Text('Buscar Trend Gifs'));
  }

  Widget _body(List<GifAllDataModel> usersList, ThemeData theme) {
    return Column(
      children: [
        searchField(),
        if (usersList.isEmpty)
          Container(
              margin: const EdgeInsets.only(top: 30),
              child: Column(
                children: [
                  Text(
                    'List is empty',
                    style: theme.textTheme.caption,
                  ),
                  const Icon(Icons.data_array)
                ],
              ))
        else
          Expanded(
            child: ListView.builder(
                itemCount: usersList.length,
                itemBuilder: (context, index) {
                  return Container();
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
        onChanged: (value) {},
      ),
    );
  }
}

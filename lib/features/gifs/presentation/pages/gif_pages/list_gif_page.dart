import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../../core/di_manager/di_manager.dart';
import '../../../../../shared/theme/app_colors_theme.dart';
import '../../../domain/entities/gif_model.dart';
import '../../../domain/use_cases/get_search_gifs_use_case.dart';
import '../../../domain/use_cases/get_trend_gifs_use_case.dart';
import '../../manager/gifs_cubit/gifs_cubit.dart';
import '../../widgets/body_widget.dart';
import '../../widgets/custom_card.dart';

class ListGifPage extends StatelessWidget {
  const ListGifPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GifCubit(
        getTrendsUseCase: DIManager.getIt<GetTrendGifsUseCase>(),
        getSearchGifUseCase: DIManager.getIt<GetSearchGifUseCase>(),
      ),
      child: const GifsListPageView(),
    );
  }
}

class GifsListPageView extends StatefulWidget {
  const GifsListPageView({super.key});

  @override
  State<GifsListPageView> createState() => _GifsListPageViewState();
}

class _GifsListPageViewState extends State<GifsListPageView> {
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
          return state.maybeWhen(
              loading: () => BodyWidgetGifs(
                  gifList: context.read<GifCubit>().allGifs,
                  theme: theme,
                  state: state,
                  textController: searchController),
              trendGifs: (trendGifs) => BodyWidgetGifs(
                  gifList: trendGifs,
                  theme: theme,
                  state: state,
                  textController: searchController),
              searchedGifs: (searchedGifs) => BodyWidgetGifs(
                  gifList: searchedGifs,
                  theme: theme,
                  state: state,
                  textController: searchController),
              error: (error) => Center(
                    child: _refresh(context),
                  ),
              orElse: () => BodyWidgetGifs(
                  gifList: context.read<GifCubit>().allGifs,
                  theme: theme,
                  state: state,
                  textController: searchController));
        }));
  }

  Widget _refresh(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextButton(
              onPressed: () => context.read<GifCubit>().getTrendGifs(),
              child: const Text('Cargar nuevamente')),
        ],
      );
}

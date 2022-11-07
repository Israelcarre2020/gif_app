import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../../../shared/theme/app_colors_theme.dart';
import '../../domain/entities/gif_model.dart';
import '../manager/gifs_cubit/users_cubit.dart';
import 'custom_card.dart';

class BodyWidgetGifs extends StatelessWidget {
  final List<GifModelBase> gifList;
  final ThemeData theme;
  final GifState state;
  final TextEditingController textController;

  const BodyWidgetGifs(
      {required this.gifList,
      required this.theme,
      required this.state,
      required this.textController});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Column(
      children: [
        _searchGifField(context),
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

  Widget _searchGifField(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: TextField(
        controller: textController,
        decoration: InputDecoration(
          suffixIcon: IconButton(
              onPressed: textController.clear,
              icon: const Icon(
                Icons.clear,
                size: 30,
              )),
          prefixIcon: IconButton(
              onPressed: () async {
                await context.read<GifCubit>().searchGif(textController.text);
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
}

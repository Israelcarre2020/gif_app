import 'package:flutter/material.dart';

import '../../domain/entities/gif_model.dart';

class CustomCard extends StatelessWidget {
  final double height;
  final double width;
  final GifModelBase gif;

  const CustomCard(
      {required this.height, required this.width, required this.gif});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(7),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: FadeInImage.assetNetwork(
            width: width * 0.4,
            height: double.parse(gif.images!.original!.height!),
            fit: BoxFit.cover,
            placeholderFit: BoxFit.cover,
            placeholder: 'assets/images/loading.gif',
            image: gif.images!.original!.url!),
      ),
    );
  }
}

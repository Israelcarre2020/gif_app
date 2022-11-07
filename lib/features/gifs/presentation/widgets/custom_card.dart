import 'package:cached_network_image/cached_network_image.dart';
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
        child: CachedNetworkImage(
            fit: BoxFit.cover,
            height: double.parse(gif.images!.original!.height!),
            width: width * 0.4,
            progressIndicatorBuilder: (context, url, downloadProgress) =>
                Center(
                    child: CircularProgressIndicator(
                        value: downloadProgress.progress)),
            imageUrl: gif.images!.original!.url!),
      ),
    );
  }
}

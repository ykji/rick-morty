import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

showImage({String url, double radius, height}) {
  return ClipRRect(
    borderRadius: BorderRadius.circular(radius),
    child: CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      errorWidget: (context, url, error) => Icon(Icons.error),
      height: height,
    ),
  );
}
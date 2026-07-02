
  import 'package:depifinalproject/core/methods/show_full_image_dilog.dart';
import 'package:depifinalproject/core/widgets/custom_cached_network_image.dart';
import 'package:flutter/material.dart';

Widget buildImage(BuildContext context, String image) {
    return InkWell(
      onTap: () {
        showFullImageDialog(context: context, imageUrl: image, imageVersion: 0);
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: CustomCachedNewtorkimage(
          imageUrl: image,
          imageVersion: 0,
          height: 90,
          width: 90,
          fit: BoxFit.cover,
        ),
      ),
    );
  }


import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CachedImage extends StatelessWidget {
  final String? imgUrl;
  final double? height;

  const CachedImage({super.key, this.imgUrl, this.height});

  bool? checkStringContainsAssets(String? inputString) {
    return inputString!.contains('assets/fpicons') ||
        inputString.contains('assets/fpimages');
  }

  @override
  Widget build(BuildContext context) {
    bool isImageFromAsset = checkStringContainsAssets(imgUrl!) ?? false;
    return Container(
      padding: const EdgeInsets.all(3),
      child: isImageFromAsset
          ? Image.asset(
              imgUrl ?? "",
              height: height,
            )
          : CachedNetworkImage(
              height: height,
              imageUrl: imgUrl ?? "",
              placeholder: (context, url) => const CircularProgressIndicator(
                color: Colors.white,
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
            ),
    );
  }
}

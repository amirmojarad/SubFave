
import 'package:flutter/material.dart';

class MovieImage extends StatelessWidget {
  const MovieImage({
    Key? key,
    required this.imageURL,
  }) : super(key: key);

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius:
          BorderRadius.circular(8),
      child: Image.network(
        imageURL,
        fit: BoxFit.fill,
        width: 200,
        height: 200,
        loadingBuilder:
            (BuildContext context,
                Widget child,
                ImageChunkEvent?
                    loadingProgress) {
          if (loadingProgress == null) {
            return child;
          }
          return Center(
            child:
                CircularProgressIndicator(
              value: loadingProgress
                          .expectedTotalBytes !=
                      null
                  ? loadingProgress
                          .cumulativeBytesLoaded /
                      loadingProgress
                          .expectedTotalBytes!
                  : null,
            ),
          );
        },
      ),
    );
  }
}

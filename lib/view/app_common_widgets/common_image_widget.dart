import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../common/utils/common_colors.dart';

class CircularImageView extends StatelessWidget {
  double? imageWidth;
  double? imageHeight;
  String? image;
  String? fileImage;

  CircularImageView(
      {Key? key, this.imageWidth, this.imageHeight, this.image, this.fileImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: imageHeight,
      width: imageWidth,
      child: ClipOval(
        child: fileImage != null && fileImage != ""
            ? Image.file(
                File(fileImage!),
                fit: BoxFit.fill,
              )
            : image == null
                ? nonProfile(imageWidth, imageHeight)
                : FittedBox(
                    fit: BoxFit.contain,
                    child: Image.network(
                      image!,
                      fit: BoxFit.fill,
                      errorBuilder: (context, error, stackTrace) {
                        print(error); //do something
                        return nonProfile(imageWidth, imageHeight);
                      },
                      loadingBuilder: (context, child, loadingProgress) {
                        if (loadingProgress == null) {
                          return child;
                        } else {
                          return Center(
                            child: CircularProgressIndicator(
                              color: orangeEBA868,
                              value: loadingProgress.expectedTotalBytes != null
                                  ? loadingProgress.cumulativeBytesLoaded /
                                      loadingProgress.expectedTotalBytes!
                                  : null,
                            ),
                          );
                        }
                      },
                    )),
      ),
    );
  }

  Widget nonProfile(width, height) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: greyD8D8D8,
      ),
      child: Icon(
        Icons.person,
        size: height / 2,
        color: Colors.white,
      ),
    );
  }
}

class CommonImageView extends StatelessWidget {
  double? imageWidth;
  double? imageHeight;
  String? image;
  String? dummyImage;
  BorderRadiusGeometry? borderRadius;

  CommonImageView(
      {Key? key,

      this.image,
      this.dummyImage,
      this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: borderRadius ?? BorderRadius.circular(10.0),
      child: image == null
              ? Image.asset(
                  "asset/images/wine_store/img_bottle_glass.png",
                )
              : Image.network(
                  image!,
                  fit: BoxFit.fill,
                  errorBuilder: (context, error, stackTrace) {
                    print(error); //do something
                    return dummyImage != null && dummyImage != ""
                        ? Image.asset(
                      dummyImage!,
                    )
                        : Image.asset(
                      "asset/images/wine_store/img_bottle_glass.png",
                    );
                  },
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    } else {
                      return Center(
                        child: CircularProgressIndicator(
                          value: loadingProgress.expectedTotalBytes != null
                              ? loadingProgress.cumulativeBytesLoaded /
                                  loadingProgress.expectedTotalBytes!
                              : null,
                        ),
                      );
                    }
                  },
                ),
    );
  }
}

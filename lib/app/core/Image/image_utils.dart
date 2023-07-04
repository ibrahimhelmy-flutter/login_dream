import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../loading_pop_up/jd_skeleton.dart';




class ImageUtils {
  static Future<Size> calculateImageDimension(img) {
    Completer<Size> completer = Completer();
    Image image = Image.network("$img");
    image.image.resolve(const ImageConfiguration()).addListener(
      ImageStreamListener(
            (ImageInfo image, bool synchronousCall) {
          var myImage = image.image;
          Size size = Size(myImage.width.toDouble(), myImage.height.toDouble());
          completer.complete(size);
        },
      ),
    );
    return completer.future;
  }
  static Widget showNetImageWhClip(
      {String? url,
      String? asset,
      double width = 200,
      double height = 100,
      double circular = 8,
      BoxFit fit = BoxFit.contain}) {
    if (url != null) {
      return CachedNetworkImage(
        width: width,
        height: height,
        // imageUrl:  "${HttpService.urlBase}$url?${DateTime.now().millisecondsSinceEpoch}",
        imageUrl:  url,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(circular),
            image: DecorationImage(
                image: imageProvider,
                fit: fit,
                colorFilter: const ColorFilter.mode(
                    Colors.transparent, BlendMode.colorBurn)),
          ),
        ),
        placeholder: (context, url) => Center(
          child: Container(
            height: height,
            width: width,
            margin: const EdgeInsets.all(5),
            child: SkeletonBox(
              width: width,
              height: height,
              isCircle: true,
              raduis: width*2,
              baseColor: Colors.grey.withOpacity(0.034),
              highlightColor:Colors.grey.withOpacity(0.033) ,
            ),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          alignment: Alignment.center,
          width: width,
          height: height,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(circular),
              image: DecorationImage(image: const AssetImage("assets/img/img_avatar.png"), fit: fit)),
        ),
      );
    } else {
      return Container(
        alignment: Alignment.center,
        width: width,
        height: height,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(circular),
            image: DecorationImage(image: AssetImage(asset!), fit: fit)),
      );
    }
  }

  static Widget showNetImageCircle(
      {String? url,
      String? asset,
      double radius = 30,
      BoxFit fit = BoxFit.contain}) {
    if (url != null) {
      return CachedNetworkImage(
        width: radius * 2,
        height: radius * 2,
        // imageUrl:  HttpService.urlBase+url+"?${DateTime.now().millisecondsSinceEpoch}",
        imageUrl:  url,
        imageBuilder: (context, imageProvider) => Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            image: DecorationImage(
                image: imageProvider,
                fit: fit,
                colorFilter: const ColorFilter.mode(
                    Colors.transparent, BlendMode.colorBurn)),
          ),
        ),
        placeholder: (context, url) => Center(
          child: Container(
            width: radius * 2,
            height: radius * 2,
            margin: const EdgeInsets.all(5),
            child: SkeletonBox(
              width: radius * 2,
              height: radius * 2,
              isCircle: true,
              raduis: radius*2,
              baseColor: Colors.grey.withOpacity(0.034),
              highlightColor:Colors.grey.withOpacity(0.033) ,
            ),
          ),
        ),
        errorWidget: (context, url, error) => Container(
          width: radius,
          height: radius,
          alignment: Alignment.center,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              // borderRadius: BorderRadius.circular(radius),
              image: DecorationImage(image: const AssetImage("assets/img/img_avatar.png"), fit: fit)),
        ),
      );
    } else {
      return Container(
        width: radius,
        height: radius,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            // borderRadius: BorderRadius.circular(radius),
            image: DecorationImage(image: AssetImage(asset!), fit: fit)),
      );
    }
  }

  static CachedNetworkImage showNetImageWhError(String url, double width,
      double height, LoadingErrorWidgetBuilder error) {
    return CachedNetworkImage(
        width: width,
        height: height,
        // imageUrl: HttpService.urlBase+url,
        imageUrl: url,
        imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    colorFilter: const ColorFilter.mode(
                        Colors.transparent, BlendMode.colorBurn)),
              ),
            ),
        placeholder: (context, url) => Center(
              child: Container(
                height: 40,
                width: 40,
                margin: const EdgeInsets.all(5),
                child: const CircularProgressIndicator(
                  strokeWidth: 2.0,
                  valueColor: AlwaysStoppedAnimation(Colors.blue),
                ),
              ),
            ),
        errorWidget: error);
  }

  static CachedNetworkImage showNetImageWhPlaceError(
      String url,
      double width,
      double height,
      PlaceholderWidgetBuilder place,
      LoadingErrorWidgetBuilder error) {
    return CachedNetworkImage(
        width: width,
        height: height,
        // imageUrl: HttpService.urlBase+url,
        imageUrl: url,
        imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: imageProvider,
                    fit: BoxFit.cover,
                    colorFilter: const ColorFilter.mode(
                        Colors.transparent, BlendMode.colorBurn)),
              ),
            ),
        placeholder: place,
        errorWidget: error);
  }
}

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

SnackbarController rawSnackBar(String message,
    [Duration? duration, Color? color]) =>
    Get.rawSnackbar(
        message: message.tr,
        borderRadius: 8,
        duration: duration ?? const Duration(seconds: 3),
        backgroundColor: color ?? Colors.black.withOpacity(.8),
        margin: const EdgeInsets.symmetric(horizontal: 12));

enum MsgType { error, info, success }

class CustomSnackbar {


  static Icon getIcon(MsgType msgType) {
    return Icon(
      msgType == MsgType.error
          ? Icons.error_outline
          : msgType == MsgType.info
              ? Icons.sentiment_neutral
              : Icons.sentiment_satisfied_sharp,
      color: const Color(0x15000000),
      size: 115,
    );
  }

  static Color getColor(MsgType msgType) {
    return msgType == MsgType.error
        ? const Color(0xffff5252)
        : msgType == MsgType.info
            ? const Color(0xff2196F3)
            : const Color(0xff4caf50);
  }

  static show({required String message, required MsgType msgType,position= SnackPosition.BOTTOM, int duration=2}) {
    if (Get.isSnackbarOpen  ) {
      Get.back();
    }

    return Get.showSnackbar(
      GetSnackBar(
        messageText: GestureDetector(
          onTap: () => Get.back(),
          child: Container(
            clipBehavior: Clip.antiAlias,
            height: 70,
            decoration: BoxDecoration(
              color: getColor(msgType).withOpacity(0.975),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
              boxShadow: kDefaultBoxShadow,
            ),
            // width: double.infinity,
            child: Stack(
              children: [
                Positioned(
                  top: -10,
                  left: -8,
                  child: SizedBox(
                    height: 75,
                    child: Transform.rotate(
                      angle: 32 * pi / 180,
                      child: getIcon(msgType),
                    ),
                  ),
                ),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Text(
                      message,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 18,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      textScaleFactor: 1.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        duration:  Duration(seconds: duration),
        backgroundColor: Colors.transparent,
        snackPosition:position ,
      ),
    );
  }

  static const kDefaultBoxShadow = [
    BoxShadow(
      color: Colors.black26,
      offset: Offset(0.0, 8.0),
      spreadRadius: 1,
      blurRadius: 30,
    ),
  ];
}

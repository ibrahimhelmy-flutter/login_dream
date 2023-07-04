import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonBox extends StatelessWidget {
  final double width;
  final double height;
  final double raduis;
  final bool isCircle;
  final Color baseColor,highlightColor;

  const SkeletonBox(
      {super.key, required this.width,
        required this.height,
        this.isCircle = false,
        this.raduis = 8, this.baseColor=const Color(0xffF3F3F3), this.highlightColor=const Color(0xffeaeaea)});

  @override
  Widget build(BuildContext context) {
    bool isDark = Theme.of(context).brightness == Brightness.dark;
    Divider.createBorderSide(context, width: 0.7);
    return Shimmer.fromColors(

      period: const Duration(milliseconds: 700),
      baseColor: isDark ? Colors.grey[700]! : baseColor,//.withOpacity(0.6),
      highlightColor: isDark ? Colors.grey[500]! : highlightColor,//.withOpacity(0.7),
      child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: !isDark ? Colors.grey[350] : Colors.grey[700],
              shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
              borderRadius:
              isCircle ? null : BorderRadius.circular(raduis.toDouble()))
      ),
    );
  }
}

class SkeletonDecoration extends BoxDecoration {
  SkeletonDecoration({
    bool isCircle = false,
    bool isDark = false,
  }) : super(
    color: !isDark ? Colors.grey[350] : Colors.grey[700],
    shape: isCircle ? BoxShape.circle : BoxShape.rectangle,
  );
}

class SkeletonList extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final int length;
  final double height;
  final double listHigh;
  final double width;

  SkeletonList({
    this.length = 6, //Generally enough screen length
    this.padding = const EdgeInsets.all(7), this.height=170, this.width= 300, this.listHigh=500,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: listHigh,
        child: ListView.builder(
            itemCount: length,
            shrinkWrap: true,
            itemBuilder: (context, index) => Padding(
              padding: padding,
              child: SkeletonBox(width: width, height: height),
            )));
  }
}

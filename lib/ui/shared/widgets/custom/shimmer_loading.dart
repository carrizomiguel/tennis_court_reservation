import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerLoading extends StatelessWidget {
  const ShimmerLoading({
    super.key,
    this.width = double.infinity,
    required this.height,
    this.margin = EdgeInsets.zero,
    this.borderRadius = 0,
    this.baseColor,
    this.highlightColor,
  });

  final double width;
  final double height;
  final EdgeInsetsGeometry margin;
  final double borderRadius;
  final Color? baseColor;
  final Color? highlightColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(borderRadius),
          ),
        ),
        SizedBox(
          width: width,
          height: height,
          child: Shimmer.fromColors(
            baseColor: baseColor ?? Colors.grey.shade200,
            highlightColor:
                highlightColor ?? Colors.grey.shade300.withOpacity(.8),
            child: Container(
              margin: margin,
              width: double.infinity,
              height: height,
              decoration: BoxDecoration(
                color: baseColor ?? Colors.grey.shade400,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

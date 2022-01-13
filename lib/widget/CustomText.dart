import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    required this.text,
    this.color,
    this.fontWeight,
    this.onclick,
    this.size,
    this.wordspacing,
    this.overflow,
    Key? key,
  }) : super(key: key);
  final String text;
  final Color? color;
  final double? size;
  final TextOverflow? overflow;
  final FontWeight? fontWeight;
  final double? wordspacing;
  final VoidCallback? onclick;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: onclick == null
          ? Text(
              text,
              style: TextStyle(
                fontSize: size ?? 18,
                color: color ?? Colors.grey,
                fontWeight: fontWeight ?? FontWeight.w500,
                wordSpacing: wordspacing,
                overflow: overflow,
              ),
            )
          : TextButton(
              onPressed: onclick,
              child: Text(
                text,
                style: TextStyle(
                  fontSize: size ?? 18,
                  color: color ?? Colors.grey,
                  fontWeight: fontWeight ?? FontWeight.w500,
                  wordSpacing: wordspacing,
                ),
              ),
            ),
    );
  }
}

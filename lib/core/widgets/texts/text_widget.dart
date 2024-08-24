import 'package:flutter/material.dart';
import 'package:movies_app/core/config/firebase_movies_app.dart';
import 'package:movies_app/core/config/firebase_movies_app_colors.dart';
import 'package:movies_app/core/config/firebase_movies_app_text_styles.dart';

class TextWidget extends StatelessWidget {
  final String text;
  final TextStyle style;
  final TextAlign? textAlign;
  final Color? color;
  final TextOverflow? overflow;

  const TextWidget(
    this.text, {
    required this.style,
    required this.textAlign,
    required this.color,
    required this.overflow,
    super.key,
  });
TextWidget.bold(
  this.text,{
    super.key,
    TextStyle? textStyle,
    this.textAlign,
    this.color,
    this.overflow
  }
) : style = textStyle ??FirebaseMoviesAppTextStyles.getNormalBoldStyle;

  TextWidget.title(
  this.text,{
    super.key,
    TextStyle? textStyle,
    this.textAlign,
    this.color,
    this.overflow
  }
) : style = textStyle ??FirebaseMoviesAppTextStyles.getTitleStyle;

TextWidget.normal(
  this.text,{
    super.key,
    TextStyle? textStyle,
    this.textAlign,
    this.color,
    this.overflow
  }
) : style = textStyle ??FirebaseMoviesAppTextStyles.getNormalStyle;

TextWidget.small(
  this.text,{
    super.key,
    TextStyle? textStyle,
    this.textAlign,
    this.color,
    this.overflow
  }
) : style = textStyle ??FirebaseMoviesAppTextStyles.getSmallTextStyle;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style.copyWith(
        color: color ?? FirebaseMoviesAppColors.whiteColor,
      ),
      textAlign: textAlign,
      overflow: overflow,
    );
  }
}

import 'package:bloc_demo/src/utils/app_colors.dart';
import 'package:bloc_demo/src/utils/extension/text_style_extension.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String name;
  final double textSize;
  final Color? color;
  final double? vPadding, hPadding;

  const AppButton(
      {Key? key,
      required this.onPressed,
      required this.name,
      required this.textSize,
      this.color,
      this.hPadding,
      this.vPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(18),
          color: color ?? purpleColor,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: hPadding ?? 20,
          vertical: vPadding ?? 8,
        ),
        child: Text(
          name,
          style: const TextStyle()
              .bold
              .copyWith(fontSize: textSize, color: Colors.white),
        ),
      ),
    );
  }
}

class AppTextButton extends StatelessWidget {
  final String text;
  final TextStyle? textStyle;
  final Color? buttonColor;
  final VoidCallback onPressed;

  ///for full width button set Alignment.center
  final Alignment? alignment;
  final EdgeInsets? padding;
  final EdgeInsets? margin;
  final BoxBorder? border;
  final BorderRadiusGeometry? borderRadius;
  final Size? minimumSize;
  final Widget? icon;
  final bool? showLoader;
  final double? width;

  const AppTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.showLoader,
    this.textStyle,
    this.width,
    this.buttonColor,
    this.alignment,
    this.padding,
    this.margin,
    this.border,
    this.icon,
    this.minimumSize,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return showLoader ?? false
        ? Container(
            height: 54,
            alignment: Alignment.center,
            child: const CircularProgressIndicator(),
          )
        : TextButton(
            style: TextButton.styleFrom(
              tapTargetSize: MaterialTapTargetSize.shrinkWrap,
              padding: EdgeInsets.zero,
            ),
            onPressed: onPressed,
            child: Container(
              width: width ?? double.infinity,
              padding: padding ??
                  const EdgeInsets.symmetric(
                    vertical: 12,
                  ),
              decoration: BoxDecoration(
                  border: border,
                  borderRadius: borderRadius ?? BorderRadius.circular(10),
                  color: buttonColor ?? purpleColor),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: textStyle ??
                    const TextStyle().bold.copyWith(
                          color: Colors.white,
                          fontSize: 16,
                        ),
              ),
            ),
          );
  }
}

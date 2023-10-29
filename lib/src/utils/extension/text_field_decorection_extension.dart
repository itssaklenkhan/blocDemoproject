import 'package:bloc_demo/src/utils/app_colors.dart';
import 'package:bloc_demo/src/utils/extension/text_style_extension.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

extension InputDec on InputDecoration {
  InputDecoration txtFieldStyle({required String hintText, required String labelName}) =>
      InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
        constraints: const BoxConstraints(minHeight: 30),
        filled: true,
        counter: const Offstage(),
        fillColor: txtFieldColor,
        hintText: hintText,
        hintStyle: const TextStyle().bold.copyWith(color: hintTxtColor),
        labelText: labelName,
        labelStyle: const TextStyle().bold,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(
            color: txtFieldColor,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(
            color: txtFieldColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide(
            color: txtFieldColor,
          ),
        ),
      );

  InputDecoration searchTxtFieldStyle({double? maxHeight, double? iconSize, String? hint}) =>
      InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 23),
        constraints: BoxConstraints(minHeight: maxHeight ?? 60, maxHeight: maxHeight ?? 60),
        filled: true,
        counter: const Offstage(),
        fillColor: Colors.transparent,
        hintText: hint ?? 'Search',
        hintStyle: const TextStyle().bold.copyWith(fontSize: 14, color: hintTxtColor),
        // suffixIcon: Container(
        //     margin: const EdgeInsets.only(right: 10), child: Image.asset(AppAssets.searchIcon)),
        suffixIconConstraints: BoxConstraints(
          minWidth: 40,
          minHeight: 14,
          maxWidth: 40,
          maxHeight: iconSize ?? 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.black,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.black,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.black,
          ),
        ),
      );

  InputDecoration txtFieldStyle2(
      {required String hintText,
        required String labelName,
        Color? labelColor,
        bool? bottomAlwaysPurple}) =>
      InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(5, 15, 5, 10),
        constraints: const BoxConstraints(minHeight: 45),
        filled: true,
        counter: const Offstage(),
        fillColor: Colors.transparent,
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: 'Light',
          fontSize: 13,
          color: hintTxtColor,
          fontWeight: FontWeight.w300,
        ),
        labelText: labelName,
        labelStyle:
        const TextStyle().regular.copyWith(color: labelColor ?? Colors.black, fontSize: 12),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        border: UnderlineInputBorder(
          borderSide: BorderSide(
              color: bottomAlwaysPurple ?? false ? purpleColor : hintTxtColor, width: 1.25),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
              color: bottomAlwaysPurple ?? false ? purpleColor : hintTxtColor, width: 1.25),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 1.25),
        ),
      );

  InputDecoration profileTxtField(
      {required String hintText,
        required String labelName,
        required String icon,
        Color? iconColor,
        bool? bottomAlwaysPurple}) =>
      InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(5, 15, 5, 10),
        constraints: const BoxConstraints(
          minHeight: 45,
        ),
        filled: true,
        counter: const Offstage(),
        fillColor: Colors.transparent,
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: 'Light',
          fontSize: 13,
          color: hintTxtColor,
          fontWeight: FontWeight.w300,
        ),
        labelText: labelName,
        labelStyle: const TextStyle().regular.copyWith(
          fontSize: 12,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: Container(
          margin: const EdgeInsets.only(top: 15),
          child: Image.asset(
            icon,
            color: iconColor,
            height: 30,
            width: 16,
          ),
        ),
        suffixIconConstraints: const BoxConstraints(
          maxHeight: 30,
          maxWidth: 30,
        ),
        border: UnderlineInputBorder(
          borderSide: BorderSide(
            color: bottomAlwaysPurple ?? false ? purpleColor : hintTxtColor,
            width: 1.25,
          ),
        ),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: bottomAlwaysPurple ?? false ? purpleColor : hintTxtColor,
            width: 1.25,
          ),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 1.25,
          ),
        ),
      );

  InputDecoration iconTxtFieldStyle(
      {double? maxHeight, double? iconSize, String? hint, required IconData icon}) =>
      InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
        constraints: BoxConstraints(minHeight: maxHeight ?? 30, maxHeight: maxHeight ?? 300),
        filled: true,
        counter: const Offstage(),
        fillColor: Colors.white,
        hintText: hint ?? 'Search',
        hintStyle: const TextStyle().medium.copyWith(
          fontSize: 14,
          color: Colors.grey.shade400,
        ),
        suffixIcon: Transform.rotate(
          angle: - math.pi / 4,
          child: Container(
            margin: const EdgeInsets.only(right: 10),
            child: Icon(
              icon,
              color: secondaryColor,
            ),
          ),
        ),
        suffixIconConstraints: BoxConstraints(
          minWidth: 30,
          minHeight: 14,
          maxWidth: 30,
          maxHeight: iconSize ?? 45,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.transparent,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.transparent,

          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 1,
            color: Colors.transparent,
          ),
        ),
      );

  InputDecoration txtFieldStyle3(
      {required String hintText,
        required String labelName,
        Color? labelColor,
        bool? bottomAlwaysPurple}) =>
      InputDecoration(
        contentPadding: const EdgeInsets.fromLTRB(5, 15, 5, 10),
        constraints: const BoxConstraints(minHeight: 45),
        filled: true,
        counter: const Offstage(),
        fillColor: Colors.transparent,
        hintText: hintText,
        hintStyle: TextStyle(
          fontFamily: 'Light',
          fontSize: 13,
          color: Colors.grey.shade400,
          fontWeight: FontWeight.w300,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          // borderSide: BorderSide(
          //   width: 1,
          //   color: blueColor,
          // ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          // borderSide: BorderSide(
          //   width: 1,
          //   color: blueColor,
          // ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          // borderSide: BorderSide(
          //   width: 1,
          //   color: blueColor,
          // ),
        ),
      );
}
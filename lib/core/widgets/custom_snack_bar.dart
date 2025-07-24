import 'package:flutter/material.dart';
import 'package:reco_genie_internship/core/utils/app_fonts.dart';

abstract class CustomSnackBar {
  static void errorSnackBar(String message, context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppFonts.regularBoldBlack14.copyWith(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.red,
      ),
    );
  }

  static void successSnackBar(String message, context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppFonts.regularBoldBlack14.copyWith(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.green,
      ),
    );
  }

  static void confrimEmailSnackBar(String message, context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: AppFonts.regularBoldBlack14.copyWith(color: Colors.white),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}

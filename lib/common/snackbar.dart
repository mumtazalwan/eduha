import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Snack {
  static void showSnackBar(BuildContext context, message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        padding: const EdgeInsets.all(20),
        content: Text(
          message,
          style: GoogleFonts.inter(),
        ),
      ),
    );
  }
}
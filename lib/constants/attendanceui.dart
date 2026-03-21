import 'package:flutter/material.dart';

class AttendanceUi {
  static OutlineInputBorder enabledBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black26, width: 1.2),
    borderRadius: BorderRadius.all(Radius.circular(7.3)),
  );

  static OutlineInputBorder focusedBorder = OutlineInputBorder(
    borderSide: BorderSide(color: Colors.black, width: 2),
    borderRadius: BorderRadius.all(Radius.circular(7.3)),
  );

  static TextStyle headingStyle = TextStyle(
    fontSize: 29.4,
    fontWeight: FontWeight(700),
    color: Colors.black87,
  );

  static TextInputType keyboardType = TextInputType.number;

  static InputDecoration decoration(String label) => InputDecoration(
    label: Text(label),
    labelStyle: TextStyle(fontSize: 18.3, color: Colors.black87),
    contentPadding: EdgeInsets.only(left: 11, top: 12, bottom: 12),
    enabledBorder: enabledBorder,
    focusedBorder: focusedBorder,
  );

  static TextStyle style = TextStyle(fontSize: 20, fontWeight: FontWeight(400));

  static ButtonStyle btnStyle = ElevatedButton.styleFrom(
    backgroundColor: Colors.black87,
    foregroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadiusGeometry.all(Radius.circular(8)),
    ),
  );

  static BoxDecoration boxDecoration = BoxDecoration(
    border: BoxBorder.all(color: Colors.black12.withOpacity(0.07)),
    color: Colors.white.withOpacity(0.52),
    borderRadius: BorderRadius.circular(7),
    boxShadow: [
      BoxShadow(
        color: Colors.black.withOpacity(0.05),
        blurRadius: 15,
        offset: const Offset(0, 8),
      ),
    ],
  );
}

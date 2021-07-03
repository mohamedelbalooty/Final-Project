import 'package:flutter/material.dart';
import '../../constants.dart';

Expanded imageButton(String currentImage, newImage, Function function) {
  return Expanded(
    child: InkWell(
      onTap: function,
      child: Container(
        height: 80.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: KOrangeColor, width: 1.5),
          image: DecorationImage(
            image: newImage == null
                ? ExactAssetImage(currentImage)
                : FileImage(newImage),
          ),
        ),
      ),
    ),
  );
}

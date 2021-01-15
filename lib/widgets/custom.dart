import 'package:flutter/material.dart';

Padding padding() {
  return Padding(padding: EdgeInsets.only(top: 10.0)
  );
}

Text textWithStyle(data, {color: Colors.black, textAlign: TextAlign.center, factor: 1.0, maxLines: 3, fontWeight: FontWeight.bold}) {
  return Text(data,
      textAlign: textAlign,
      textScaleFactor: factor,
      maxLines: maxLines,
      style: TextStyle(
          color: color,
          fontWeight: fontWeight
      )
  );
}
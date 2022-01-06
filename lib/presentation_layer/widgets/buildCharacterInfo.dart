import 'package:breaking_bad/constants/colors.dart';
import 'package:flutter/material.dart';
Widget buildSCharacterInfo(String key,String value)
{
  return RichText(
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
          children: [
            TextSpan(text: key,style: TextStyle(color: white,fontWeight: FontWeight.bold,fontSize: 18)),
            TextSpan(text: value,style: TextStyle(color: white,fontSize: 16))
          ]
      ));
}
import 'package:breaking_bad/constants/colors.dart';
import 'package:flutter/material.dart';
Widget buildDivider(double endIndent)
{
  return Divider(
    height: 30,
    color: yellow,
    endIndent:endIndent ,
    thickness: 2,
  ) ;
}
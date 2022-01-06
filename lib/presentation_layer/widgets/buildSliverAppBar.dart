import 'package:breaking_bad/constants/colors.dart';
import 'package:breaking_bad/data_layer/models/characters.dart';
import 'package:flutter/material.dart';

Widget buildSliverAppBar(Character character)//control in image and text app bar
{
  return SliverAppBar(
    expandedHeight: 600,
    pinned: true,
    stretch: true,
    backgroundColor: gry,
    flexibleSpace: FlexibleSpaceBar(
      //centerTitle: true,
      title: Text(
        '${character.nickname}',
        style: TextStyle(
          color: white,
        ),
      ),
      background: Hero(
        tag: character.char_id!,
        child:Image.network(
          character.img!,
          fit: BoxFit.cover,
        ),
      ),
    ),
  );
}